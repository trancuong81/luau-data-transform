# Luau Formal Grammar (EBNF Summary)

## Program Structure

```
chunk       ::= block
block       ::= {stat [';']} [laststat [';']]
laststat    ::= 'return' [explist] | 'break' | 'continue'
```

## Statements

```
stat ::= varlist '=' explist
       | varlist compoundop explist
       | functioncall
       | 'do' block 'end'
       | 'while' exp 'do' block 'end'
       | 'repeat' block 'until' exp
       | 'if' exp 'then' block {'elseif' exp 'then' block} ['else' block] 'end'
       | 'for' Name '=' exp ',' exp [',' exp] 'do' block 'end'
       | 'for' bindinglist 'in' explist 'do' block 'end'
       | 'function' funcname funcbody
       | 'local' 'function' Name funcbody
       | 'local' bindinglist ['=' explist]
       | ['export'] 'type' Name ['<' GenericTypeList '>'] '=' Type
```

## Compound Operators

```
compoundop ::= '+=' | '-=' | '*=' | '/=' | '//=' | '%=' | '^=' | '..='
```

## Expressions

```
exp ::= asexp {binop exp} | unop exp {binop exp}
asexp ::= simpleexp ['::' Type]

simpleexp ::= NUMBER | STRING | 'nil' | 'true' | 'false' | '...'
            | tableconstructor | 'function' funcbody
            | prefixexp | ifelseexp | stringinterp

prefixexp ::= Name | prefixexp '[' exp ']' | prefixexp '.' Name
            | prefixexp ':' Name funcargs | prefixexp funcargs
            | '(' exp ')'

ifelseexp ::= 'if' exp 'then' exp {'elseif' exp 'then' exp} 'else' exp
```

## Operators

```
binop ::= '+' | '-' | '*' | '/' | '//' | '^' | '%' | '..'
        | '<' | '<=' | '>' | '>=' | '==' | '~='
        | 'and' | 'or'

unop ::= '-' | 'not' | '#'
```

## Functions

```
funcname   ::= Name {'.' Name} [':' Name]
funcbody   ::= ['<' GenericTypeList '>'] '(' [parlist] ')' [':' ReturnType] block 'end'
parlist    ::= bindinglist [',' '...'] | '...'
funcargs   ::= '(' [explist] ')' | tableconstructor | STRING
```

## Tables

```
tableconstructor ::= '{' [fieldlist] '}'
fieldlist ::= field {fieldsep field} [fieldsep]
field    ::= '[' exp ']' '=' exp | Name '=' exp | exp
fieldsep ::= ',' | ';'
```

## Type Annotations

```
Type ::= SimpleType | SimpleType '?' | SimpleType '|' Type | SimpleType '&' Type
SimpleType ::= 'nil' | Name ['.' Name] ['<' TypeParams '>']
             | 'typeof' '(' exp ')'
             | TableType | FunctionType | StringType | BooleanType

TableType    ::= '{' [TableProp {',' TableProp} [',']] '}'
TableProp    ::= Name ':' Type | '[' Type ']' ':' Type
FunctionType ::= ['<' GenericTypeList '>'] '(' [TypeList] ')' '->' ReturnType
ReturnType   ::= Type | '(' TypeList ')'

GenericTypeList ::= GenericType {',' GenericType}
GenericType     ::= Name ['...' ] ['=' Type]
```

## String Interpolation

```
stringinterp ::= '`' {interpfragment | interpexp} '`'
interpfragment ::= INTERP_TEXT
interpexp      ::= '{' exp '}'
```
