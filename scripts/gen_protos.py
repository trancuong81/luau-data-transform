#!/usr/bin/env python3
"""Generate .proto and _constants.json files from CUE JSON table exports."""

import json
import sys
from pathlib import Path
from typing import Any

# rawValue.typeId → proto message name
RAW_TYPE_TO_PROTO = {
    "String": "StringType",
    "MultipleCheckbox": "MultipleCheckboxType",
}

# Source table array indices → (file_prefix, message_prefix)
SOURCE_TABLE_MAP = {
    0: ("source_contact_table", "SourceContactTable"),
    1: ("source_w9_table", "SourceW9Table"),
    2: ("source_feeder_table", "SourceFeederTable"),
    3: ("source_master_table", "SourceMasterTable"),
}


def snake_to_pascal(s: str) -> str:
    """Convert snake_case to PascalCase. E.g., lp_signatory -> LpSignatory."""
    return "".join(word.capitalize() for word in s.split("_"))


def get_proto_type(raw_value: dict) -> str:
    """Determine proto message type from rawValue."""
    type_id = raw_value.get("typeId", "")
    return RAW_TYPE_TO_PROTO.get(type_id, "StringType")


def is_compound(raw_value: dict) -> bool:
    """Check if rawValue represents a compound field (map of sub-fields)."""
    non_meta_keys = [k for k in raw_value if k not in ("typeId", "allValues")]
    if not non_meta_keys:
        return False
    first_val = raw_value.get(non_meta_keys[0])
    return isinstance(first_val, dict) and "typeId" in first_val


def extract_options(raw_value: dict) -> tuple[list[str], list[str]] | None:
    """Extract option keys and labels from MultipleCheckbox/RadioGroup rawValue."""
    all_values = raw_value.get("allValues")
    if not all_values or not isinstance(all_values, list):
        return None
    keys = [v["key"] for v in all_values if "key" in v]
    labels = [v.get("label", "") for v in all_values]
    if any(labels):
        return keys, labels
    return keys, []


def emit_proto_header() -> str:
    """Emit proto file header with imports and generator option."""
    return (
        'syntax = "proto3";\n'
        "\n"
        "package ocaml_data_transform;\n"
        "\n"
        'import "data_types.proto";\n'
        'import "luauoptions/luau_options.proto";\n'
        "\n"
        'option (luau.luau_generator) = "schema";\n'
    )


def emit_compound_pair(
    msg_prefix: str, field_name: str, raw_value: dict, field_number_start: int = 1
) -> tuple[str, str]:
    """Emit *Fields and *Type messages for a compound field.

    Returns (proto_text, wrapper_message_name).
    """
    pascal_name = snake_to_pascal(field_name)
    fields_msg = f"{msg_prefix}{pascal_name}Fields"
    type_msg = f"{msg_prefix}{pascal_name}Type"

    lines = [f"message {fields_msg} {{"]
    field_num = field_number_start
    for sf_name, sf_val in raw_value.items():
        if not isinstance(sf_val, dict) or "typeId" not in sf_val:
            continue
        sf_raw = sf_val.get("rawValue", {})
        proto_type = get_proto_type(sf_raw) if isinstance(sf_raw, dict) else "StringType"
        lines.append(f"  {proto_type} {sf_name} = {field_num};")
        field_num += 1
    lines.append("}")
    lines.append("")

    lines.append(f"message {type_msg} {{")
    lines.append("  string type_id = 1;")
    lines.append(f"  {fields_msg} value_sub_fields = 2;")
    lines.append("  repeated string sub_field_keys_in_order = 3;")
    lines.append("  string label = 4;")
    lines.append("}")

    return "\n".join(lines), type_msg


def emit_fields_map_and_schema(
    msg_prefix: str, fields: list[dict], compound_type_map: dict[str, str]
) -> str:
    """Emit FieldsMap and Schema messages."""
    lines = [f"message {msg_prefix}FieldsMap {{"]
    field_num = 1
    for field in fields:
        name = field["fieldName"]
        vs = field["valueSchema"]
        rv = vs.get("rawValue", {})

        if isinstance(rv, dict) and is_compound(rv):
            proto_type = compound_type_map[name]
        else:
            proto_type = get_proto_type(rv) if isinstance(rv, dict) else "StringType"

        lines.append(f"  {proto_type} {name} = {field_num};")
        field_num += 1
    lines.append("}")
    lines.append("")

    lines.append(f"message {msg_prefix}Schema {{")
    lines.append(f"  {msg_prefix}FieldsMap fields_map = 1;")
    lines.append("  repeated string field_keys_in_order = 2;")
    lines.append("  string label = 3;")
    lines.append("}")

    return "\n".join(lines)


def build_field_constants(field: dict) -> dict:
    """Build constants entry for a single field."""
    vs = field["valueSchema"]
    rv = vs.get("rawValue", {})

    if isinstance(rv, dict) and is_compound(rv):
        sub_fields = {}
        sub_keys_order = []
        for sf_name, sf_val in rv.items():
            if not isinstance(sf_val, dict) or "typeId" not in sf_val:
                continue
            sf_entry: dict[str, Any] = {"type_id": sf_val["typeId"]}
            sf_raw = sf_val.get("rawValue", {})
            if isinstance(sf_raw, dict):
                opts = extract_options(sf_raw)
                if opts:
                    sf_entry["all_option_keys_in_order"] = opts[0]
                    if opts[1]:
                        sf_entry["all_option_labels_in_order"] = opts[1]
            sub_fields[sf_name] = sf_entry
            sub_keys_order.append(sf_name)

        return {
            "type_id": "CustomCompound",
            "value_sub_fields": sub_fields,
            "sub_field_keys_in_order": sub_keys_order,
        }

    entry: dict[str, Any] = {"type_id": vs["typeId"]}

    if isinstance(rv, dict):
        opts = extract_options(rv)
        if opts:
            entry["all_option_keys_in_order"] = opts[0]
            if opts[1]:
                entry["all_option_labels_in_order"] = opts[1]

    return entry


def build_table_constants(fields: list[dict], label: str) -> dict:
    """Build full constants JSON for a table."""
    fields_map = {}
    field_keys_order = []

    for field in fields:
        name = field["fieldName"]
        fields_map[name] = build_field_constants(field)
        field_keys_order.append(name)

    return {
        "fields_map": fields_map,
        "field_keys_in_order": field_keys_order,
        "label": label,
    }


def generate_table(
    fields: list[dict], label: str, file_prefix: str, msg_prefix: str, output_dir: Path
) -> None:
    """Generate .proto and _constants.json for a single table."""
    proto_parts = [emit_proto_header()]
    compound_type_map: dict[str, str] = {}

    for field in fields:
        rv = field["valueSchema"].get("rawValue", {})
        if isinstance(rv, dict) and is_compound(rv):
            pair_text, wrapper_name = emit_compound_pair(msg_prefix, field["fieldName"], rv)
            proto_parts.append(pair_text)
            compound_type_map[field["fieldName"]] = wrapper_name

    proto_parts.append(emit_fields_map_and_schema(msg_prefix, fields, compound_type_map))

    proto_path = output_dir / f"{file_prefix}.proto"
    proto_path.write_text("\n".join(proto_parts) + "\n")
    print(f"  wrote {proto_path} ({len(fields)} fields, {len(compound_type_map)} compounds)")

    constants = build_table_constants(fields, label)
    constants_path = output_dir / f"{file_prefix}_constants.json"
    constants_path.write_text(json.dumps(constants, indent=2) + "\n")
    print(f"  wrote {constants_path}")


def main() -> None:
    if len(sys.argv) < 3:
        print("Usage: gen_protos.py <source_json> <target_json> [output_dir]")
        sys.exit(1)

    source_path = Path(sys.argv[1])
    target_path = Path(sys.argv[2])
    output_dir = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("proto/tables")

    output_dir.mkdir(parents=True, exist_ok=True)

    with open(source_path) as f:
        source_tables = json.load(f)

    print(f"Processing {len(source_tables)} source tables...")
    for idx, (file_prefix, msg_prefix) in SOURCE_TABLE_MAP.items():
        table = source_tables[idx]
        print(f"\n{table['label']}:")
        generate_table(table["fields"], table["label"], file_prefix, msg_prefix, output_dir)

    with open(target_path) as f:
        target_table = json.load(f)

    print(f"\n{target_table['label']}:")
    generate_table(
        target_table["fields"],
        target_table["label"],
        "full_target_table",
        "FullTargetTable",
        output_dir,
    )

    print("\nDone.")


if __name__ == "__main__":
    main()
