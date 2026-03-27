--!strict
local DataTypes = require("@lib/data_types")

local SourceMasterTable = {}

export type SourceMasterTableAdditionalrepresentationsSignatoryFields = {
	subscribernameAddtionalrepresentations: DataTypes.StringType?,
	signornameAddtionalrepresentations: DataTypes.StringType?,
	signortitleAddtionalrepresentations: DataTypes.StringType?,
}

export type SourceMasterTableAdditionalrepresentationsSignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableAdditionalrepresentationsSignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableAddressUbo0Fields = {
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	countryResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	zipResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	cityResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
}

export type SourceMasterTableAddressUbo0Type = {
	typeId: string,
	valueSubFields: SourceMasterTableAddressUbo0Fields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableAddressUbo1Fields = {
	countryResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	zipResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	cityResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
}

export type SourceMasterTableAddressUbo1Type = {
	typeId: string,
	valueSubFields: SourceMasterTableAddressUbo1Fields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableAddressUbo2Fields = {
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	countryResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	zipResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	cityResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
}

export type SourceMasterTableAddressUbo2Type = {
	typeId: string,
	valueSubFields: SourceMasterTableAddressUbo2Fields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableAddressUbo3Fields = {
	cityResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	countryResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	zipResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
}

export type SourceMasterTableAddressUbo3Type = {
	typeId: string,
	valueSubFields: SourceMasterTableAddressUbo3Fields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableAddressUboFields = {
	zipResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	cityResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	countryResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
}

export type SourceMasterTableAddressUboType = {
	typeId: string,
	valueSubFields: SourceMasterTableAddressUboFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableBrokeragefirmFields = {
	countryBrokerageaccountWireinfo: DataTypes.StringType?,
	firmnameBrokerageaccountWireinfo: DataTypes.StringType?,
	zipBrokerageaccountWireinfo: DataTypes.StringType?,
	accountnameBrokerageaccountWireinfo: DataTypes.StringType?,
	stateBrokerageaccountWireinfo: DataTypes.StringType?,
	dtcnumberBrokerageaccountWireinfo: DataTypes.StringType?,
	accountnumberBrokerageaccountWireinfo: DataTypes.StringType?,
	cityBrokerageaccountWireinfo: DataTypes.StringType?,
	addressBrokerageaccountWireinfo: DataTypes.StringType?,
}

export type SourceMasterTableBrokeragefirmType = {
	typeId: string,
	valueSubFields: SourceMasterTableBrokeragefirmFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableCanadianSignatoryFields = {
	dateSignaturepageCanadianiqs: DataTypes.StringType?,
	investornameSignaturepageCanadianiqs: DataTypes.StringType?,
	provinceofresidentSignaturepageCanadianiqs: DataTypes.StringType?,
	authorizedsignatorynameSignaturepageCanadianiqs: DataTypes.StringType?,
}

export type SourceMasterTableCanadianSignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableCanadianSignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableClientquestionnairePart1SignatoryFields = {
	signernamePart1Duediligencequestionnaire: DataTypes.StringType?,
	datePart1Duediligencequestionnaire: DataTypes.StringType?,
}

export type SourceMasterTableClientquestionnairePart1SignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableClientquestionnairePart1SignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableClientquestionnairePart2SignatoryFields = {
	signernamePart2Duediligencequestionnaire: DataTypes.StringType?,
	datePart2Duediligencequestionnaire: DataTypes.StringType?,
}

export type SourceMasterTableClientquestionnairePart2SignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableClientquestionnairePart2SignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableLpSignatoryFields = {
	entityAuthorizedtitleSignaturepage: DataTypes.StringType?,
	dateSignaturepage: DataTypes.StringType?,
	entitySubscribernameSignaturepage: DataTypes.StringType?,
	asaCommitmentAmount: DataTypes.StringType?,
	entityAuthorizednameSignaturepage: DataTypes.StringType?,
	individualSubscribernameSignaturepage: DataTypes.StringType?,
}

export type SourceMasterTableLpSignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableLpSignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableLuxGpSignatoryFields = {
	nameFirstauthorizedsignatoryCapluxGpsignaturepage: DataTypes.StringType?,
	nameSecondauthorizedsignatoryCapluxGpsignaturepage: DataTypes.StringType?,
	titleFirstauthorizedsignatoryCapluxGpsignaturepage: DataTypes.StringType?,
	titleSecondauthorizedsignatoryCapluxGpsignaturepage: DataTypes.StringType?,
}

export type SourceMasterTableLuxGpSignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableLuxGpSignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableMainGpSignatoryFields = {
	acceptedcommitmentGpsignaturepage: DataTypes.StringType?,
	nameFirstauthorizedsignatoryGpsignaturepage: DataTypes.StringType?,
	titleFirstauthorizedsignatoryGpsignaturepage: DataTypes.StringType?,
}

export type SourceMasterTableMainGpSignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableMainGpSignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTablePlaceofbusinessEntityFields = {
	asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	asaCityCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	asaCountryCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	asaStateCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	asaZipCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
}

export type SourceMasterTablePlaceofbusinessEntityType = {
	typeId: string,
	valueSubFields: SourceMasterTablePlaceofbusinessEntityFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableResidentialaddressIndividualFields = {
	asaZipCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	asaCityCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	asaStateCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	asaCountryCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
}

export type SourceMasterTableResidentialaddressIndividualType = {
	typeId: string,
	valueSubFields: SourceMasterTableResidentialaddressIndividualFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableTaxowner2SignatoryFields = {
	nameTaxownerExhibitk: DataTypes.StringType?,
	dateTaxownerExhibitk: DataTypes.StringType?,
}

export type SourceMasterTableTaxowner2SignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableTaxowner2SignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableTaxownerSignatoryFields = {
	nameTaxownerAnnex1: DataTypes.StringType?,
	dateTaxownerAnnex1: DataTypes.StringType?,
}

export type SourceMasterTableTaxownerSignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableTaxownerSignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableWireinstructionsFields = {
	asaBanklocationWireinstructionstoWireinfo: DataTypes.StringType?,
	beneficiaryaddressWireinstructiontoWireinfo: DataTypes.StringType?,
	asaIntermediaryabaWireinstructionstoWireinfo: DataTypes.StringType?,
	asaIntermediaryswiftWireinstructionstoWireinfo: DataTypes.StringType?,
	asaFurthercreditaccountWireinstructionstoWireinfo: DataTypes.StringType?,
	asaIbanWireinstructionstoWireinfo: DataTypes.StringType?,
	asaFurthercreditnameWireinstructionstoWireinfo: DataTypes.StringType?,
	asaAccountnameWireinstructionstoWireinfo: DataTypes.StringType?,
	asaAbaWireinstructionstoWireinfo: DataTypes.StringType?,
	asaSwiftWireinstructionstoWireinfo: DataTypes.StringType?,
	asaAccountnumberWireinstructionstoWireinfo: DataTypes.StringType?,
	asaBanknameWireinstructionstoWireinfo: DataTypes.StringType?,
	intermediarybankcountryWireinstructionstoWireinfo: DataTypes.StringType?,
	asaIntermediarybanknameWireinstructionstoWireinfo: DataTypes.StringType?,
	currencyWireinstructiontoWireinfo: DataTypes.StringType?,
}

export type SourceMasterTableWireinstructionsType = {
	typeId: string,
	valueSubFields: SourceMasterTableWireinstructionsFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableWitness2SignatoryFields = {
	nameWitnessExhibitk: DataTypes.StringType?,
	dateWitnessExhibitk: DataTypes.StringType?,
}

export type SourceMasterTableWitness2SignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableWitness2SignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableWitnessSignatoryFields = {
	witnessednameTaxownerAnnex1: DataTypes.StringType?,
	witnesseddateTaxownerAnnex1: DataTypes.StringType?,
}

export type SourceMasterTableWitnessSignatoryType = {
	typeId: string,
	valueSubFields: SourceMasterTableWitnessSignatoryFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type SourceMasterTableFieldsMap = {
	asaFullnameInvestornameGeneralinfo: DataTypes.StringType?,
	lpSignatory: SourceMasterTableLpSignatoryType?,
	mainGpSignatory: SourceMasterTableMainGpSignatoryType?,
	luxGpSignatory: SourceMasterTableLuxGpSignatoryType?,
	dateGpsignaturepage: DataTypes.StringType?,
	taxownerSignatory: SourceMasterTableTaxownerSignatoryType?,
	witnessSignatory: SourceMasterTableWitnessSignatoryType?,
	asaFullnameInvestornameAmlquestionnaire: DataTypes.StringType?,
	jointaccountholdersnamesPart1Duediligencequestionnaire: DataTypes.StringType?,
	asaDateofbirthIndividualAmlquestionnaire: DataTypes.StringType?,
	asaPlaceofbirthIndividualAmlquestionnaire: DataTypes.StringType?,
	ssnorftiorppnoPart1Duediligencequestionnaire: DataTypes.StringType?,
	asaNationalityIndividualAmlquestionnaire: DataTypes.StringType?,
	asaFulladdressCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	residentialaddressIndividual: SourceMasterTableResidentialaddressIndividualType?,
	indiInternationalsupplementsPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	asaOccupationIndividualAmlquestionnaire: DataTypes.StringType?,
	professionalactivityAndTitleIndividualAmlquestionnaire: DataTypes.StringType?,
	nameofemployerPart1Duediligencequestionnaire: DataTypes.StringType?,
	addressofemployerPart1Duediligencequestionnaire: DataTypes.StringType?,
	sourceofwealthPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	nomineePart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	categoryNomineePart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	specifyotherCategoryNomineePart1Duediligencequestionnaire: DataTypes.StringType?,
	affiliatedPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	nameAffiliatedPart1Duediligencequestionnaire: DataTypes.StringType?,
	asaPoliticallyexposedpersonsAmlquestionnaire: DataTypes.MultipleCheckboxType?,
	clientquestionnairePart1Signatory: SourceMasterTableClientquestionnairePart1SignatoryType?,
	asaFullnameInvestornameGeneralinfo1: DataTypes.StringType?,
	tradenamePart2Duediligencequestionnaire: DataTypes.StringType?,
	jurisdictionoforganizationPart2Duediligencequestionnaire: DataTypes.StringType?,
	asaDateofestablishmentEntityAmlquestionnaire: DataTypes.StringType?,
	purposeofbusinessEntityAmlquestionnaire: DataTypes.StringType?,
	asaFulladdressCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	placeofbusinessEntity: SourceMasterTablePlaceofbusinessEntityType?,
	entityInternationalsupplementsPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	websitePart2Duediligencequestionnaire: DataTypes.StringType?,
	tinPart2Duediligencequestionnaire: DataTypes.StringType?,
	sourceoffundsPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	legalformofentityPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	specificotherLegalformofentityPart2Duediligencequestionnaire: DataTypes.StringType?,
	trustPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	asaFormpfFormpf: DataTypes.MultipleCheckboxType?,
	asaSpecifyOtherFormpf: DataTypes.StringType?,
	financialinstitutionRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire: DataTypes.StringType?,
	departmentRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	entityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	luxsentityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.StringType?,
	tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.StringType?,
	goventityPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	nomineePart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	categoryNomineePart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	specificrepresentativeCategoryNomineePart2Duediligencequestionnaire: DataTypes.StringType?,
	affiliatedPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	indicateAffiliatedPart2Duediligencequestionnaire: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	addressUbo: SourceMasterTableAddressUboType?,
	idBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	addressUbo0: SourceMasterTableAddressUbo0Type?,
	idBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	addressUbo1: SourceMasterTableAddressUbo1Type?,
	idBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	addressUbo2: SourceMasterTableAddressUbo2Type?,
	idBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	addressUbo3: SourceMasterTableAddressUbo3Type?,
	idBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	clientquestionnairePart2Signatory: SourceMasterTableClientquestionnairePart2SignatoryType?,
	asaFullnameInvestornameGeneralinfo2: DataTypes.StringType?,
	wireInstructions: SourceMasterTableWireinstructionsType?,
	nameofsubscriberWireinstructiontoPart3Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	brokerageFirm: SourceMasterTableBrokeragefirmType?,
	typeofownershipIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaAccreditedinvestorAccreditedinvestor: DataTypes.MultipleCheckboxType?,
	qualifiedpurchaserIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	uspersonIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	qualifiedclientIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	notinvest1100IndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	taxtreatmentTaxmatterIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	explainotherTaxtreatmentTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	ustinorssnTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	ustinorssnTaxmatterIndividualsInvestorquestionnaire0: DataTypes.StringType?,
	uktaxrefTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	uktaxrefTaxmatterIndividualsInvestorquestionnaire0: DataTypes.StringType?,
	nonustinTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	nonustinTaxmatterIndividualsInvestorquestionnaire0: DataTypes.StringType?,
	countrynonustinTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	countrynonustinTaxmatterIndividualsInvestorquestionnaire0: DataTypes.StringType?,
	disregardedentityTaxmatterIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	nameTaxownerTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	countryTaxownerTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	taxidTaxownerTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	staeTaxownerTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	noncooperativejurisdictionsIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	electingfeepartnerIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	skipFinraIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	finraIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	brokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	immediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	nameemployedImmediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaire: DataTypes.StringType?,
	personsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	immediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	specifynameImmediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaire: DataTypes.StringType?,
	publiccompanyFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	asaConvictedlast10yearsBadactor: DataTypes.MultipleCheckboxType?,
	asaSubjecttojudgementlast5yearsBadactor: DataTypes.MultipleCheckboxType?,
	asaSubjecttofinalorderBadactor: DataTypes.MultipleCheckboxType?,
	asaSubjecttosecorder15bor15cBadactor: DataTypes.MultipleCheckboxType?,
	asaSubjecttosecorderpast5yearsBadactor: DataTypes.MultipleCheckboxType?,
	asaSuspendedmembershipBadactor: DataTypes.MultipleCheckboxType?,
	asaUnderwriterBadactor: DataTypes.MultipleCheckboxType?,
	asaUspsfalserepresentationBadactor: DataTypes.MultipleCheckboxType?,
	notsubjectS506dregulationdIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	subscriberacknowledgesIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaAccreditedinvestorAccreditedinvestor1: DataTypes.MultipleCheckboxType?,
	nameofplanfiduciaryAccreditedinvestorEntityInvestorquestionnaire: DataTypes.StringType?,
	voluntaryEmployeebenefitplanEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	registerrequiredEmployeebenefitplanEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	permitEmployeebenefitplanEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaQualifiedpurchaserQualifiedpurchaser: DataTypes.MultipleCheckboxType?,
	purposeEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	lessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	howmanylessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire: DataTypes.StringType?,
	morethan10countasNumberofbeneficialownersEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	howmanymorethan10countasNumberofbeneficialownersEntityInvestorquestionnaire: DataTypes.StringType?,
	asaJurisdictionoftaxresidencyGeneralinfo: DataTypes.StringType?,
	jurisdictionyearendTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	usyearendTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	taxstatusTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	exemptTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	treatmentTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	explainotherTreatmentTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	indicatedisregardedTreatmentTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	morethan50percentPartnershipsTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	satisfy100partnerlimitationPartnershipsTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	percentTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	foreignsovereignTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	caipartnerTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	s511TaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	onwerexemptS511TaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	taxexemptlpTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	entitledTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	subtypeEntitledTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	usgovernmentpersonEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	nonusNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	usgovernmentalTaxcreditEntityInvestorquestionnaire: DataTypes.StringType?,
	taxexemptTaxcreditEntityInvestorquestionnaire: DataTypes.StringType?,
	taxableusTaxcreditEntityInvestorquestionnaire: DataTypes.StringType?,
	nonusTaxcreditEntityInvestorquestionnaire: DataTypes.StringType?,
	prohibitforeignentityEntityInvestorquestionnaire: DataTypes.StringType?,
	noncooperativejurisdictionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	fiscallytransparentS894benefitsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	withholdingqualifiedholderEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	planassetsErisaEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaErisaErisa: DataTypes.MultipleCheckboxType?,
	percentofassetErisaEntityInvestorquestionnaire: DataTypes.StringType?,
	otherentityErisaEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	lessthan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire: DataTypes.StringType?,
	morethan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire: DataTypes.StringType?,
	controllinginfluenceCheckyesornoEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	publicaccesslawmattersEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	seperatelegalpersonalityAdditionalquestionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	interestsAdditionalquestionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	avoidregistrationAdditionalquestionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	consentAdditionalquestionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	restrictedpersonorcoveredpersonNewissuesEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	generalexemptionsNewissuesEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	allocateprofitsorlossesOtherentityGeneralexemptionsNewissuesEntityInvestorquestionnaire: DataTypes.StringType?,
	restrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	brokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	immediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	nameemployedImmediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire: DataTypes.StringType?,
	personowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	immediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	brokerdealernameImmediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire: DataTypes.StringType?,
	publiccompanyRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	electingfeepartnerEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	commit1100EntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	qualifiedclientEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaBhcSpecialentities: DataTypes.MultipleCheckboxType?,
	governmentalplanBhc: DataTypes.MultipleCheckboxType?,
	asaConvictedlast10yearsBadactor1: DataTypes.MultipleCheckboxType?,
	asaSubjecttojudgementlast5yearsBadactor1: DataTypes.MultipleCheckboxType?,
	asaSubjecttofinalorderBadactor1: DataTypes.MultipleCheckboxType?,
	asaSubjecttosecorder15bor15cBadactor1: DataTypes.MultipleCheckboxType?,
	asaSubjecttosecorderpast5yearsBadactor1: DataTypes.MultipleCheckboxType?,
	asaSuspendedmembershipBadactor1: DataTypes.MultipleCheckboxType?,
	asaUnderwriterBadactor1: DataTypes.MultipleCheckboxType?,
	asaUspsfalserepresentationBadactor1: DataTypes.MultipleCheckboxType?,
	notsubject506dofregulationdEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	beenrefferedThirdpartyreferralsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	nameBeenrefferedThirdpartyreferralsEntityInvestorquestionnaire: DataTypes.StringType?,
	signeddisclosurestatementThirdpartyreferralsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	subscriberacknowledgesEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	subscribernameConsentstatement: DataTypes.StringType?,
	nameAuthorizedsignatoryConsentstatement: DataTypes.StringType?,
	titleAuthorizedsignatoryConsentstatement: DataTypes.StringType?,
	nameAuthorizedsignatory2Consentstatement: DataTypes.StringType?,
	titleAuthorizedsignatory2Consentstatement: DataTypes.StringType?,
	dateAuthorizedsignatoryConsentstatement: DataTypes.StringType?,
	dateAuthorizedsignatory2Consentstatement: DataTypes.StringType?,
	transparentordisregardedSection1Exhibite: DataTypes.MultipleCheckboxType?,
	taxableSection1Exhibite: DataTypes.MultipleCheckboxType?,
	section2Exhibite: DataTypes.MultipleCheckboxType?,
	domiciledoregisteredineeaEeaiqs: DataTypes.MultipleCheckboxType?,
	specifyDomiciledoregisteredineeaEeaiqs: DataTypes.StringType?,
	onbehalfEeaiqs: DataTypes.MultipleCheckboxType?,
	nameOnbehalfEeaiqs: DataTypes.StringType?,
	positionOnbehalfEeaiqs: DataTypes.StringType?,
	corporateOnbehalfEeaiqs: DataTypes.StringType?,
	stateOnbehalfEeaiqs: DataTypes.StringType?,
	representEearepandrequest: DataTypes.MultipleCheckboxType?,
	groupRepresentEearepandrequest: DataTypes.MultipleCheckboxType?,
	natureAntherinstitutionalinvestorRepresentEearepandrequest: DataTypes.StringType?,
	groupLargeundertakingRepresentEearepandrequest: DataTypes.MultipleCheckboxType?,
	electiveprofessionalcriteriaEearepandrequest: DataTypes.MultipleCheckboxType?,
	proinvestorstatusUkrepandrequest: DataTypes.MultipleCheckboxType?,
	groupProinvestorstatusUkrepandrequest: DataTypes.MultipleCheckboxType?,
	natureAntherinstitutionalinvestorProinvestorstatusUkrepandrequest: DataTypes.StringType?,
	groupLargeundertakingProinvestorstatusUkrepandrequest: DataTypes.MultipleCheckboxType?,
	electiveprofessionalcriteriaUkrepandrequest: DataTypes.MultipleCheckboxType?,
	representUkiqs: DataTypes.MultipleCheckboxType?,
	groupInvestmentproRepresentUkiqs: DataTypes.MultipleCheckboxType?,
	groupPersonInvestmentproRepresentUkiqs: DataTypes.MultipleCheckboxType?,
	groupHighnetworthRepresentUkiqs: DataTypes.MultipleCheckboxType?,
	groupCorporateHighnetworthRepresentUkiqs: DataTypes.MultipleCheckboxType?,
	regularqualifiedinvestorsSwissinvestorAppendixb: DataTypes.MultipleCheckboxType?,
	typesLargeundertakingRegularqualifiedinvestorsScheduleh: DataTypes.MultipleCheckboxType?,
	electedqualifiedinvestorsSchedulehAppendixb: DataTypes.MultipleCheckboxType?,
	swissexemptSchedulehAppendixb: DataTypes.MultipleCheckboxType?,
	provinceresidentCanadianiqs: DataTypes.StringType?,
	isaccreditedinvestorCanadianiqs: DataTypes.MultipleCheckboxType?,
	ispermittedclientCanadianiqs: DataTypes.MultipleCheckboxType?,
	accredittedinvestorCanadiansupplement: DataTypes.MultipleCheckboxType?,
	permittedclientrepresentationCanadiansupplement: DataTypes.MultipleCheckboxType?,
	canadianSignatory: SourceMasterTableCanadianSignatoryType?,
	qualifiedinstitutionalinvestorstatusJapanregulations: DataTypes.MultipleCheckboxType?,
	nonqualifiedinstitutionalinvestorstatusJapanregulations: DataTypes.MultipleCheckboxType?,
	collectiveinvestmentschemeorspecialpurposecoJapanregulations: DataTypes.MultipleCheckboxType?,
	typeYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations: DataTypes.StringType?,
	numberofqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations: DataTypes.StringType?,
	numberofnonqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations: DataTypes.StringType?,
	professionalinvestorstatusJapanregulations: DataTypes.MultipleCheckboxType?,
	treatasgeneralinvestorYesProfessionalinvestorstatusJapanregulations: DataTypes.MultipleCheckboxType?,
	totalassetsStatusofassetsProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	netassetsStatusofassetsProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	financialassetsStatusofassetsProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	forcollectiveinvestmentschemeInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	forothersecuritiesInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	purposeoftransactionAmlJapanregulations: DataTypes.MultipleCheckboxType?,
	specifyOtherPurposeoftransactionAmlJapanregulations: DataTypes.StringType?,
	businessofinvestorAmlJapanregulations: DataTypes.MultipleCheckboxType?,
	specifyOtherBusinessofinvestorAmlJapanregulations: DataTypes.StringType?,
	occupationofinvestorAmlJapanregulations: DataTypes.MultipleCheckboxType?,
	specifyOtherOccupationofinvestorAmlJapanregulations: DataTypes.StringType?,
	taxcreditWarranties: DataTypes.MultipleCheckboxType?,
	subscribernameTaxcreditWarranties: DataTypes.StringType?,
	taxowner2Signatory: SourceMasterTableTaxowner2SignatoryType?,
	witness2Signatory: SourceMasterTableWitness2SignatoryType?,
	qualifiedbusinessSupplementalforeign: DataTypes.MultipleCheckboxType?,
	morethan50percstockSupplementalforeign: DataTypes.MultipleCheckboxType?,
	section9901Supplementalforeign: DataTypes.MultipleCheckboxType?,
	chinesemilitarySupplementalforeign: DataTypes.MultipleCheckboxType?,
	entitylistrequiredSupplementalforeign: DataTypes.MultipleCheckboxType?,
	section154bSupplementalforeign: DataTypes.MultipleCheckboxType?,
	dateAddtionalrepresentations: DataTypes.StringType?,
	letterSubscribernameAddtionalrepresentations: DataTypes.StringType?,
	naturalpersonAddtionalrepresentations: DataTypes.StringType?,
	entityAddtionalrepresentations: DataTypes.StringType?,
	additionalrepresentationsSignatory: SourceMasterTableAdditionalrepresentationsSignatoryType?,
}

export type SourceMasterTableSchema = {
	fieldsMap: SourceMasterTableFieldsMap?,
	fieldKeysInOrder: {string},
	label: string,
}

function SourceMasterTable.makeSourceMasterTableAdditionalrepresentationsSignatoryFields(config: {
	subscribernameAddtionalrepresentations: DataTypes.StringType?,
	signornameAddtionalrepresentations: DataTypes.StringType?,
	signortitleAddtionalrepresentations: DataTypes.StringType?,
}?): SourceMasterTableAdditionalrepresentationsSignatoryFields
	local c = config or {}
	return {
		subscribernameAddtionalrepresentations = c.subscribernameAddtionalrepresentations,
		signornameAddtionalrepresentations = c.signornameAddtionalrepresentations,
		signortitleAddtionalrepresentations = c.signortitleAddtionalrepresentations,
	}
end

function SourceMasterTable.makeSourceMasterTableAdditionalrepresentationsSignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableAdditionalrepresentationsSignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableAdditionalrepresentationsSignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUbo0Fields(config: {
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	countryResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	zipResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	cityResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
}?): SourceMasterTableAddressUbo0Fields
	local c = config or {}
	return {
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire0 = c.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire0,
		countryResidentialaddressBeneficialownerAmlquestionnaire0 = c.countryResidentialaddressBeneficialownerAmlquestionnaire0,
		zipResidentialaddressBeneficialownerAmlquestionnaire0 = c.zipResidentialaddressBeneficialownerAmlquestionnaire0,
		stateResidentialaddressBeneficialownerAmlquestionnaire0 = c.stateResidentialaddressBeneficialownerAmlquestionnaire0,
		cityResidentialaddressBeneficialownerAmlquestionnaire0 = c.cityResidentialaddressBeneficialownerAmlquestionnaire0,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUbo0Type(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableAddressUbo0Fields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableAddressUbo0Type
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUbo1Fields(config: {
	countryResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	zipResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	cityResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
}?): SourceMasterTableAddressUbo1Fields
	local c = config or {}
	return {
		countryResidentialaddressBeneficialownerAmlquestionnaire1 = c.countryResidentialaddressBeneficialownerAmlquestionnaire1,
		stateResidentialaddressBeneficialownerAmlquestionnaire1 = c.stateResidentialaddressBeneficialownerAmlquestionnaire1,
		zipResidentialaddressBeneficialownerAmlquestionnaire1 = c.zipResidentialaddressBeneficialownerAmlquestionnaire1,
		cityResidentialaddressBeneficialownerAmlquestionnaire1 = c.cityResidentialaddressBeneficialownerAmlquestionnaire1,
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire1 = c.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire1,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUbo1Type(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableAddressUbo1Fields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableAddressUbo1Type
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUbo2Fields(config: {
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	countryResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	zipResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	cityResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
}?): SourceMasterTableAddressUbo2Fields
	local c = config or {}
	return {
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire2 = c.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire2,
		countryResidentialaddressBeneficialownerAmlquestionnaire2 = c.countryResidentialaddressBeneficialownerAmlquestionnaire2,
		stateResidentialaddressBeneficialownerAmlquestionnaire2 = c.stateResidentialaddressBeneficialownerAmlquestionnaire2,
		zipResidentialaddressBeneficialownerAmlquestionnaire2 = c.zipResidentialaddressBeneficialownerAmlquestionnaire2,
		cityResidentialaddressBeneficialownerAmlquestionnaire2 = c.cityResidentialaddressBeneficialownerAmlquestionnaire2,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUbo2Type(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableAddressUbo2Fields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableAddressUbo2Type
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUbo3Fields(config: {
	cityResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	countryResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	zipResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
}?): SourceMasterTableAddressUbo3Fields
	local c = config or {}
	return {
		cityResidentialaddressBeneficialownerAmlquestionnaire3 = c.cityResidentialaddressBeneficialownerAmlquestionnaire3,
		countryResidentialaddressBeneficialownerAmlquestionnaire3 = c.countryResidentialaddressBeneficialownerAmlquestionnaire3,
		zipResidentialaddressBeneficialownerAmlquestionnaire3 = c.zipResidentialaddressBeneficialownerAmlquestionnaire3,
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire3 = c.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire3,
		stateResidentialaddressBeneficialownerAmlquestionnaire3 = c.stateResidentialaddressBeneficialownerAmlquestionnaire3,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUbo3Type(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableAddressUbo3Fields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableAddressUbo3Type
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUboFields(config: {
	zipResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	cityResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	stateResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	numberandstreetResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	countryResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
}?): SourceMasterTableAddressUboFields
	local c = config or {}
	return {
		zipResidentialaddressBeneficialownerAmlquestionnaire = c.zipResidentialaddressBeneficialownerAmlquestionnaire,
		cityResidentialaddressBeneficialownerAmlquestionnaire = c.cityResidentialaddressBeneficialownerAmlquestionnaire,
		stateResidentialaddressBeneficialownerAmlquestionnaire = c.stateResidentialaddressBeneficialownerAmlquestionnaire,
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire = c.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire,
		countryResidentialaddressBeneficialownerAmlquestionnaire = c.countryResidentialaddressBeneficialownerAmlquestionnaire,
	}
end

function SourceMasterTable.makeSourceMasterTableAddressUboType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableAddressUboFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableAddressUboType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableBrokeragefirmFields(config: {
	countryBrokerageaccountWireinfo: DataTypes.StringType?,
	firmnameBrokerageaccountWireinfo: DataTypes.StringType?,
	zipBrokerageaccountWireinfo: DataTypes.StringType?,
	accountnameBrokerageaccountWireinfo: DataTypes.StringType?,
	stateBrokerageaccountWireinfo: DataTypes.StringType?,
	dtcnumberBrokerageaccountWireinfo: DataTypes.StringType?,
	accountnumberBrokerageaccountWireinfo: DataTypes.StringType?,
	cityBrokerageaccountWireinfo: DataTypes.StringType?,
	addressBrokerageaccountWireinfo: DataTypes.StringType?,
}?): SourceMasterTableBrokeragefirmFields
	local c = config or {}
	return {
		countryBrokerageaccountWireinfo = c.countryBrokerageaccountWireinfo,
		firmnameBrokerageaccountWireinfo = c.firmnameBrokerageaccountWireinfo,
		zipBrokerageaccountWireinfo = c.zipBrokerageaccountWireinfo,
		accountnameBrokerageaccountWireinfo = c.accountnameBrokerageaccountWireinfo,
		stateBrokerageaccountWireinfo = c.stateBrokerageaccountWireinfo,
		dtcnumberBrokerageaccountWireinfo = c.dtcnumberBrokerageaccountWireinfo,
		accountnumberBrokerageaccountWireinfo = c.accountnumberBrokerageaccountWireinfo,
		cityBrokerageaccountWireinfo = c.cityBrokerageaccountWireinfo,
		addressBrokerageaccountWireinfo = c.addressBrokerageaccountWireinfo,
	}
end

function SourceMasterTable.makeSourceMasterTableBrokeragefirmType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableBrokeragefirmFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableBrokeragefirmType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableCanadianSignatoryFields(config: {
	dateSignaturepageCanadianiqs: DataTypes.StringType?,
	investornameSignaturepageCanadianiqs: DataTypes.StringType?,
	provinceofresidentSignaturepageCanadianiqs: DataTypes.StringType?,
	authorizedsignatorynameSignaturepageCanadianiqs: DataTypes.StringType?,
}?): SourceMasterTableCanadianSignatoryFields
	local c = config or {}
	return {
		dateSignaturepageCanadianiqs = c.dateSignaturepageCanadianiqs,
		investornameSignaturepageCanadianiqs = c.investornameSignaturepageCanadianiqs,
		provinceofresidentSignaturepageCanadianiqs = c.provinceofresidentSignaturepageCanadianiqs,
		authorizedsignatorynameSignaturepageCanadianiqs = c.authorizedsignatorynameSignaturepageCanadianiqs,
	}
end

function SourceMasterTable.makeSourceMasterTableCanadianSignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableCanadianSignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableCanadianSignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableClientquestionnairePart1SignatoryFields(config: {
	signernamePart1Duediligencequestionnaire: DataTypes.StringType?,
	datePart1Duediligencequestionnaire: DataTypes.StringType?,
}?): SourceMasterTableClientquestionnairePart1SignatoryFields
	local c = config or {}
	return {
		signernamePart1Duediligencequestionnaire = c.signernamePart1Duediligencequestionnaire,
		datePart1Duediligencequestionnaire = c.datePart1Duediligencequestionnaire,
	}
end

function SourceMasterTable.makeSourceMasterTableClientquestionnairePart1SignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableClientquestionnairePart1SignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableClientquestionnairePart1SignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableClientquestionnairePart2SignatoryFields(config: {
	signernamePart2Duediligencequestionnaire: DataTypes.StringType?,
	datePart2Duediligencequestionnaire: DataTypes.StringType?,
}?): SourceMasterTableClientquestionnairePart2SignatoryFields
	local c = config or {}
	return {
		signernamePart2Duediligencequestionnaire = c.signernamePart2Duediligencequestionnaire,
		datePart2Duediligencequestionnaire = c.datePart2Duediligencequestionnaire,
	}
end

function SourceMasterTable.makeSourceMasterTableClientquestionnairePart2SignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableClientquestionnairePart2SignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableClientquestionnairePart2SignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableLpSignatoryFields(config: {
	entityAuthorizedtitleSignaturepage: DataTypes.StringType?,
	dateSignaturepage: DataTypes.StringType?,
	entitySubscribernameSignaturepage: DataTypes.StringType?,
	asaCommitmentAmount: DataTypes.StringType?,
	entityAuthorizednameSignaturepage: DataTypes.StringType?,
	individualSubscribernameSignaturepage: DataTypes.StringType?,
}?): SourceMasterTableLpSignatoryFields
	local c = config or {}
	return {
		entityAuthorizedtitleSignaturepage = c.entityAuthorizedtitleSignaturepage,
		dateSignaturepage = c.dateSignaturepage,
		entitySubscribernameSignaturepage = c.entitySubscribernameSignaturepage,
		asaCommitmentAmount = c.asaCommitmentAmount,
		entityAuthorizednameSignaturepage = c.entityAuthorizednameSignaturepage,
		individualSubscribernameSignaturepage = c.individualSubscribernameSignaturepage,
	}
end

function SourceMasterTable.makeSourceMasterTableLpSignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableLpSignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableLpSignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableLuxGpSignatoryFields(config: {
	nameFirstauthorizedsignatoryCapluxGpsignaturepage: DataTypes.StringType?,
	nameSecondauthorizedsignatoryCapluxGpsignaturepage: DataTypes.StringType?,
	titleFirstauthorizedsignatoryCapluxGpsignaturepage: DataTypes.StringType?,
	titleSecondauthorizedsignatoryCapluxGpsignaturepage: DataTypes.StringType?,
}?): SourceMasterTableLuxGpSignatoryFields
	local c = config or {}
	return {
		nameFirstauthorizedsignatoryCapluxGpsignaturepage = c.nameFirstauthorizedsignatoryCapluxGpsignaturepage,
		nameSecondauthorizedsignatoryCapluxGpsignaturepage = c.nameSecondauthorizedsignatoryCapluxGpsignaturepage,
		titleFirstauthorizedsignatoryCapluxGpsignaturepage = c.titleFirstauthorizedsignatoryCapluxGpsignaturepage,
		titleSecondauthorizedsignatoryCapluxGpsignaturepage = c.titleSecondauthorizedsignatoryCapluxGpsignaturepage,
	}
end

function SourceMasterTable.makeSourceMasterTableLuxGpSignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableLuxGpSignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableLuxGpSignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableMainGpSignatoryFields(config: {
	acceptedcommitmentGpsignaturepage: DataTypes.StringType?,
	nameFirstauthorizedsignatoryGpsignaturepage: DataTypes.StringType?,
	titleFirstauthorizedsignatoryGpsignaturepage: DataTypes.StringType?,
}?): SourceMasterTableMainGpSignatoryFields
	local c = config or {}
	return {
		acceptedcommitmentGpsignaturepage = c.acceptedcommitmentGpsignaturepage,
		nameFirstauthorizedsignatoryGpsignaturepage = c.nameFirstauthorizedsignatoryGpsignaturepage,
		titleFirstauthorizedsignatoryGpsignaturepage = c.titleFirstauthorizedsignatoryGpsignaturepage,
	}
end

function SourceMasterTable.makeSourceMasterTableMainGpSignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableMainGpSignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableMainGpSignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTablePlaceofbusinessEntityFields(config: {
	asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	asaCityCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	asaCountryCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	asaStateCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	asaZipCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
}?): SourceMasterTablePlaceofbusinessEntityFields
	local c = config or {}
	return {
		asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire = c.asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire,
		asaCityCurrentbusinessaddressEntityAmlquestionnaire = c.asaCityCurrentbusinessaddressEntityAmlquestionnaire,
		asaCountryCurrentbusinessaddressEntityAmlquestionnaire = c.asaCountryCurrentbusinessaddressEntityAmlquestionnaire,
		asaStateCurrentbusinessaddressEntityAmlquestionnaire = c.asaStateCurrentbusinessaddressEntityAmlquestionnaire,
		asaZipCurrentbusinessaddressEntityAmlquestionnaire = c.asaZipCurrentbusinessaddressEntityAmlquestionnaire,
	}
end

function SourceMasterTable.makeSourceMasterTablePlaceofbusinessEntityType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTablePlaceofbusinessEntityFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTablePlaceofbusinessEntityType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableResidentialaddressIndividualFields(config: {
	asaZipCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	asaCityCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	asaStateCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	asaCountryCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
}?): SourceMasterTableResidentialaddressIndividualFields
	local c = config or {}
	return {
		asaZipCurrentresidentialaddressIndividualAmlquestionnaire = c.asaZipCurrentresidentialaddressIndividualAmlquestionnaire,
		asaCityCurrentresidentialaddressIndividualAmlquestionnaire = c.asaCityCurrentresidentialaddressIndividualAmlquestionnaire,
		asaStateCurrentresidentialaddressIndividualAmlquestionnaire = c.asaStateCurrentresidentialaddressIndividualAmlquestionnaire,
		asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire = c.asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire,
		asaCountryCurrentresidentialaddressIndividualAmlquestionnaire = c.asaCountryCurrentresidentialaddressIndividualAmlquestionnaire,
	}
end

function SourceMasterTable.makeSourceMasterTableResidentialaddressIndividualType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableResidentialaddressIndividualFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableResidentialaddressIndividualType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableTaxowner2SignatoryFields(config: {
	nameTaxownerExhibitk: DataTypes.StringType?,
	dateTaxownerExhibitk: DataTypes.StringType?,
}?): SourceMasterTableTaxowner2SignatoryFields
	local c = config or {}
	return {
		nameTaxownerExhibitk = c.nameTaxownerExhibitk,
		dateTaxownerExhibitk = c.dateTaxownerExhibitk,
	}
end

function SourceMasterTable.makeSourceMasterTableTaxowner2SignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableTaxowner2SignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableTaxowner2SignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableTaxownerSignatoryFields(config: {
	nameTaxownerAnnex1: DataTypes.StringType?,
	dateTaxownerAnnex1: DataTypes.StringType?,
}?): SourceMasterTableTaxownerSignatoryFields
	local c = config or {}
	return {
		nameTaxownerAnnex1 = c.nameTaxownerAnnex1,
		dateTaxownerAnnex1 = c.dateTaxownerAnnex1,
	}
end

function SourceMasterTable.makeSourceMasterTableTaxownerSignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableTaxownerSignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableTaxownerSignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableWireinstructionsFields(config: {
	asaBanklocationWireinstructionstoWireinfo: DataTypes.StringType?,
	beneficiaryaddressWireinstructiontoWireinfo: DataTypes.StringType?,
	asaIntermediaryabaWireinstructionstoWireinfo: DataTypes.StringType?,
	asaIntermediaryswiftWireinstructionstoWireinfo: DataTypes.StringType?,
	asaFurthercreditaccountWireinstructionstoWireinfo: DataTypes.StringType?,
	asaIbanWireinstructionstoWireinfo: DataTypes.StringType?,
	asaFurthercreditnameWireinstructionstoWireinfo: DataTypes.StringType?,
	asaAccountnameWireinstructionstoWireinfo: DataTypes.StringType?,
	asaAbaWireinstructionstoWireinfo: DataTypes.StringType?,
	asaSwiftWireinstructionstoWireinfo: DataTypes.StringType?,
	asaAccountnumberWireinstructionstoWireinfo: DataTypes.StringType?,
	asaBanknameWireinstructionstoWireinfo: DataTypes.StringType?,
	intermediarybankcountryWireinstructionstoWireinfo: DataTypes.StringType?,
	asaIntermediarybanknameWireinstructionstoWireinfo: DataTypes.StringType?,
	currencyWireinstructiontoWireinfo: DataTypes.StringType?,
}?): SourceMasterTableWireinstructionsFields
	local c = config or {}
	return {
		asaBanklocationWireinstructionstoWireinfo = c.asaBanklocationWireinstructionstoWireinfo,
		beneficiaryaddressWireinstructiontoWireinfo = c.beneficiaryaddressWireinstructiontoWireinfo,
		asaIntermediaryabaWireinstructionstoWireinfo = c.asaIntermediaryabaWireinstructionstoWireinfo,
		asaIntermediaryswiftWireinstructionstoWireinfo = c.asaIntermediaryswiftWireinstructionstoWireinfo,
		asaFurthercreditaccountWireinstructionstoWireinfo = c.asaFurthercreditaccountWireinstructionstoWireinfo,
		asaIbanWireinstructionstoWireinfo = c.asaIbanWireinstructionstoWireinfo,
		asaFurthercreditnameWireinstructionstoWireinfo = c.asaFurthercreditnameWireinstructionstoWireinfo,
		asaAccountnameWireinstructionstoWireinfo = c.asaAccountnameWireinstructionstoWireinfo,
		asaAbaWireinstructionstoWireinfo = c.asaAbaWireinstructionstoWireinfo,
		asaSwiftWireinstructionstoWireinfo = c.asaSwiftWireinstructionstoWireinfo,
		asaAccountnumberWireinstructionstoWireinfo = c.asaAccountnumberWireinstructionstoWireinfo,
		asaBanknameWireinstructionstoWireinfo = c.asaBanknameWireinstructionstoWireinfo,
		intermediarybankcountryWireinstructionstoWireinfo = c.intermediarybankcountryWireinstructionstoWireinfo,
		asaIntermediarybanknameWireinstructionstoWireinfo = c.asaIntermediarybanknameWireinstructionstoWireinfo,
		currencyWireinstructiontoWireinfo = c.currencyWireinstructiontoWireinfo,
	}
end

function SourceMasterTable.makeSourceMasterTableWireinstructionsType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableWireinstructionsFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableWireinstructionsType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableWitness2SignatoryFields(config: {
	nameWitnessExhibitk: DataTypes.StringType?,
	dateWitnessExhibitk: DataTypes.StringType?,
}?): SourceMasterTableWitness2SignatoryFields
	local c = config or {}
	return {
		nameWitnessExhibitk = c.nameWitnessExhibitk,
		dateWitnessExhibitk = c.dateWitnessExhibitk,
	}
end

function SourceMasterTable.makeSourceMasterTableWitness2SignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableWitness2SignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableWitness2SignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableWitnessSignatoryFields(config: {
	witnessednameTaxownerAnnex1: DataTypes.StringType?,
	witnesseddateTaxownerAnnex1: DataTypes.StringType?,
}?): SourceMasterTableWitnessSignatoryFields
	local c = config or {}
	return {
		witnessednameTaxownerAnnex1 = c.witnessednameTaxownerAnnex1,
		witnesseddateTaxownerAnnex1 = c.witnesseddateTaxownerAnnex1,
	}
end

function SourceMasterTable.makeSourceMasterTableWitnessSignatoryType(config: {
	typeId: string?,
	valueSubFields: SourceMasterTableWitnessSignatoryFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableWitnessSignatoryType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function SourceMasterTable.makeSourceMasterTableFieldsMap(config: {
	asaFullnameInvestornameGeneralinfo: DataTypes.StringType?,
	lpSignatory: SourceMasterTableLpSignatoryType?,
	mainGpSignatory: SourceMasterTableMainGpSignatoryType?,
	luxGpSignatory: SourceMasterTableLuxGpSignatoryType?,
	dateGpsignaturepage: DataTypes.StringType?,
	taxownerSignatory: SourceMasterTableTaxownerSignatoryType?,
	witnessSignatory: SourceMasterTableWitnessSignatoryType?,
	asaFullnameInvestornameAmlquestionnaire: DataTypes.StringType?,
	jointaccountholdersnamesPart1Duediligencequestionnaire: DataTypes.StringType?,
	asaDateofbirthIndividualAmlquestionnaire: DataTypes.StringType?,
	asaPlaceofbirthIndividualAmlquestionnaire: DataTypes.StringType?,
	ssnorftiorppnoPart1Duediligencequestionnaire: DataTypes.StringType?,
	asaNationalityIndividualAmlquestionnaire: DataTypes.StringType?,
	asaFulladdressCurrentresidentialaddressIndividualAmlquestionnaire: DataTypes.StringType?,
	residentialaddressIndividual: SourceMasterTableResidentialaddressIndividualType?,
	indiInternationalsupplementsPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	asaOccupationIndividualAmlquestionnaire: DataTypes.StringType?,
	professionalactivityAndTitleIndividualAmlquestionnaire: DataTypes.StringType?,
	nameofemployerPart1Duediligencequestionnaire: DataTypes.StringType?,
	addressofemployerPart1Duediligencequestionnaire: DataTypes.StringType?,
	sourceofwealthPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	nomineePart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	categoryNomineePart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	specifyotherCategoryNomineePart1Duediligencequestionnaire: DataTypes.StringType?,
	affiliatedPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	nameAffiliatedPart1Duediligencequestionnaire: DataTypes.StringType?,
	asaPoliticallyexposedpersonsAmlquestionnaire: DataTypes.MultipleCheckboxType?,
	clientquestionnairePart1Signatory: SourceMasterTableClientquestionnairePart1SignatoryType?,
	asaFullnameInvestornameGeneralinfo1: DataTypes.StringType?,
	tradenamePart2Duediligencequestionnaire: DataTypes.StringType?,
	jurisdictionoforganizationPart2Duediligencequestionnaire: DataTypes.StringType?,
	asaDateofestablishmentEntityAmlquestionnaire: DataTypes.StringType?,
	purposeofbusinessEntityAmlquestionnaire: DataTypes.StringType?,
	asaFulladdressCurrentbusinessaddressEntityAmlquestionnaire: DataTypes.StringType?,
	placeofbusinessEntity: SourceMasterTablePlaceofbusinessEntityType?,
	entityInternationalsupplementsPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	websitePart2Duediligencequestionnaire: DataTypes.StringType?,
	tinPart2Duediligencequestionnaire: DataTypes.StringType?,
	sourceoffundsPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	legalformofentityPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	specificotherLegalformofentityPart2Duediligencequestionnaire: DataTypes.StringType?,
	trustPart1Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	asaFormpfFormpf: DataTypes.MultipleCheckboxType?,
	asaSpecifyOtherFormpf: DataTypes.StringType?,
	financialinstitutionRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire: DataTypes.StringType?,
	departmentRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	entityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	luxsentityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.StringType?,
	tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire: DataTypes.StringType?,
	goventityPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	nomineePart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	categoryNomineePart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	specificrepresentativeCategoryNomineePart2Duediligencequestionnaire: DataTypes.StringType?,
	affiliatedPart2Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	indicateAffiliatedPart2Duediligencequestionnaire: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire0: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire1: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire2: DataTypes.StringType?,
	nameControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	tittleControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	dobControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	addressControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	idControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	citizenshipControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	pepControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	publiclytradedControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	regulatedentityControlpersonPart2Duediligencequestionnaire3: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire: DataTypes.StringType?,
	addressUbo: SourceMasterTableAddressUboType?,
	idBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire0: DataTypes.StringType?,
	addressUbo0: SourceMasterTableAddressUbo0Type?,
	idBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire0: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire1: DataTypes.StringType?,
	addressUbo1: SourceMasterTableAddressUbo1Type?,
	idBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire1: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire2: DataTypes.StringType?,
	addressUbo2: SourceMasterTableAddressUbo2Type?,
	idBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire2: DataTypes.StringType?,
	asaFullnameBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	tittleBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	asaDateofbirthBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	asaResidentialaddressBeneficialownerAmlquestionnaire3: DataTypes.StringType?,
	addressUbo3: SourceMasterTableAddressUbo3Type?,
	idBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	citizenshipBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	pepBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	publiclytradedBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	regulatedentityBeneficialownerPart2Duediligencequestionnaire3: DataTypes.StringType?,
	clientquestionnairePart2Signatory: SourceMasterTableClientquestionnairePart2SignatoryType?,
	asaFullnameInvestornameGeneralinfo2: DataTypes.StringType?,
	wireInstructions: SourceMasterTableWireinstructionsType?,
	nameofsubscriberWireinstructiontoPart3Duediligencequestionnaire: DataTypes.MultipleCheckboxType?,
	brokerageFirm: SourceMasterTableBrokeragefirmType?,
	typeofownershipIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaAccreditedinvestorAccreditedinvestor: DataTypes.MultipleCheckboxType?,
	qualifiedpurchaserIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	uspersonIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	qualifiedclientIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	notinvest1100IndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	taxtreatmentTaxmatterIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	explainotherTaxtreatmentTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	ustinorssnTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	ustinorssnTaxmatterIndividualsInvestorquestionnaire0: DataTypes.StringType?,
	uktaxrefTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	uktaxrefTaxmatterIndividualsInvestorquestionnaire0: DataTypes.StringType?,
	nonustinTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	nonustinTaxmatterIndividualsInvestorquestionnaire0: DataTypes.StringType?,
	countrynonustinTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	countrynonustinTaxmatterIndividualsInvestorquestionnaire0: DataTypes.StringType?,
	disregardedentityTaxmatterIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	nameTaxownerTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	countryTaxownerTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	taxidTaxownerTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	staeTaxownerTaxmatterIndividualsInvestorquestionnaire: DataTypes.StringType?,
	noncooperativejurisdictionsIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	electingfeepartnerIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	skipFinraIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	finraIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	brokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	immediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	nameemployedImmediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaire: DataTypes.StringType?,
	personsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	immediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	specifynameImmediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaire: DataTypes.StringType?,
	publiccompanyFinraIndividualsInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	asaConvictedlast10yearsBadactor: DataTypes.MultipleCheckboxType?,
	asaSubjecttojudgementlast5yearsBadactor: DataTypes.MultipleCheckboxType?,
	asaSubjecttofinalorderBadactor: DataTypes.MultipleCheckboxType?,
	asaSubjecttosecorder15bor15cBadactor: DataTypes.MultipleCheckboxType?,
	asaSubjecttosecorderpast5yearsBadactor: DataTypes.MultipleCheckboxType?,
	asaSuspendedmembershipBadactor: DataTypes.MultipleCheckboxType?,
	asaUnderwriterBadactor: DataTypes.MultipleCheckboxType?,
	asaUspsfalserepresentationBadactor: DataTypes.MultipleCheckboxType?,
	notsubjectS506dregulationdIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	subscriberacknowledgesIndividualsInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaAccreditedinvestorAccreditedinvestor1: DataTypes.MultipleCheckboxType?,
	nameofplanfiduciaryAccreditedinvestorEntityInvestorquestionnaire: DataTypes.StringType?,
	voluntaryEmployeebenefitplanEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	registerrequiredEmployeebenefitplanEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	permitEmployeebenefitplanEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaQualifiedpurchaserQualifiedpurchaser: DataTypes.MultipleCheckboxType?,
	purposeEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	lessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	howmanylessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire: DataTypes.StringType?,
	morethan10countasNumberofbeneficialownersEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	howmanymorethan10countasNumberofbeneficialownersEntityInvestorquestionnaire: DataTypes.StringType?,
	asaJurisdictionoftaxresidencyGeneralinfo: DataTypes.StringType?,
	jurisdictionyearendTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	usyearendTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	taxstatusTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	exemptTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	treatmentTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	explainotherTreatmentTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	indicatedisregardedTreatmentTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	morethan50percentPartnershipsTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	satisfy100partnerlimitationPartnershipsTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	percentTaxmatterEntityInvestorquestionnaire: DataTypes.StringType?,
	foreignsovereignTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	caipartnerTaxmatterEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	s511TaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	onwerexemptS511TaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	taxexemptlpTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	entitledTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	subtypeEntitledTaxexemptEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	usgovernmentpersonEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	nonusNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	usgovernmentalTaxcreditEntityInvestorquestionnaire: DataTypes.StringType?,
	taxexemptTaxcreditEntityInvestorquestionnaire: DataTypes.StringType?,
	taxableusTaxcreditEntityInvestorquestionnaire: DataTypes.StringType?,
	nonusTaxcreditEntityInvestorquestionnaire: DataTypes.StringType?,
	prohibitforeignentityEntityInvestorquestionnaire: DataTypes.StringType?,
	noncooperativejurisdictionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	fiscallytransparentS894benefitsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	withholdingqualifiedholderEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	planassetsErisaEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaErisaErisa: DataTypes.MultipleCheckboxType?,
	percentofassetErisaEntityInvestorquestionnaire: DataTypes.StringType?,
	otherentityErisaEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	lessthan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire: DataTypes.StringType?,
	morethan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire: DataTypes.StringType?,
	controllinginfluenceCheckyesornoEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	publicaccesslawmattersEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	seperatelegalpersonalityAdditionalquestionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	interestsAdditionalquestionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	avoidregistrationAdditionalquestionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	consentAdditionalquestionsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	restrictedpersonorcoveredpersonNewissuesEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	generalexemptionsNewissuesEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	allocateprofitsorlossesOtherentityGeneralexemptionsNewissuesEntityInvestorquestionnaire: DataTypes.StringType?,
	restrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	brokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	immediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	nameemployedImmediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire: DataTypes.StringType?,
	personowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	immediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	brokerdealernameImmediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire: DataTypes.StringType?,
	publiccompanyRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup: DataTypes.MultipleCheckboxType?,
	electingfeepartnerEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	commit1100EntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	qualifiedclientEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	asaBhcSpecialentities: DataTypes.MultipleCheckboxType?,
	governmentalplanBhc: DataTypes.MultipleCheckboxType?,
	asaConvictedlast10yearsBadactor1: DataTypes.MultipleCheckboxType?,
	asaSubjecttojudgementlast5yearsBadactor1: DataTypes.MultipleCheckboxType?,
	asaSubjecttofinalorderBadactor1: DataTypes.MultipleCheckboxType?,
	asaSubjecttosecorder15bor15cBadactor1: DataTypes.MultipleCheckboxType?,
	asaSubjecttosecorderpast5yearsBadactor1: DataTypes.MultipleCheckboxType?,
	asaSuspendedmembershipBadactor1: DataTypes.MultipleCheckboxType?,
	asaUnderwriterBadactor1: DataTypes.MultipleCheckboxType?,
	asaUspsfalserepresentationBadactor1: DataTypes.MultipleCheckboxType?,
	notsubject506dofregulationdEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	beenrefferedThirdpartyreferralsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	nameBeenrefferedThirdpartyreferralsEntityInvestorquestionnaire: DataTypes.StringType?,
	signeddisclosurestatementThirdpartyreferralsEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	subscriberacknowledgesEntityInvestorquestionnaire: DataTypes.MultipleCheckboxType?,
	subscribernameConsentstatement: DataTypes.StringType?,
	nameAuthorizedsignatoryConsentstatement: DataTypes.StringType?,
	titleAuthorizedsignatoryConsentstatement: DataTypes.StringType?,
	nameAuthorizedsignatory2Consentstatement: DataTypes.StringType?,
	titleAuthorizedsignatory2Consentstatement: DataTypes.StringType?,
	dateAuthorizedsignatoryConsentstatement: DataTypes.StringType?,
	dateAuthorizedsignatory2Consentstatement: DataTypes.StringType?,
	transparentordisregardedSection1Exhibite: DataTypes.MultipleCheckboxType?,
	taxableSection1Exhibite: DataTypes.MultipleCheckboxType?,
	section2Exhibite: DataTypes.MultipleCheckboxType?,
	domiciledoregisteredineeaEeaiqs: DataTypes.MultipleCheckboxType?,
	specifyDomiciledoregisteredineeaEeaiqs: DataTypes.StringType?,
	onbehalfEeaiqs: DataTypes.MultipleCheckboxType?,
	nameOnbehalfEeaiqs: DataTypes.StringType?,
	positionOnbehalfEeaiqs: DataTypes.StringType?,
	corporateOnbehalfEeaiqs: DataTypes.StringType?,
	stateOnbehalfEeaiqs: DataTypes.StringType?,
	representEearepandrequest: DataTypes.MultipleCheckboxType?,
	groupRepresentEearepandrequest: DataTypes.MultipleCheckboxType?,
	natureAntherinstitutionalinvestorRepresentEearepandrequest: DataTypes.StringType?,
	groupLargeundertakingRepresentEearepandrequest: DataTypes.MultipleCheckboxType?,
	electiveprofessionalcriteriaEearepandrequest: DataTypes.MultipleCheckboxType?,
	proinvestorstatusUkrepandrequest: DataTypes.MultipleCheckboxType?,
	groupProinvestorstatusUkrepandrequest: DataTypes.MultipleCheckboxType?,
	natureAntherinstitutionalinvestorProinvestorstatusUkrepandrequest: DataTypes.StringType?,
	groupLargeundertakingProinvestorstatusUkrepandrequest: DataTypes.MultipleCheckboxType?,
	electiveprofessionalcriteriaUkrepandrequest: DataTypes.MultipleCheckboxType?,
	representUkiqs: DataTypes.MultipleCheckboxType?,
	groupInvestmentproRepresentUkiqs: DataTypes.MultipleCheckboxType?,
	groupPersonInvestmentproRepresentUkiqs: DataTypes.MultipleCheckboxType?,
	groupHighnetworthRepresentUkiqs: DataTypes.MultipleCheckboxType?,
	groupCorporateHighnetworthRepresentUkiqs: DataTypes.MultipleCheckboxType?,
	regularqualifiedinvestorsSwissinvestorAppendixb: DataTypes.MultipleCheckboxType?,
	typesLargeundertakingRegularqualifiedinvestorsScheduleh: DataTypes.MultipleCheckboxType?,
	electedqualifiedinvestorsSchedulehAppendixb: DataTypes.MultipleCheckboxType?,
	swissexemptSchedulehAppendixb: DataTypes.MultipleCheckboxType?,
	provinceresidentCanadianiqs: DataTypes.StringType?,
	isaccreditedinvestorCanadianiqs: DataTypes.MultipleCheckboxType?,
	ispermittedclientCanadianiqs: DataTypes.MultipleCheckboxType?,
	accredittedinvestorCanadiansupplement: DataTypes.MultipleCheckboxType?,
	permittedclientrepresentationCanadiansupplement: DataTypes.MultipleCheckboxType?,
	canadianSignatory: SourceMasterTableCanadianSignatoryType?,
	qualifiedinstitutionalinvestorstatusJapanregulations: DataTypes.MultipleCheckboxType?,
	nonqualifiedinstitutionalinvestorstatusJapanregulations: DataTypes.MultipleCheckboxType?,
	collectiveinvestmentschemeorspecialpurposecoJapanregulations: DataTypes.MultipleCheckboxType?,
	typeYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations: DataTypes.StringType?,
	numberofqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations: DataTypes.StringType?,
	numberofnonqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations: DataTypes.StringType?,
	professionalinvestorstatusJapanregulations: DataTypes.MultipleCheckboxType?,
	treatasgeneralinvestorYesProfessionalinvestorstatusJapanregulations: DataTypes.MultipleCheckboxType?,
	totalassetsStatusofassetsProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	netassetsStatusofassetsProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	financialassetsStatusofassetsProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	forcollectiveinvestmentschemeInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	forothersecuritiesInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations: DataTypes.StringType?,
	purposeoftransactionAmlJapanregulations: DataTypes.MultipleCheckboxType?,
	specifyOtherPurposeoftransactionAmlJapanregulations: DataTypes.StringType?,
	businessofinvestorAmlJapanregulations: DataTypes.MultipleCheckboxType?,
	specifyOtherBusinessofinvestorAmlJapanregulations: DataTypes.StringType?,
	occupationofinvestorAmlJapanregulations: DataTypes.MultipleCheckboxType?,
	specifyOtherOccupationofinvestorAmlJapanregulations: DataTypes.StringType?,
	taxcreditWarranties: DataTypes.MultipleCheckboxType?,
	subscribernameTaxcreditWarranties: DataTypes.StringType?,
	taxowner2Signatory: SourceMasterTableTaxowner2SignatoryType?,
	witness2Signatory: SourceMasterTableWitness2SignatoryType?,
	qualifiedbusinessSupplementalforeign: DataTypes.MultipleCheckboxType?,
	morethan50percstockSupplementalforeign: DataTypes.MultipleCheckboxType?,
	section9901Supplementalforeign: DataTypes.MultipleCheckboxType?,
	chinesemilitarySupplementalforeign: DataTypes.MultipleCheckboxType?,
	entitylistrequiredSupplementalforeign: DataTypes.MultipleCheckboxType?,
	section154bSupplementalforeign: DataTypes.MultipleCheckboxType?,
	dateAddtionalrepresentations: DataTypes.StringType?,
	letterSubscribernameAddtionalrepresentations: DataTypes.StringType?,
	naturalpersonAddtionalrepresentations: DataTypes.StringType?,
	entityAddtionalrepresentations: DataTypes.StringType?,
	additionalrepresentationsSignatory: SourceMasterTableAdditionalrepresentationsSignatoryType?,
}?): SourceMasterTableFieldsMap
	local c = config or {}
	return {
		asaFullnameInvestornameGeneralinfo = c.asaFullnameInvestornameGeneralinfo,
		lpSignatory = c.lpSignatory,
		mainGpSignatory = c.mainGpSignatory,
		luxGpSignatory = c.luxGpSignatory,
		dateGpsignaturepage = c.dateGpsignaturepage,
		taxownerSignatory = c.taxownerSignatory,
		witnessSignatory = c.witnessSignatory,
		asaFullnameInvestornameAmlquestionnaire = c.asaFullnameInvestornameAmlquestionnaire,
		jointaccountholdersnamesPart1Duediligencequestionnaire = c.jointaccountholdersnamesPart1Duediligencequestionnaire,
		asaDateofbirthIndividualAmlquestionnaire = c.asaDateofbirthIndividualAmlquestionnaire,
		asaPlaceofbirthIndividualAmlquestionnaire = c.asaPlaceofbirthIndividualAmlquestionnaire,
		ssnorftiorppnoPart1Duediligencequestionnaire = c.ssnorftiorppnoPart1Duediligencequestionnaire,
		asaNationalityIndividualAmlquestionnaire = c.asaNationalityIndividualAmlquestionnaire,
		asaFulladdressCurrentresidentialaddressIndividualAmlquestionnaire = c.asaFulladdressCurrentresidentialaddressIndividualAmlquestionnaire,
		residentialaddressIndividual = c.residentialaddressIndividual,
		indiInternationalsupplementsPart1Duediligencequestionnaire = c.indiInternationalsupplementsPart1Duediligencequestionnaire,
		asaOccupationIndividualAmlquestionnaire = c.asaOccupationIndividualAmlquestionnaire,
		professionalactivityAndTitleIndividualAmlquestionnaire = c.professionalactivityAndTitleIndividualAmlquestionnaire,
		nameofemployerPart1Duediligencequestionnaire = c.nameofemployerPart1Duediligencequestionnaire,
		addressofemployerPart1Duediligencequestionnaire = c.addressofemployerPart1Duediligencequestionnaire,
		sourceofwealthPart1Duediligencequestionnaire = c.sourceofwealthPart1Duediligencequestionnaire,
		nomineePart1Duediligencequestionnaire = c.nomineePart1Duediligencequestionnaire,
		categoryNomineePart1Duediligencequestionnaire = c.categoryNomineePart1Duediligencequestionnaire,
		specifyotherCategoryNomineePart1Duediligencequestionnaire = c.specifyotherCategoryNomineePart1Duediligencequestionnaire,
		affiliatedPart1Duediligencequestionnaire = c.affiliatedPart1Duediligencequestionnaire,
		nameAffiliatedPart1Duediligencequestionnaire = c.nameAffiliatedPart1Duediligencequestionnaire,
		asaPoliticallyexposedpersonsAmlquestionnaire = c.asaPoliticallyexposedpersonsAmlquestionnaire,
		clientquestionnairePart1Signatory = c.clientquestionnairePart1Signatory,
		asaFullnameInvestornameGeneralinfo1 = c.asaFullnameInvestornameGeneralinfo1,
		tradenamePart2Duediligencequestionnaire = c.tradenamePart2Duediligencequestionnaire,
		jurisdictionoforganizationPart2Duediligencequestionnaire = c.jurisdictionoforganizationPart2Duediligencequestionnaire,
		asaDateofestablishmentEntityAmlquestionnaire = c.asaDateofestablishmentEntityAmlquestionnaire,
		purposeofbusinessEntityAmlquestionnaire = c.purposeofbusinessEntityAmlquestionnaire,
		asaFulladdressCurrentbusinessaddressEntityAmlquestionnaire = c.asaFulladdressCurrentbusinessaddressEntityAmlquestionnaire,
		placeofbusinessEntity = c.placeofbusinessEntity,
		entityInternationalsupplementsPart1Duediligencequestionnaire = c.entityInternationalsupplementsPart1Duediligencequestionnaire,
		websitePart2Duediligencequestionnaire = c.websitePart2Duediligencequestionnaire,
		tinPart2Duediligencequestionnaire = c.tinPart2Duediligencequestionnaire,
		sourceoffundsPart2Duediligencequestionnaire = c.sourceoffundsPart2Duediligencequestionnaire,
		legalformofentityPart2Duediligencequestionnaire = c.legalformofentityPart2Duediligencequestionnaire,
		specificotherLegalformofentityPart2Duediligencequestionnaire = c.specificotherLegalformofentityPart2Duediligencequestionnaire,
		trustPart1Duediligencequestionnaire = c.trustPart1Duediligencequestionnaire,
		asaFormpfFormpf = c.asaFormpfFormpf,
		asaSpecifyOtherFormpf = c.asaSpecifyOtherFormpf,
		financialinstitutionRegulatedstatusPart2Duediligencequestionnaire = c.financialinstitutionRegulatedstatusPart2Duediligencequestionnaire,
		indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire = c.indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire,
		departmentRegulatedstatusPart2Duediligencequestionnaire = c.departmentRegulatedstatusPart2Duediligencequestionnaire,
		entityRegulatedstatusPart2Duediligencequestionnaire = c.entityRegulatedstatusPart2Duediligencequestionnaire,
		luxsentityRegulatedstatusPart2Duediligencequestionnaire = c.luxsentityRegulatedstatusPart2Duediligencequestionnaire,
		indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire = c.indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire,
		tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire = c.tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire,
		goventityPart2Duediligencequestionnaire = c.goventityPart2Duediligencequestionnaire,
		nomineePart2Duediligencequestionnaire = c.nomineePart2Duediligencequestionnaire,
		categoryNomineePart2Duediligencequestionnaire = c.categoryNomineePart2Duediligencequestionnaire,
		specificrepresentativeCategoryNomineePart2Duediligencequestionnaire = c.specificrepresentativeCategoryNomineePart2Duediligencequestionnaire,
		affiliatedPart2Duediligencequestionnaire = c.affiliatedPart2Duediligencequestionnaire,
		indicateAffiliatedPart2Duediligencequestionnaire = c.indicateAffiliatedPart2Duediligencequestionnaire,
		nameControlpersonPart2Duediligencequestionnaire = c.nameControlpersonPart2Duediligencequestionnaire,
		tittleControlpersonPart2Duediligencequestionnaire = c.tittleControlpersonPart2Duediligencequestionnaire,
		dobControlpersonPart2Duediligencequestionnaire = c.dobControlpersonPart2Duediligencequestionnaire,
		addressControlpersonPart2Duediligencequestionnaire = c.addressControlpersonPart2Duediligencequestionnaire,
		idControlpersonPart2Duediligencequestionnaire = c.idControlpersonPart2Duediligencequestionnaire,
		citizenshipControlpersonPart2Duediligencequestionnaire = c.citizenshipControlpersonPart2Duediligencequestionnaire,
		pepControlpersonPart2Duediligencequestionnaire = c.pepControlpersonPart2Duediligencequestionnaire,
		publiclytradedControlpersonPart2Duediligencequestionnaire = c.publiclytradedControlpersonPart2Duediligencequestionnaire,
		regulatedentityControlpersonPart2Duediligencequestionnaire = c.regulatedentityControlpersonPart2Duediligencequestionnaire,
		nameControlpersonPart2Duediligencequestionnaire0 = c.nameControlpersonPart2Duediligencequestionnaire0,
		tittleControlpersonPart2Duediligencequestionnaire0 = c.tittleControlpersonPart2Duediligencequestionnaire0,
		dobControlpersonPart2Duediligencequestionnaire0 = c.dobControlpersonPart2Duediligencequestionnaire0,
		addressControlpersonPart2Duediligencequestionnaire0 = c.addressControlpersonPart2Duediligencequestionnaire0,
		idControlpersonPart2Duediligencequestionnaire0 = c.idControlpersonPart2Duediligencequestionnaire0,
		citizenshipControlpersonPart2Duediligencequestionnaire0 = c.citizenshipControlpersonPart2Duediligencequestionnaire0,
		pepControlpersonPart2Duediligencequestionnaire0 = c.pepControlpersonPart2Duediligencequestionnaire0,
		publiclytradedControlpersonPart2Duediligencequestionnaire0 = c.publiclytradedControlpersonPart2Duediligencequestionnaire0,
		regulatedentityControlpersonPart2Duediligencequestionnaire0 = c.regulatedentityControlpersonPart2Duediligencequestionnaire0,
		nameControlpersonPart2Duediligencequestionnaire1 = c.nameControlpersonPart2Duediligencequestionnaire1,
		tittleControlpersonPart2Duediligencequestionnaire1 = c.tittleControlpersonPart2Duediligencequestionnaire1,
		dobControlpersonPart2Duediligencequestionnaire1 = c.dobControlpersonPart2Duediligencequestionnaire1,
		addressControlpersonPart2Duediligencequestionnaire1 = c.addressControlpersonPart2Duediligencequestionnaire1,
		idControlpersonPart2Duediligencequestionnaire1 = c.idControlpersonPart2Duediligencequestionnaire1,
		citizenshipControlpersonPart2Duediligencequestionnaire1 = c.citizenshipControlpersonPart2Duediligencequestionnaire1,
		pepControlpersonPart2Duediligencequestionnaire1 = c.pepControlpersonPart2Duediligencequestionnaire1,
		publiclytradedControlpersonPart2Duediligencequestionnaire1 = c.publiclytradedControlpersonPart2Duediligencequestionnaire1,
		regulatedentityControlpersonPart2Duediligencequestionnaire1 = c.regulatedentityControlpersonPart2Duediligencequestionnaire1,
		nameControlpersonPart2Duediligencequestionnaire2 = c.nameControlpersonPart2Duediligencequestionnaire2,
		tittleControlpersonPart2Duediligencequestionnaire2 = c.tittleControlpersonPart2Duediligencequestionnaire2,
		dobControlpersonPart2Duediligencequestionnaire2 = c.dobControlpersonPart2Duediligencequestionnaire2,
		addressControlpersonPart2Duediligencequestionnaire2 = c.addressControlpersonPart2Duediligencequestionnaire2,
		idControlpersonPart2Duediligencequestionnaire2 = c.idControlpersonPart2Duediligencequestionnaire2,
		citizenshipControlpersonPart2Duediligencequestionnaire2 = c.citizenshipControlpersonPart2Duediligencequestionnaire2,
		pepControlpersonPart2Duediligencequestionnaire2 = c.pepControlpersonPart2Duediligencequestionnaire2,
		publiclytradedControlpersonPart2Duediligencequestionnaire2 = c.publiclytradedControlpersonPart2Duediligencequestionnaire2,
		regulatedentityControlpersonPart2Duediligencequestionnaire2 = c.regulatedentityControlpersonPart2Duediligencequestionnaire2,
		nameControlpersonPart2Duediligencequestionnaire3 = c.nameControlpersonPart2Duediligencequestionnaire3,
		tittleControlpersonPart2Duediligencequestionnaire3 = c.tittleControlpersonPart2Duediligencequestionnaire3,
		dobControlpersonPart2Duediligencequestionnaire3 = c.dobControlpersonPart2Duediligencequestionnaire3,
		addressControlpersonPart2Duediligencequestionnaire3 = c.addressControlpersonPart2Duediligencequestionnaire3,
		idControlpersonPart2Duediligencequestionnaire3 = c.idControlpersonPart2Duediligencequestionnaire3,
		citizenshipControlpersonPart2Duediligencequestionnaire3 = c.citizenshipControlpersonPart2Duediligencequestionnaire3,
		pepControlpersonPart2Duediligencequestionnaire3 = c.pepControlpersonPart2Duediligencequestionnaire3,
		publiclytradedControlpersonPart2Duediligencequestionnaire3 = c.publiclytradedControlpersonPart2Duediligencequestionnaire3,
		regulatedentityControlpersonPart2Duediligencequestionnaire3 = c.regulatedentityControlpersonPart2Duediligencequestionnaire3,
		asaFullnameBeneficialownerAmlquestionnaire = c.asaFullnameBeneficialownerAmlquestionnaire,
		tittleBeneficialownerAmlquestionnaire = c.tittleBeneficialownerAmlquestionnaire,
		asaDateofbirthBeneficialownerAmlquestionnaire = c.asaDateofbirthBeneficialownerAmlquestionnaire,
		asaResidentialaddressBeneficialownerAmlquestionnaire = c.asaResidentialaddressBeneficialownerAmlquestionnaire,
		addressUbo = c.addressUbo,
		idBeneficialownerPart2Duediligencequestionnaire = c.idBeneficialownerPart2Duediligencequestionnaire,
		citizenshipBeneficialownerPart2Duediligencequestionnaire = c.citizenshipBeneficialownerPart2Duediligencequestionnaire,
		pepBeneficialownerPart2Duediligencequestionnaire = c.pepBeneficialownerPart2Duediligencequestionnaire,
		publiclytradedBeneficialownerPart2Duediligencequestionnaire = c.publiclytradedBeneficialownerPart2Duediligencequestionnaire,
		regulatedentityBeneficialownerPart2Duediligencequestionnaire = c.regulatedentityBeneficialownerPart2Duediligencequestionnaire,
		asaFullnameBeneficialownerAmlquestionnaire0 = c.asaFullnameBeneficialownerAmlquestionnaire0,
		tittleBeneficialownerAmlquestionnaire0 = c.tittleBeneficialownerAmlquestionnaire0,
		asaDateofbirthBeneficialownerAmlquestionnaire0 = c.asaDateofbirthBeneficialownerAmlquestionnaire0,
		asaResidentialaddressBeneficialownerAmlquestionnaire0 = c.asaResidentialaddressBeneficialownerAmlquestionnaire0,
		addressUbo0 = c.addressUbo0,
		idBeneficialownerPart2Duediligencequestionnaire0 = c.idBeneficialownerPart2Duediligencequestionnaire0,
		citizenshipBeneficialownerPart2Duediligencequestionnaire0 = c.citizenshipBeneficialownerPart2Duediligencequestionnaire0,
		pepBeneficialownerPart2Duediligencequestionnaire0 = c.pepBeneficialownerPart2Duediligencequestionnaire0,
		publiclytradedBeneficialownerPart2Duediligencequestionnaire0 = c.publiclytradedBeneficialownerPart2Duediligencequestionnaire0,
		regulatedentityBeneficialownerPart2Duediligencequestionnaire0 = c.regulatedentityBeneficialownerPart2Duediligencequestionnaire0,
		asaFullnameBeneficialownerAmlquestionnaire1 = c.asaFullnameBeneficialownerAmlquestionnaire1,
		tittleBeneficialownerAmlquestionnaire1 = c.tittleBeneficialownerAmlquestionnaire1,
		asaDateofbirthBeneficialownerAmlquestionnaire1 = c.asaDateofbirthBeneficialownerAmlquestionnaire1,
		asaResidentialaddressBeneficialownerAmlquestionnaire1 = c.asaResidentialaddressBeneficialownerAmlquestionnaire1,
		addressUbo1 = c.addressUbo1,
		idBeneficialownerPart2Duediligencequestionnaire1 = c.idBeneficialownerPart2Duediligencequestionnaire1,
		citizenshipBeneficialownerPart2Duediligencequestionnaire1 = c.citizenshipBeneficialownerPart2Duediligencequestionnaire1,
		pepBeneficialownerPart2Duediligencequestionnaire1 = c.pepBeneficialownerPart2Duediligencequestionnaire1,
		publiclytradedBeneficialownerPart2Duediligencequestionnaire1 = c.publiclytradedBeneficialownerPart2Duediligencequestionnaire1,
		regulatedentityBeneficialownerPart2Duediligencequestionnaire1 = c.regulatedentityBeneficialownerPart2Duediligencequestionnaire1,
		asaFullnameBeneficialownerAmlquestionnaire2 = c.asaFullnameBeneficialownerAmlquestionnaire2,
		tittleBeneficialownerAmlquestionnaire2 = c.tittleBeneficialownerAmlquestionnaire2,
		asaDateofbirthBeneficialownerAmlquestionnaire2 = c.asaDateofbirthBeneficialownerAmlquestionnaire2,
		asaResidentialaddressBeneficialownerAmlquestionnaire2 = c.asaResidentialaddressBeneficialownerAmlquestionnaire2,
		addressUbo2 = c.addressUbo2,
		idBeneficialownerPart2Duediligencequestionnaire2 = c.idBeneficialownerPart2Duediligencequestionnaire2,
		citizenshipBeneficialownerPart2Duediligencequestionnaire2 = c.citizenshipBeneficialownerPart2Duediligencequestionnaire2,
		pepBeneficialownerPart2Duediligencequestionnaire2 = c.pepBeneficialownerPart2Duediligencequestionnaire2,
		publiclytradedBeneficialownerPart2Duediligencequestionnaire2 = c.publiclytradedBeneficialownerPart2Duediligencequestionnaire2,
		regulatedentityBeneficialownerPart2Duediligencequestionnaire2 = c.regulatedentityBeneficialownerPart2Duediligencequestionnaire2,
		asaFullnameBeneficialownerAmlquestionnaire3 = c.asaFullnameBeneficialownerAmlquestionnaire3,
		tittleBeneficialownerAmlquestionnaire3 = c.tittleBeneficialownerAmlquestionnaire3,
		asaDateofbirthBeneficialownerAmlquestionnaire3 = c.asaDateofbirthBeneficialownerAmlquestionnaire3,
		asaResidentialaddressBeneficialownerAmlquestionnaire3 = c.asaResidentialaddressBeneficialownerAmlquestionnaire3,
		addressUbo3 = c.addressUbo3,
		idBeneficialownerPart2Duediligencequestionnaire3 = c.idBeneficialownerPart2Duediligencequestionnaire3,
		citizenshipBeneficialownerPart2Duediligencequestionnaire3 = c.citizenshipBeneficialownerPart2Duediligencequestionnaire3,
		pepBeneficialownerPart2Duediligencequestionnaire3 = c.pepBeneficialownerPart2Duediligencequestionnaire3,
		publiclytradedBeneficialownerPart2Duediligencequestionnaire3 = c.publiclytradedBeneficialownerPart2Duediligencequestionnaire3,
		regulatedentityBeneficialownerPart2Duediligencequestionnaire3 = c.regulatedentityBeneficialownerPart2Duediligencequestionnaire3,
		clientquestionnairePart2Signatory = c.clientquestionnairePart2Signatory,
		asaFullnameInvestornameGeneralinfo2 = c.asaFullnameInvestornameGeneralinfo2,
		wireInstructions = c.wireInstructions,
		nameofsubscriberWireinstructiontoPart3Duediligencequestionnaire = c.nameofsubscriberWireinstructiontoPart3Duediligencequestionnaire,
		brokerageFirm = c.brokerageFirm,
		typeofownershipIndividualsInvestorquestionnaire = c.typeofownershipIndividualsInvestorquestionnaire,
		asaAccreditedinvestorAccreditedinvestor = c.asaAccreditedinvestorAccreditedinvestor,
		qualifiedpurchaserIndividualsInvestorquestionnaire = c.qualifiedpurchaserIndividualsInvestorquestionnaire,
		uspersonIndividualsInvestorquestionnaire = c.uspersonIndividualsInvestorquestionnaire,
		qualifiedclientIndividualsInvestorquestionnaire = c.qualifiedclientIndividualsInvestorquestionnaire,
		notinvest1100IndividualsInvestorquestionnaire = c.notinvest1100IndividualsInvestorquestionnaire,
		taxtreatmentTaxmatterIndividualsInvestorquestionnaire = c.taxtreatmentTaxmatterIndividualsInvestorquestionnaire,
		explainotherTaxtreatmentTaxmatterIndividualsInvestorquestionnaire = c.explainotherTaxtreatmentTaxmatterIndividualsInvestorquestionnaire,
		ustinorssnTaxmatterIndividualsInvestorquestionnaire = c.ustinorssnTaxmatterIndividualsInvestorquestionnaire,
		ustinorssnTaxmatterIndividualsInvestorquestionnaire0 = c.ustinorssnTaxmatterIndividualsInvestorquestionnaire0,
		uktaxrefTaxmatterIndividualsInvestorquestionnaire = c.uktaxrefTaxmatterIndividualsInvestorquestionnaire,
		uktaxrefTaxmatterIndividualsInvestorquestionnaire0 = c.uktaxrefTaxmatterIndividualsInvestorquestionnaire0,
		nonustinTaxmatterIndividualsInvestorquestionnaire = c.nonustinTaxmatterIndividualsInvestorquestionnaire,
		nonustinTaxmatterIndividualsInvestorquestionnaire0 = c.nonustinTaxmatterIndividualsInvestorquestionnaire0,
		countrynonustinTaxmatterIndividualsInvestorquestionnaire = c.countrynonustinTaxmatterIndividualsInvestorquestionnaire,
		countrynonustinTaxmatterIndividualsInvestorquestionnaire0 = c.countrynonustinTaxmatterIndividualsInvestorquestionnaire0,
		disregardedentityTaxmatterIndividualsInvestorquestionnaire = c.disregardedentityTaxmatterIndividualsInvestorquestionnaire,
		nameTaxownerTaxmatterIndividualsInvestorquestionnaire = c.nameTaxownerTaxmatterIndividualsInvestorquestionnaire,
		countryTaxownerTaxmatterIndividualsInvestorquestionnaire = c.countryTaxownerTaxmatterIndividualsInvestorquestionnaire,
		taxidTaxownerTaxmatterIndividualsInvestorquestionnaire = c.taxidTaxownerTaxmatterIndividualsInvestorquestionnaire,
		staeTaxownerTaxmatterIndividualsInvestorquestionnaire = c.staeTaxownerTaxmatterIndividualsInvestorquestionnaire,
		noncooperativejurisdictionsIndividualsInvestorquestionnaire = c.noncooperativejurisdictionsIndividualsInvestorquestionnaire,
		electingfeepartnerIndividualsInvestorquestionnaire = c.electingfeepartnerIndividualsInvestorquestionnaire,
		skipFinraIndividualsInvestorquestionnaire = c.skipFinraIndividualsInvestorquestionnaire,
		finraIndividualsInvestorquestionnaire = c.finraIndividualsInvestorquestionnaire,
		brokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup = c.brokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup,
		immediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup = c.immediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup,
		nameemployedImmediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaire = c.nameemployedImmediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaire,
		personsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup = c.personsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup,
		immediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup = c.immediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup,
		specifynameImmediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaire = c.specifynameImmediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaire,
		publiccompanyFinraIndividualsInvestorquestionnaireGroup = c.publiccompanyFinraIndividualsInvestorquestionnaireGroup,
		asaConvictedlast10yearsBadactor = c.asaConvictedlast10yearsBadactor,
		asaSubjecttojudgementlast5yearsBadactor = c.asaSubjecttojudgementlast5yearsBadactor,
		asaSubjecttofinalorderBadactor = c.asaSubjecttofinalorderBadactor,
		asaSubjecttosecorder15bor15cBadactor = c.asaSubjecttosecorder15bor15cBadactor,
		asaSubjecttosecorderpast5yearsBadactor = c.asaSubjecttosecorderpast5yearsBadactor,
		asaSuspendedmembershipBadactor = c.asaSuspendedmembershipBadactor,
		asaUnderwriterBadactor = c.asaUnderwriterBadactor,
		asaUspsfalserepresentationBadactor = c.asaUspsfalserepresentationBadactor,
		notsubjectS506dregulationdIndividualsInvestorquestionnaire = c.notsubjectS506dregulationdIndividualsInvestorquestionnaire,
		subscriberacknowledgesIndividualsInvestorquestionnaire = c.subscriberacknowledgesIndividualsInvestorquestionnaire,
		asaAccreditedinvestorAccreditedinvestor1 = c.asaAccreditedinvestorAccreditedinvestor1,
		nameofplanfiduciaryAccreditedinvestorEntityInvestorquestionnaire = c.nameofplanfiduciaryAccreditedinvestorEntityInvestorquestionnaire,
		voluntaryEmployeebenefitplanEntityInvestorquestionnaire = c.voluntaryEmployeebenefitplanEntityInvestorquestionnaire,
		registerrequiredEmployeebenefitplanEntityInvestorquestionnaire = c.registerrequiredEmployeebenefitplanEntityInvestorquestionnaire,
		permitEmployeebenefitplanEntityInvestorquestionnaire = c.permitEmployeebenefitplanEntityInvestorquestionnaire,
		asaQualifiedpurchaserQualifiedpurchaser = c.asaQualifiedpurchaserQualifiedpurchaser,
		purposeEntityInvestorquestionnaire = c.purposeEntityInvestorquestionnaire,
		lessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire = c.lessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire,
		howmanylessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire = c.howmanylessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire,
		morethan10countasNumberofbeneficialownersEntityInvestorquestionnaire = c.morethan10countasNumberofbeneficialownersEntityInvestorquestionnaire,
		howmanymorethan10countasNumberofbeneficialownersEntityInvestorquestionnaire = c.howmanymorethan10countasNumberofbeneficialownersEntityInvestorquestionnaire,
		asaJurisdictionoftaxresidencyGeneralinfo = c.asaJurisdictionoftaxresidencyGeneralinfo,
		jurisdictionyearendTaxmatterEntityInvestorquestionnaire = c.jurisdictionyearendTaxmatterEntityInvestorquestionnaire,
		usyearendTaxmatterEntityInvestorquestionnaire = c.usyearendTaxmatterEntityInvestorquestionnaire,
		taxstatusTaxmatterEntityInvestorquestionnaire = c.taxstatusTaxmatterEntityInvestorquestionnaire,
		exemptTaxmatterEntityInvestorquestionnaire = c.exemptTaxmatterEntityInvestorquestionnaire,
		treatmentTaxmatterEntityInvestorquestionnaire = c.treatmentTaxmatterEntityInvestorquestionnaire,
		explainotherTreatmentTaxmatterEntityInvestorquestionnaire = c.explainotherTreatmentTaxmatterEntityInvestorquestionnaire,
		indicatedisregardedTreatmentTaxmatterEntityInvestorquestionnaire = c.indicatedisregardedTreatmentTaxmatterEntityInvestorquestionnaire,
		morethan50percentPartnershipsTaxmatterEntityInvestorquestionnaire = c.morethan50percentPartnershipsTaxmatterEntityInvestorquestionnaire,
		satisfy100partnerlimitationPartnershipsTaxmatterEntityInvestorquestionnaire = c.satisfy100partnerlimitationPartnershipsTaxmatterEntityInvestorquestionnaire,
		percentTaxmatterEntityInvestorquestionnaire = c.percentTaxmatterEntityInvestorquestionnaire,
		foreignsovereignTaxmatterEntityInvestorquestionnaire = c.foreignsovereignTaxmatterEntityInvestorquestionnaire,
		caipartnerTaxmatterEntityInvestorquestionnaire = c.caipartnerTaxmatterEntityInvestorquestionnaire,
		s511TaxexemptEntityInvestorquestionnaire = c.s511TaxexemptEntityInvestorquestionnaire,
		onwerexemptS511TaxexemptEntityInvestorquestionnaire = c.onwerexemptS511TaxexemptEntityInvestorquestionnaire,
		partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire = c.partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire,
		taxexemptlpTaxexemptEntityInvestorquestionnaire = c.taxexemptlpTaxexemptEntityInvestorquestionnaire,
		blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire = c.blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire,
		entitledTaxexemptEntityInvestorquestionnaire = c.entitledTaxexemptEntityInvestorquestionnaire,
		subtypeEntitledTaxexemptEntityInvestorquestionnaire = c.subtypeEntitledTaxexemptEntityInvestorquestionnaire,
		usgovernmentpersonEntityInvestorquestionnaire = c.usgovernmentpersonEntityInvestorquestionnaire,
		nonusNonustaxstatusEntityInvestorquestionnaire = c.nonusNonustaxstatusEntityInvestorquestionnaire,
		partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire = c.partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire,
		nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire = c.nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire,
		electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire = c.electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire,
		electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire = c.electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire,
		usgovernmentalTaxcreditEntityInvestorquestionnaire = c.usgovernmentalTaxcreditEntityInvestorquestionnaire,
		taxexemptTaxcreditEntityInvestorquestionnaire = c.taxexemptTaxcreditEntityInvestorquestionnaire,
		taxableusTaxcreditEntityInvestorquestionnaire = c.taxableusTaxcreditEntityInvestorquestionnaire,
		nonusTaxcreditEntityInvestorquestionnaire = c.nonusTaxcreditEntityInvestorquestionnaire,
		prohibitforeignentityEntityInvestorquestionnaire = c.prohibitforeignentityEntityInvestorquestionnaire,
		noncooperativejurisdictionsEntityInvestorquestionnaire = c.noncooperativejurisdictionsEntityInvestorquestionnaire,
		fiscallytransparentS894benefitsEntityInvestorquestionnaire = c.fiscallytransparentS894benefitsEntityInvestorquestionnaire,
		caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire = c.caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire,
		withholdingqualifiedholderEntityInvestorquestionnaire = c.withholdingqualifiedholderEntityInvestorquestionnaire,
		planassetsErisaEntityInvestorquestionnaire = c.planassetsErisaEntityInvestorquestionnaire,
		asaErisaErisa = c.asaErisaErisa,
		percentofassetErisaEntityInvestorquestionnaire = c.percentofassetErisaEntityInvestorquestionnaire,
		otherentityErisaEntityInvestorquestionnaireGroup = c.otherentityErisaEntityInvestorquestionnaireGroup,
		lessthan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire = c.lessthan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire,
		morethan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire = c.morethan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire,
		controllinginfluenceCheckyesornoEntityInvestorquestionnaire = c.controllinginfluenceCheckyesornoEntityInvestorquestionnaire,
		publicaccesslawmattersEntityInvestorquestionnaire = c.publicaccesslawmattersEntityInvestorquestionnaire,
		seperatelegalpersonalityAdditionalquestionsEntityInvestorquestionnaire = c.seperatelegalpersonalityAdditionalquestionsEntityInvestorquestionnaire,
		interestsAdditionalquestionsEntityInvestorquestionnaire = c.interestsAdditionalquestionsEntityInvestorquestionnaire,
		avoidregistrationAdditionalquestionsEntityInvestorquestionnaire = c.avoidregistrationAdditionalquestionsEntityInvestorquestionnaire,
		consentAdditionalquestionsEntityInvestorquestionnaire = c.consentAdditionalquestionsEntityInvestorquestionnaire,
		restrictedpersonorcoveredpersonNewissuesEntityInvestorquestionnaire = c.restrictedpersonorcoveredpersonNewissuesEntityInvestorquestionnaire,
		generalexemptionsNewissuesEntityInvestorquestionnaire = c.generalexemptionsNewissuesEntityInvestorquestionnaire,
		allocateprofitsorlossesOtherentityGeneralexemptionsNewissuesEntityInvestorquestionnaire = c.allocateprofitsorlossesOtherentityGeneralexemptionsNewissuesEntityInvestorquestionnaire,
		restrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire = c.restrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire,
		brokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = c.brokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup,
		immediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = c.immediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup,
		nameemployedImmediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire = c.nameemployedImmediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire,
		personowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = c.personowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup,
		immediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = c.immediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup,
		brokerdealernameImmediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire = c.brokerdealernameImmediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire,
		publiccompanyRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = c.publiccompanyRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup,
		electingfeepartnerEntityInvestorquestionnaire = c.electingfeepartnerEntityInvestorquestionnaire,
		commit1100EntityInvestorquestionnaire = c.commit1100EntityInvestorquestionnaire,
		qualifiedclientEntityInvestorquestionnaire = c.qualifiedclientEntityInvestorquestionnaire,
		asaBhcSpecialentities = c.asaBhcSpecialentities,
		governmentalplanBhc = c.governmentalplanBhc,
		asaConvictedlast10yearsBadactor1 = c.asaConvictedlast10yearsBadactor1,
		asaSubjecttojudgementlast5yearsBadactor1 = c.asaSubjecttojudgementlast5yearsBadactor1,
		asaSubjecttofinalorderBadactor1 = c.asaSubjecttofinalorderBadactor1,
		asaSubjecttosecorder15bor15cBadactor1 = c.asaSubjecttosecorder15bor15cBadactor1,
		asaSubjecttosecorderpast5yearsBadactor1 = c.asaSubjecttosecorderpast5yearsBadactor1,
		asaSuspendedmembershipBadactor1 = c.asaSuspendedmembershipBadactor1,
		asaUnderwriterBadactor1 = c.asaUnderwriterBadactor1,
		asaUspsfalserepresentationBadactor1 = c.asaUspsfalserepresentationBadactor1,
		notsubject506dofregulationdEntityInvestorquestionnaire = c.notsubject506dofregulationdEntityInvestorquestionnaire,
		beenrefferedThirdpartyreferralsEntityInvestorquestionnaire = c.beenrefferedThirdpartyreferralsEntityInvestorquestionnaire,
		nameBeenrefferedThirdpartyreferralsEntityInvestorquestionnaire = c.nameBeenrefferedThirdpartyreferralsEntityInvestorquestionnaire,
		signeddisclosurestatementThirdpartyreferralsEntityInvestorquestionnaire = c.signeddisclosurestatementThirdpartyreferralsEntityInvestorquestionnaire,
		subscriberacknowledgesEntityInvestorquestionnaire = c.subscriberacknowledgesEntityInvestorquestionnaire,
		subscribernameConsentstatement = c.subscribernameConsentstatement,
		nameAuthorizedsignatoryConsentstatement = c.nameAuthorizedsignatoryConsentstatement,
		titleAuthorizedsignatoryConsentstatement = c.titleAuthorizedsignatoryConsentstatement,
		nameAuthorizedsignatory2Consentstatement = c.nameAuthorizedsignatory2Consentstatement,
		titleAuthorizedsignatory2Consentstatement = c.titleAuthorizedsignatory2Consentstatement,
		dateAuthorizedsignatoryConsentstatement = c.dateAuthorizedsignatoryConsentstatement,
		dateAuthorizedsignatory2Consentstatement = c.dateAuthorizedsignatory2Consentstatement,
		transparentordisregardedSection1Exhibite = c.transparentordisregardedSection1Exhibite,
		taxableSection1Exhibite = c.taxableSection1Exhibite,
		section2Exhibite = c.section2Exhibite,
		domiciledoregisteredineeaEeaiqs = c.domiciledoregisteredineeaEeaiqs,
		specifyDomiciledoregisteredineeaEeaiqs = c.specifyDomiciledoregisteredineeaEeaiqs,
		onbehalfEeaiqs = c.onbehalfEeaiqs,
		nameOnbehalfEeaiqs = c.nameOnbehalfEeaiqs,
		positionOnbehalfEeaiqs = c.positionOnbehalfEeaiqs,
		corporateOnbehalfEeaiqs = c.corporateOnbehalfEeaiqs,
		stateOnbehalfEeaiqs = c.stateOnbehalfEeaiqs,
		representEearepandrequest = c.representEearepandrequest,
		groupRepresentEearepandrequest = c.groupRepresentEearepandrequest,
		natureAntherinstitutionalinvestorRepresentEearepandrequest = c.natureAntherinstitutionalinvestorRepresentEearepandrequest,
		groupLargeundertakingRepresentEearepandrequest = c.groupLargeundertakingRepresentEearepandrequest,
		electiveprofessionalcriteriaEearepandrequest = c.electiveprofessionalcriteriaEearepandrequest,
		proinvestorstatusUkrepandrequest = c.proinvestorstatusUkrepandrequest,
		groupProinvestorstatusUkrepandrequest = c.groupProinvestorstatusUkrepandrequest,
		natureAntherinstitutionalinvestorProinvestorstatusUkrepandrequest = c.natureAntherinstitutionalinvestorProinvestorstatusUkrepandrequest,
		groupLargeundertakingProinvestorstatusUkrepandrequest = c.groupLargeundertakingProinvestorstatusUkrepandrequest,
		electiveprofessionalcriteriaUkrepandrequest = c.electiveprofessionalcriteriaUkrepandrequest,
		representUkiqs = c.representUkiqs,
		groupInvestmentproRepresentUkiqs = c.groupInvestmentproRepresentUkiqs,
		groupPersonInvestmentproRepresentUkiqs = c.groupPersonInvestmentproRepresentUkiqs,
		groupHighnetworthRepresentUkiqs = c.groupHighnetworthRepresentUkiqs,
		groupCorporateHighnetworthRepresentUkiqs = c.groupCorporateHighnetworthRepresentUkiqs,
		regularqualifiedinvestorsSwissinvestorAppendixb = c.regularqualifiedinvestorsSwissinvestorAppendixb,
		typesLargeundertakingRegularqualifiedinvestorsScheduleh = c.typesLargeundertakingRegularqualifiedinvestorsScheduleh,
		electedqualifiedinvestorsSchedulehAppendixb = c.electedqualifiedinvestorsSchedulehAppendixb,
		swissexemptSchedulehAppendixb = c.swissexemptSchedulehAppendixb,
		provinceresidentCanadianiqs = c.provinceresidentCanadianiqs,
		isaccreditedinvestorCanadianiqs = c.isaccreditedinvestorCanadianiqs,
		ispermittedclientCanadianiqs = c.ispermittedclientCanadianiqs,
		accredittedinvestorCanadiansupplement = c.accredittedinvestorCanadiansupplement,
		permittedclientrepresentationCanadiansupplement = c.permittedclientrepresentationCanadiansupplement,
		canadianSignatory = c.canadianSignatory,
		qualifiedinstitutionalinvestorstatusJapanregulations = c.qualifiedinstitutionalinvestorstatusJapanregulations,
		nonqualifiedinstitutionalinvestorstatusJapanregulations = c.nonqualifiedinstitutionalinvestorstatusJapanregulations,
		collectiveinvestmentschemeorspecialpurposecoJapanregulations = c.collectiveinvestmentschemeorspecialpurposecoJapanregulations,
		typeYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations = c.typeYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations,
		numberofqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations = c.numberofqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations,
		numberofnonqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations = c.numberofnonqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations,
		professionalinvestorstatusJapanregulations = c.professionalinvestorstatusJapanregulations,
		treatasgeneralinvestorYesProfessionalinvestorstatusJapanregulations = c.treatasgeneralinvestorYesProfessionalinvestorstatusJapanregulations,
		totalassetsStatusofassetsProfessionalinvestorstatusJapanregulations = c.totalassetsStatusofassetsProfessionalinvestorstatusJapanregulations,
		netassetsStatusofassetsProfessionalinvestorstatusJapanregulations = c.netassetsStatusofassetsProfessionalinvestorstatusJapanregulations,
		financialassetsStatusofassetsProfessionalinvestorstatusJapanregulations = c.financialassetsStatusofassetsProfessionalinvestorstatusJapanregulations,
		forcollectiveinvestmentschemeInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations = c.forcollectiveinvestmentschemeInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations,
		forothersecuritiesInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations = c.forothersecuritiesInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations,
		purposeoftransactionAmlJapanregulations = c.purposeoftransactionAmlJapanregulations,
		specifyOtherPurposeoftransactionAmlJapanregulations = c.specifyOtherPurposeoftransactionAmlJapanregulations,
		businessofinvestorAmlJapanregulations = c.businessofinvestorAmlJapanregulations,
		specifyOtherBusinessofinvestorAmlJapanregulations = c.specifyOtherBusinessofinvestorAmlJapanregulations,
		occupationofinvestorAmlJapanregulations = c.occupationofinvestorAmlJapanregulations,
		specifyOtherOccupationofinvestorAmlJapanregulations = c.specifyOtherOccupationofinvestorAmlJapanregulations,
		taxcreditWarranties = c.taxcreditWarranties,
		subscribernameTaxcreditWarranties = c.subscribernameTaxcreditWarranties,
		taxowner2Signatory = c.taxowner2Signatory,
		witness2Signatory = c.witness2Signatory,
		qualifiedbusinessSupplementalforeign = c.qualifiedbusinessSupplementalforeign,
		morethan50percstockSupplementalforeign = c.morethan50percstockSupplementalforeign,
		section9901Supplementalforeign = c.section9901Supplementalforeign,
		chinesemilitarySupplementalforeign = c.chinesemilitarySupplementalforeign,
		entitylistrequiredSupplementalforeign = c.entitylistrequiredSupplementalforeign,
		section154bSupplementalforeign = c.section154bSupplementalforeign,
		dateAddtionalrepresentations = c.dateAddtionalrepresentations,
		letterSubscribernameAddtionalrepresentations = c.letterSubscribernameAddtionalrepresentations,
		naturalpersonAddtionalrepresentations = c.naturalpersonAddtionalrepresentations,
		entityAddtionalrepresentations = c.entityAddtionalrepresentations,
		additionalrepresentationsSignatory = c.additionalrepresentationsSignatory,
	}
end

function SourceMasterTable.makeSourceMasterTableSchema(config: {
	fieldsMap: SourceMasterTableFieldsMap?,
	fieldKeysInOrder: {string}?,
	label: string?,
}?): SourceMasterTableSchema
	local c = config or {}
	return {
		fieldsMap = c.fieldsMap,
		fieldKeysInOrder = c.fieldKeysInOrder or {},
		label = c.label or "",
	}
end

local function decodeOptionalMultipleCheckboxType(json: any): DataTypes.MultipleCheckboxType?
	if json == nil then return nil end
	return DataTypes.decodeJsonMultipleCheckboxType(json)
end
local function encodeOptionalMultipleCheckboxType(v: DataTypes.MultipleCheckboxType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonMultipleCheckboxType(v)
end
local function decodeOptionalStringType(json: any): DataTypes.StringType?
	if json == nil then return nil end
	return DataTypes.decodeJsonStringType(json)
end
local function encodeOptionalStringType(v: DataTypes.StringType?): {[string]: any}?
	if v == nil then return nil end
	return DataTypes.encodeJsonStringType(v)
end

function SourceMasterTable.encodeJsonSourceMasterTableAdditionalrepresentationsSignatoryFields(sf: SourceMasterTableAdditionalrepresentationsSignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.subscribernameAddtionalrepresentations = encodeOptionalStringType(sf.subscribernameAddtionalrepresentations)
	result.signornameAddtionalrepresentations = encodeOptionalStringType(sf.signornameAddtionalrepresentations)
	result.signortitleAddtionalrepresentations = encodeOptionalStringType(sf.signortitleAddtionalrepresentations)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAdditionalrepresentationsSignatoryFields(json: {[string]: any}): SourceMasterTableAdditionalrepresentationsSignatoryFields
	return {
		subscribernameAddtionalrepresentations = decodeOptionalStringType(json.subscribernameAddtionalrepresentations),
		signornameAddtionalrepresentations = decodeOptionalStringType(json.signornameAddtionalrepresentations),
		signortitleAddtionalrepresentations = decodeOptionalStringType(json.signortitleAddtionalrepresentations),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAdditionalrepresentationsSignatoryType(t: SourceMasterTableAdditionalrepresentationsSignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableAdditionalrepresentationsSignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAdditionalrepresentationsSignatoryType(json: {[string]: any}): SourceMasterTableAdditionalrepresentationsSignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableAdditionalrepresentationsSignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUbo0Fields(sf: SourceMasterTableAddressUbo0Fields): {[string]: any}
	local result: {[string]: any} = {}
	result.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire0 = encodeOptionalStringType(sf.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire0)
	result.countryResidentialaddressBeneficialownerAmlquestionnaire0 = encodeOptionalStringType(sf.countryResidentialaddressBeneficialownerAmlquestionnaire0)
	result.zipResidentialaddressBeneficialownerAmlquestionnaire0 = encodeOptionalStringType(sf.zipResidentialaddressBeneficialownerAmlquestionnaire0)
	result.stateResidentialaddressBeneficialownerAmlquestionnaire0 = encodeOptionalStringType(sf.stateResidentialaddressBeneficialownerAmlquestionnaire0)
	result.cityResidentialaddressBeneficialownerAmlquestionnaire0 = encodeOptionalStringType(sf.cityResidentialaddressBeneficialownerAmlquestionnaire0)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUbo0Fields(json: {[string]: any}): SourceMasterTableAddressUbo0Fields
	return {
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire0 = decodeOptionalStringType(json.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire0),
		countryResidentialaddressBeneficialownerAmlquestionnaire0 = decodeOptionalStringType(json.countryResidentialaddressBeneficialownerAmlquestionnaire0),
		zipResidentialaddressBeneficialownerAmlquestionnaire0 = decodeOptionalStringType(json.zipResidentialaddressBeneficialownerAmlquestionnaire0),
		stateResidentialaddressBeneficialownerAmlquestionnaire0 = decodeOptionalStringType(json.stateResidentialaddressBeneficialownerAmlquestionnaire0),
		cityResidentialaddressBeneficialownerAmlquestionnaire0 = decodeOptionalStringType(json.cityResidentialaddressBeneficialownerAmlquestionnaire0),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUbo0Type(t: SourceMasterTableAddressUbo0Type): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableAddressUbo0Fields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUbo0Type(json: {[string]: any}): SourceMasterTableAddressUbo0Type
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableAddressUbo0Fields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUbo1Fields(sf: SourceMasterTableAddressUbo1Fields): {[string]: any}
	local result: {[string]: any} = {}
	result.countryResidentialaddressBeneficialownerAmlquestionnaire1 = encodeOptionalStringType(sf.countryResidentialaddressBeneficialownerAmlquestionnaire1)
	result.stateResidentialaddressBeneficialownerAmlquestionnaire1 = encodeOptionalStringType(sf.stateResidentialaddressBeneficialownerAmlquestionnaire1)
	result.zipResidentialaddressBeneficialownerAmlquestionnaire1 = encodeOptionalStringType(sf.zipResidentialaddressBeneficialownerAmlquestionnaire1)
	result.cityResidentialaddressBeneficialownerAmlquestionnaire1 = encodeOptionalStringType(sf.cityResidentialaddressBeneficialownerAmlquestionnaire1)
	result.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire1 = encodeOptionalStringType(sf.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire1)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUbo1Fields(json: {[string]: any}): SourceMasterTableAddressUbo1Fields
	return {
		countryResidentialaddressBeneficialownerAmlquestionnaire1 = decodeOptionalStringType(json.countryResidentialaddressBeneficialownerAmlquestionnaire1),
		stateResidentialaddressBeneficialownerAmlquestionnaire1 = decodeOptionalStringType(json.stateResidentialaddressBeneficialownerAmlquestionnaire1),
		zipResidentialaddressBeneficialownerAmlquestionnaire1 = decodeOptionalStringType(json.zipResidentialaddressBeneficialownerAmlquestionnaire1),
		cityResidentialaddressBeneficialownerAmlquestionnaire1 = decodeOptionalStringType(json.cityResidentialaddressBeneficialownerAmlquestionnaire1),
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire1 = decodeOptionalStringType(json.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire1),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUbo1Type(t: SourceMasterTableAddressUbo1Type): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableAddressUbo1Fields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUbo1Type(json: {[string]: any}): SourceMasterTableAddressUbo1Type
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableAddressUbo1Fields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUbo2Fields(sf: SourceMasterTableAddressUbo2Fields): {[string]: any}
	local result: {[string]: any} = {}
	result.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire2 = encodeOptionalStringType(sf.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire2)
	result.countryResidentialaddressBeneficialownerAmlquestionnaire2 = encodeOptionalStringType(sf.countryResidentialaddressBeneficialownerAmlquestionnaire2)
	result.stateResidentialaddressBeneficialownerAmlquestionnaire2 = encodeOptionalStringType(sf.stateResidentialaddressBeneficialownerAmlquestionnaire2)
	result.zipResidentialaddressBeneficialownerAmlquestionnaire2 = encodeOptionalStringType(sf.zipResidentialaddressBeneficialownerAmlquestionnaire2)
	result.cityResidentialaddressBeneficialownerAmlquestionnaire2 = encodeOptionalStringType(sf.cityResidentialaddressBeneficialownerAmlquestionnaire2)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUbo2Fields(json: {[string]: any}): SourceMasterTableAddressUbo2Fields
	return {
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire2 = decodeOptionalStringType(json.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire2),
		countryResidentialaddressBeneficialownerAmlquestionnaire2 = decodeOptionalStringType(json.countryResidentialaddressBeneficialownerAmlquestionnaire2),
		stateResidentialaddressBeneficialownerAmlquestionnaire2 = decodeOptionalStringType(json.stateResidentialaddressBeneficialownerAmlquestionnaire2),
		zipResidentialaddressBeneficialownerAmlquestionnaire2 = decodeOptionalStringType(json.zipResidentialaddressBeneficialownerAmlquestionnaire2),
		cityResidentialaddressBeneficialownerAmlquestionnaire2 = decodeOptionalStringType(json.cityResidentialaddressBeneficialownerAmlquestionnaire2),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUbo2Type(t: SourceMasterTableAddressUbo2Type): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableAddressUbo2Fields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUbo2Type(json: {[string]: any}): SourceMasterTableAddressUbo2Type
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableAddressUbo2Fields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUbo3Fields(sf: SourceMasterTableAddressUbo3Fields): {[string]: any}
	local result: {[string]: any} = {}
	result.cityResidentialaddressBeneficialownerAmlquestionnaire3 = encodeOptionalStringType(sf.cityResidentialaddressBeneficialownerAmlquestionnaire3)
	result.countryResidentialaddressBeneficialownerAmlquestionnaire3 = encodeOptionalStringType(sf.countryResidentialaddressBeneficialownerAmlquestionnaire3)
	result.zipResidentialaddressBeneficialownerAmlquestionnaire3 = encodeOptionalStringType(sf.zipResidentialaddressBeneficialownerAmlquestionnaire3)
	result.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire3 = encodeOptionalStringType(sf.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire3)
	result.stateResidentialaddressBeneficialownerAmlquestionnaire3 = encodeOptionalStringType(sf.stateResidentialaddressBeneficialownerAmlquestionnaire3)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUbo3Fields(json: {[string]: any}): SourceMasterTableAddressUbo3Fields
	return {
		cityResidentialaddressBeneficialownerAmlquestionnaire3 = decodeOptionalStringType(json.cityResidentialaddressBeneficialownerAmlquestionnaire3),
		countryResidentialaddressBeneficialownerAmlquestionnaire3 = decodeOptionalStringType(json.countryResidentialaddressBeneficialownerAmlquestionnaire3),
		zipResidentialaddressBeneficialownerAmlquestionnaire3 = decodeOptionalStringType(json.zipResidentialaddressBeneficialownerAmlquestionnaire3),
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire3 = decodeOptionalStringType(json.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire3),
		stateResidentialaddressBeneficialownerAmlquestionnaire3 = decodeOptionalStringType(json.stateResidentialaddressBeneficialownerAmlquestionnaire3),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUbo3Type(t: SourceMasterTableAddressUbo3Type): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableAddressUbo3Fields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUbo3Type(json: {[string]: any}): SourceMasterTableAddressUbo3Type
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableAddressUbo3Fields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUboFields(sf: SourceMasterTableAddressUboFields): {[string]: any}
	local result: {[string]: any} = {}
	result.zipResidentialaddressBeneficialownerAmlquestionnaire = encodeOptionalStringType(sf.zipResidentialaddressBeneficialownerAmlquestionnaire)
	result.cityResidentialaddressBeneficialownerAmlquestionnaire = encodeOptionalStringType(sf.cityResidentialaddressBeneficialownerAmlquestionnaire)
	result.stateResidentialaddressBeneficialownerAmlquestionnaire = encodeOptionalStringType(sf.stateResidentialaddressBeneficialownerAmlquestionnaire)
	result.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire = encodeOptionalStringType(sf.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire)
	result.countryResidentialaddressBeneficialownerAmlquestionnaire = encodeOptionalStringType(sf.countryResidentialaddressBeneficialownerAmlquestionnaire)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUboFields(json: {[string]: any}): SourceMasterTableAddressUboFields
	return {
		zipResidentialaddressBeneficialownerAmlquestionnaire = decodeOptionalStringType(json.zipResidentialaddressBeneficialownerAmlquestionnaire),
		cityResidentialaddressBeneficialownerAmlquestionnaire = decodeOptionalStringType(json.cityResidentialaddressBeneficialownerAmlquestionnaire),
		stateResidentialaddressBeneficialownerAmlquestionnaire = decodeOptionalStringType(json.stateResidentialaddressBeneficialownerAmlquestionnaire),
		numberandstreetResidentialaddressBeneficialownerAmlquestionnaire = decodeOptionalStringType(json.numberandstreetResidentialaddressBeneficialownerAmlquestionnaire),
		countryResidentialaddressBeneficialownerAmlquestionnaire = decodeOptionalStringType(json.countryResidentialaddressBeneficialownerAmlquestionnaire),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableAddressUboType(t: SourceMasterTableAddressUboType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableAddressUboFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableAddressUboType(json: {[string]: any}): SourceMasterTableAddressUboType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableAddressUboFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableBrokeragefirmFields(sf: SourceMasterTableBrokeragefirmFields): {[string]: any}
	local result: {[string]: any} = {}
	result.countryBrokerageaccountWireinfo = encodeOptionalStringType(sf.countryBrokerageaccountWireinfo)
	result.firmnameBrokerageaccountWireinfo = encodeOptionalStringType(sf.firmnameBrokerageaccountWireinfo)
	result.zipBrokerageaccountWireinfo = encodeOptionalStringType(sf.zipBrokerageaccountWireinfo)
	result.accountnameBrokerageaccountWireinfo = encodeOptionalStringType(sf.accountnameBrokerageaccountWireinfo)
	result.stateBrokerageaccountWireinfo = encodeOptionalStringType(sf.stateBrokerageaccountWireinfo)
	result.dtcnumberBrokerageaccountWireinfo = encodeOptionalStringType(sf.dtcnumberBrokerageaccountWireinfo)
	result.accountnumberBrokerageaccountWireinfo = encodeOptionalStringType(sf.accountnumberBrokerageaccountWireinfo)
	result.cityBrokerageaccountWireinfo = encodeOptionalStringType(sf.cityBrokerageaccountWireinfo)
	result.addressBrokerageaccountWireinfo = encodeOptionalStringType(sf.addressBrokerageaccountWireinfo)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableBrokeragefirmFields(json: {[string]: any}): SourceMasterTableBrokeragefirmFields
	return {
		countryBrokerageaccountWireinfo = decodeOptionalStringType(json.countryBrokerageaccountWireinfo),
		firmnameBrokerageaccountWireinfo = decodeOptionalStringType(json.firmnameBrokerageaccountWireinfo),
		zipBrokerageaccountWireinfo = decodeOptionalStringType(json.zipBrokerageaccountWireinfo),
		accountnameBrokerageaccountWireinfo = decodeOptionalStringType(json.accountnameBrokerageaccountWireinfo),
		stateBrokerageaccountWireinfo = decodeOptionalStringType(json.stateBrokerageaccountWireinfo),
		dtcnumberBrokerageaccountWireinfo = decodeOptionalStringType(json.dtcnumberBrokerageaccountWireinfo),
		accountnumberBrokerageaccountWireinfo = decodeOptionalStringType(json.accountnumberBrokerageaccountWireinfo),
		cityBrokerageaccountWireinfo = decodeOptionalStringType(json.cityBrokerageaccountWireinfo),
		addressBrokerageaccountWireinfo = decodeOptionalStringType(json.addressBrokerageaccountWireinfo),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableBrokeragefirmType(t: SourceMasterTableBrokeragefirmType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableBrokeragefirmFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableBrokeragefirmType(json: {[string]: any}): SourceMasterTableBrokeragefirmType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableBrokeragefirmFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableCanadianSignatoryFields(sf: SourceMasterTableCanadianSignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.dateSignaturepageCanadianiqs = encodeOptionalStringType(sf.dateSignaturepageCanadianiqs)
	result.investornameSignaturepageCanadianiqs = encodeOptionalStringType(sf.investornameSignaturepageCanadianiqs)
	result.provinceofresidentSignaturepageCanadianiqs = encodeOptionalStringType(sf.provinceofresidentSignaturepageCanadianiqs)
	result.authorizedsignatorynameSignaturepageCanadianiqs = encodeOptionalStringType(sf.authorizedsignatorynameSignaturepageCanadianiqs)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableCanadianSignatoryFields(json: {[string]: any}): SourceMasterTableCanadianSignatoryFields
	return {
		dateSignaturepageCanadianiqs = decodeOptionalStringType(json.dateSignaturepageCanadianiqs),
		investornameSignaturepageCanadianiqs = decodeOptionalStringType(json.investornameSignaturepageCanadianiqs),
		provinceofresidentSignaturepageCanadianiqs = decodeOptionalStringType(json.provinceofresidentSignaturepageCanadianiqs),
		authorizedsignatorynameSignaturepageCanadianiqs = decodeOptionalStringType(json.authorizedsignatorynameSignaturepageCanadianiqs),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableCanadianSignatoryType(t: SourceMasterTableCanadianSignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableCanadianSignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableCanadianSignatoryType(json: {[string]: any}): SourceMasterTableCanadianSignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableCanadianSignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableClientquestionnairePart1SignatoryFields(sf: SourceMasterTableClientquestionnairePart1SignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.signernamePart1Duediligencequestionnaire = encodeOptionalStringType(sf.signernamePart1Duediligencequestionnaire)
	result.datePart1Duediligencequestionnaire = encodeOptionalStringType(sf.datePart1Duediligencequestionnaire)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableClientquestionnairePart1SignatoryFields(json: {[string]: any}): SourceMasterTableClientquestionnairePart1SignatoryFields
	return {
		signernamePart1Duediligencequestionnaire = decodeOptionalStringType(json.signernamePart1Duediligencequestionnaire),
		datePart1Duediligencequestionnaire = decodeOptionalStringType(json.datePart1Duediligencequestionnaire),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableClientquestionnairePart1SignatoryType(t: SourceMasterTableClientquestionnairePart1SignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableClientquestionnairePart1SignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableClientquestionnairePart1SignatoryType(json: {[string]: any}): SourceMasterTableClientquestionnairePart1SignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableClientquestionnairePart1SignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableClientquestionnairePart2SignatoryFields(sf: SourceMasterTableClientquestionnairePart2SignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.signernamePart2Duediligencequestionnaire = encodeOptionalStringType(sf.signernamePart2Duediligencequestionnaire)
	result.datePart2Duediligencequestionnaire = encodeOptionalStringType(sf.datePart2Duediligencequestionnaire)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableClientquestionnairePart2SignatoryFields(json: {[string]: any}): SourceMasterTableClientquestionnairePart2SignatoryFields
	return {
		signernamePart2Duediligencequestionnaire = decodeOptionalStringType(json.signernamePart2Duediligencequestionnaire),
		datePart2Duediligencequestionnaire = decodeOptionalStringType(json.datePart2Duediligencequestionnaire),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableClientquestionnairePart2SignatoryType(t: SourceMasterTableClientquestionnairePart2SignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableClientquestionnairePart2SignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableClientquestionnairePart2SignatoryType(json: {[string]: any}): SourceMasterTableClientquestionnairePart2SignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableClientquestionnairePart2SignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableLpSignatoryFields(sf: SourceMasterTableLpSignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.entityAuthorizedtitleSignaturepage = encodeOptionalStringType(sf.entityAuthorizedtitleSignaturepage)
	result.dateSignaturepage = encodeOptionalStringType(sf.dateSignaturepage)
	result.entitySubscribernameSignaturepage = encodeOptionalStringType(sf.entitySubscribernameSignaturepage)
	result.asaCommitmentAmount = encodeOptionalStringType(sf.asaCommitmentAmount)
	result.entityAuthorizednameSignaturepage = encodeOptionalStringType(sf.entityAuthorizednameSignaturepage)
	result.individualSubscribernameSignaturepage = encodeOptionalStringType(sf.individualSubscribernameSignaturepage)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableLpSignatoryFields(json: {[string]: any}): SourceMasterTableLpSignatoryFields
	return {
		entityAuthorizedtitleSignaturepage = decodeOptionalStringType(json.entityAuthorizedtitleSignaturepage),
		dateSignaturepage = decodeOptionalStringType(json.dateSignaturepage),
		entitySubscribernameSignaturepage = decodeOptionalStringType(json.entitySubscribernameSignaturepage),
		asaCommitmentAmount = decodeOptionalStringType(json.asaCommitmentAmount),
		entityAuthorizednameSignaturepage = decodeOptionalStringType(json.entityAuthorizednameSignaturepage),
		individualSubscribernameSignaturepage = decodeOptionalStringType(json.individualSubscribernameSignaturepage),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableLpSignatoryType(t: SourceMasterTableLpSignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableLpSignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableLpSignatoryType(json: {[string]: any}): SourceMasterTableLpSignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableLpSignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableLuxGpSignatoryFields(sf: SourceMasterTableLuxGpSignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.nameFirstauthorizedsignatoryCapluxGpsignaturepage = encodeOptionalStringType(sf.nameFirstauthorizedsignatoryCapluxGpsignaturepage)
	result.nameSecondauthorizedsignatoryCapluxGpsignaturepage = encodeOptionalStringType(sf.nameSecondauthorizedsignatoryCapluxGpsignaturepage)
	result.titleFirstauthorizedsignatoryCapluxGpsignaturepage = encodeOptionalStringType(sf.titleFirstauthorizedsignatoryCapluxGpsignaturepage)
	result.titleSecondauthorizedsignatoryCapluxGpsignaturepage = encodeOptionalStringType(sf.titleSecondauthorizedsignatoryCapluxGpsignaturepage)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableLuxGpSignatoryFields(json: {[string]: any}): SourceMasterTableLuxGpSignatoryFields
	return {
		nameFirstauthorizedsignatoryCapluxGpsignaturepage = decodeOptionalStringType(json.nameFirstauthorizedsignatoryCapluxGpsignaturepage),
		nameSecondauthorizedsignatoryCapluxGpsignaturepage = decodeOptionalStringType(json.nameSecondauthorizedsignatoryCapluxGpsignaturepage),
		titleFirstauthorizedsignatoryCapluxGpsignaturepage = decodeOptionalStringType(json.titleFirstauthorizedsignatoryCapluxGpsignaturepage),
		titleSecondauthorizedsignatoryCapluxGpsignaturepage = decodeOptionalStringType(json.titleSecondauthorizedsignatoryCapluxGpsignaturepage),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableLuxGpSignatoryType(t: SourceMasterTableLuxGpSignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableLuxGpSignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableLuxGpSignatoryType(json: {[string]: any}): SourceMasterTableLuxGpSignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableLuxGpSignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableMainGpSignatoryFields(sf: SourceMasterTableMainGpSignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.acceptedcommitmentGpsignaturepage = encodeOptionalStringType(sf.acceptedcommitmentGpsignaturepage)
	result.nameFirstauthorizedsignatoryGpsignaturepage = encodeOptionalStringType(sf.nameFirstauthorizedsignatoryGpsignaturepage)
	result.titleFirstauthorizedsignatoryGpsignaturepage = encodeOptionalStringType(sf.titleFirstauthorizedsignatoryGpsignaturepage)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableMainGpSignatoryFields(json: {[string]: any}): SourceMasterTableMainGpSignatoryFields
	return {
		acceptedcommitmentGpsignaturepage = decodeOptionalStringType(json.acceptedcommitmentGpsignaturepage),
		nameFirstauthorizedsignatoryGpsignaturepage = decodeOptionalStringType(json.nameFirstauthorizedsignatoryGpsignaturepage),
		titleFirstauthorizedsignatoryGpsignaturepage = decodeOptionalStringType(json.titleFirstauthorizedsignatoryGpsignaturepage),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableMainGpSignatoryType(t: SourceMasterTableMainGpSignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableMainGpSignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableMainGpSignatoryType(json: {[string]: any}): SourceMasterTableMainGpSignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableMainGpSignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTablePlaceofbusinessEntityFields(sf: SourceMasterTablePlaceofbusinessEntityFields): {[string]: any}
	local result: {[string]: any} = {}
	result.asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire = encodeOptionalStringType(sf.asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire)
	result.asaCityCurrentbusinessaddressEntityAmlquestionnaire = encodeOptionalStringType(sf.asaCityCurrentbusinessaddressEntityAmlquestionnaire)
	result.asaCountryCurrentbusinessaddressEntityAmlquestionnaire = encodeOptionalStringType(sf.asaCountryCurrentbusinessaddressEntityAmlquestionnaire)
	result.asaStateCurrentbusinessaddressEntityAmlquestionnaire = encodeOptionalStringType(sf.asaStateCurrentbusinessaddressEntityAmlquestionnaire)
	result.asaZipCurrentbusinessaddressEntityAmlquestionnaire = encodeOptionalStringType(sf.asaZipCurrentbusinessaddressEntityAmlquestionnaire)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTablePlaceofbusinessEntityFields(json: {[string]: any}): SourceMasterTablePlaceofbusinessEntityFields
	return {
		asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire = decodeOptionalStringType(json.asaNumberandstreetCurrentbusinessaddressEntityAmlquestionnaire),
		asaCityCurrentbusinessaddressEntityAmlquestionnaire = decodeOptionalStringType(json.asaCityCurrentbusinessaddressEntityAmlquestionnaire),
		asaCountryCurrentbusinessaddressEntityAmlquestionnaire = decodeOptionalStringType(json.asaCountryCurrentbusinessaddressEntityAmlquestionnaire),
		asaStateCurrentbusinessaddressEntityAmlquestionnaire = decodeOptionalStringType(json.asaStateCurrentbusinessaddressEntityAmlquestionnaire),
		asaZipCurrentbusinessaddressEntityAmlquestionnaire = decodeOptionalStringType(json.asaZipCurrentbusinessaddressEntityAmlquestionnaire),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTablePlaceofbusinessEntityType(t: SourceMasterTablePlaceofbusinessEntityType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTablePlaceofbusinessEntityFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTablePlaceofbusinessEntityType(json: {[string]: any}): SourceMasterTablePlaceofbusinessEntityType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTablePlaceofbusinessEntityFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableResidentialaddressIndividualFields(sf: SourceMasterTableResidentialaddressIndividualFields): {[string]: any}
	local result: {[string]: any} = {}
	result.asaZipCurrentresidentialaddressIndividualAmlquestionnaire = encodeOptionalStringType(sf.asaZipCurrentresidentialaddressIndividualAmlquestionnaire)
	result.asaCityCurrentresidentialaddressIndividualAmlquestionnaire = encodeOptionalStringType(sf.asaCityCurrentresidentialaddressIndividualAmlquestionnaire)
	result.asaStateCurrentresidentialaddressIndividualAmlquestionnaire = encodeOptionalStringType(sf.asaStateCurrentresidentialaddressIndividualAmlquestionnaire)
	result.asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire = encodeOptionalStringType(sf.asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire)
	result.asaCountryCurrentresidentialaddressIndividualAmlquestionnaire = encodeOptionalStringType(sf.asaCountryCurrentresidentialaddressIndividualAmlquestionnaire)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableResidentialaddressIndividualFields(json: {[string]: any}): SourceMasterTableResidentialaddressIndividualFields
	return {
		asaZipCurrentresidentialaddressIndividualAmlquestionnaire = decodeOptionalStringType(json.asaZipCurrentresidentialaddressIndividualAmlquestionnaire),
		asaCityCurrentresidentialaddressIndividualAmlquestionnaire = decodeOptionalStringType(json.asaCityCurrentresidentialaddressIndividualAmlquestionnaire),
		asaStateCurrentresidentialaddressIndividualAmlquestionnaire = decodeOptionalStringType(json.asaStateCurrentresidentialaddressIndividualAmlquestionnaire),
		asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire = decodeOptionalStringType(json.asaNumberandstreetCurrentresidentialaddressIndividualAmlquestionnaire),
		asaCountryCurrentresidentialaddressIndividualAmlquestionnaire = decodeOptionalStringType(json.asaCountryCurrentresidentialaddressIndividualAmlquestionnaire),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableResidentialaddressIndividualType(t: SourceMasterTableResidentialaddressIndividualType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableResidentialaddressIndividualFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableResidentialaddressIndividualType(json: {[string]: any}): SourceMasterTableResidentialaddressIndividualType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableResidentialaddressIndividualFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableTaxowner2SignatoryFields(sf: SourceMasterTableTaxowner2SignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.nameTaxownerExhibitk = encodeOptionalStringType(sf.nameTaxownerExhibitk)
	result.dateTaxownerExhibitk = encodeOptionalStringType(sf.dateTaxownerExhibitk)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableTaxowner2SignatoryFields(json: {[string]: any}): SourceMasterTableTaxowner2SignatoryFields
	return {
		nameTaxownerExhibitk = decodeOptionalStringType(json.nameTaxownerExhibitk),
		dateTaxownerExhibitk = decodeOptionalStringType(json.dateTaxownerExhibitk),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableTaxowner2SignatoryType(t: SourceMasterTableTaxowner2SignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableTaxowner2SignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableTaxowner2SignatoryType(json: {[string]: any}): SourceMasterTableTaxowner2SignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableTaxowner2SignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableTaxownerSignatoryFields(sf: SourceMasterTableTaxownerSignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.nameTaxownerAnnex1 = encodeOptionalStringType(sf.nameTaxownerAnnex1)
	result.dateTaxownerAnnex1 = encodeOptionalStringType(sf.dateTaxownerAnnex1)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableTaxownerSignatoryFields(json: {[string]: any}): SourceMasterTableTaxownerSignatoryFields
	return {
		nameTaxownerAnnex1 = decodeOptionalStringType(json.nameTaxownerAnnex1),
		dateTaxownerAnnex1 = decodeOptionalStringType(json.dateTaxownerAnnex1),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableTaxownerSignatoryType(t: SourceMasterTableTaxownerSignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableTaxownerSignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableTaxownerSignatoryType(json: {[string]: any}): SourceMasterTableTaxownerSignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableTaxownerSignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableWireinstructionsFields(sf: SourceMasterTableWireinstructionsFields): {[string]: any}
	local result: {[string]: any} = {}
	result.asaBanklocationWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaBanklocationWireinstructionstoWireinfo)
	result.beneficiaryaddressWireinstructiontoWireinfo = encodeOptionalStringType(sf.beneficiaryaddressWireinstructiontoWireinfo)
	result.asaIntermediaryabaWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaIntermediaryabaWireinstructionstoWireinfo)
	result.asaIntermediaryswiftWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaIntermediaryswiftWireinstructionstoWireinfo)
	result.asaFurthercreditaccountWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaFurthercreditaccountWireinstructionstoWireinfo)
	result.asaIbanWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaIbanWireinstructionstoWireinfo)
	result.asaFurthercreditnameWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaFurthercreditnameWireinstructionstoWireinfo)
	result.asaAccountnameWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaAccountnameWireinstructionstoWireinfo)
	result.asaAbaWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaAbaWireinstructionstoWireinfo)
	result.asaSwiftWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaSwiftWireinstructionstoWireinfo)
	result.asaAccountnumberWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaAccountnumberWireinstructionstoWireinfo)
	result.asaBanknameWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaBanknameWireinstructionstoWireinfo)
	result.intermediarybankcountryWireinstructionstoWireinfo = encodeOptionalStringType(sf.intermediarybankcountryWireinstructionstoWireinfo)
	result.asaIntermediarybanknameWireinstructionstoWireinfo = encodeOptionalStringType(sf.asaIntermediarybanknameWireinstructionstoWireinfo)
	result.currencyWireinstructiontoWireinfo = encodeOptionalStringType(sf.currencyWireinstructiontoWireinfo)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableWireinstructionsFields(json: {[string]: any}): SourceMasterTableWireinstructionsFields
	return {
		asaBanklocationWireinstructionstoWireinfo = decodeOptionalStringType(json.asaBanklocationWireinstructionstoWireinfo),
		beneficiaryaddressWireinstructiontoWireinfo = decodeOptionalStringType(json.beneficiaryaddressWireinstructiontoWireinfo),
		asaIntermediaryabaWireinstructionstoWireinfo = decodeOptionalStringType(json.asaIntermediaryabaWireinstructionstoWireinfo),
		asaIntermediaryswiftWireinstructionstoWireinfo = decodeOptionalStringType(json.asaIntermediaryswiftWireinstructionstoWireinfo),
		asaFurthercreditaccountWireinstructionstoWireinfo = decodeOptionalStringType(json.asaFurthercreditaccountWireinstructionstoWireinfo),
		asaIbanWireinstructionstoWireinfo = decodeOptionalStringType(json.asaIbanWireinstructionstoWireinfo),
		asaFurthercreditnameWireinstructionstoWireinfo = decodeOptionalStringType(json.asaFurthercreditnameWireinstructionstoWireinfo),
		asaAccountnameWireinstructionstoWireinfo = decodeOptionalStringType(json.asaAccountnameWireinstructionstoWireinfo),
		asaAbaWireinstructionstoWireinfo = decodeOptionalStringType(json.asaAbaWireinstructionstoWireinfo),
		asaSwiftWireinstructionstoWireinfo = decodeOptionalStringType(json.asaSwiftWireinstructionstoWireinfo),
		asaAccountnumberWireinstructionstoWireinfo = decodeOptionalStringType(json.asaAccountnumberWireinstructionstoWireinfo),
		asaBanknameWireinstructionstoWireinfo = decodeOptionalStringType(json.asaBanknameWireinstructionstoWireinfo),
		intermediarybankcountryWireinstructionstoWireinfo = decodeOptionalStringType(json.intermediarybankcountryWireinstructionstoWireinfo),
		asaIntermediarybanknameWireinstructionstoWireinfo = decodeOptionalStringType(json.asaIntermediarybanknameWireinstructionstoWireinfo),
		currencyWireinstructiontoWireinfo = decodeOptionalStringType(json.currencyWireinstructiontoWireinfo),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableWireinstructionsType(t: SourceMasterTableWireinstructionsType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableWireinstructionsFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableWireinstructionsType(json: {[string]: any}): SourceMasterTableWireinstructionsType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableWireinstructionsFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableWitness2SignatoryFields(sf: SourceMasterTableWitness2SignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.nameWitnessExhibitk = encodeOptionalStringType(sf.nameWitnessExhibitk)
	result.dateWitnessExhibitk = encodeOptionalStringType(sf.dateWitnessExhibitk)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableWitness2SignatoryFields(json: {[string]: any}): SourceMasterTableWitness2SignatoryFields
	return {
		nameWitnessExhibitk = decodeOptionalStringType(json.nameWitnessExhibitk),
		dateWitnessExhibitk = decodeOptionalStringType(json.dateWitnessExhibitk),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableWitness2SignatoryType(t: SourceMasterTableWitness2SignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableWitness2SignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableWitness2SignatoryType(json: {[string]: any}): SourceMasterTableWitness2SignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableWitness2SignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableWitnessSignatoryFields(sf: SourceMasterTableWitnessSignatoryFields): {[string]: any}
	local result: {[string]: any} = {}
	result.witnessednameTaxownerAnnex1 = encodeOptionalStringType(sf.witnessednameTaxownerAnnex1)
	result.witnesseddateTaxownerAnnex1 = encodeOptionalStringType(sf.witnesseddateTaxownerAnnex1)
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableWitnessSignatoryFields(json: {[string]: any}): SourceMasterTableWitnessSignatoryFields
	return {
		witnessednameTaxownerAnnex1 = decodeOptionalStringType(json.witnessednameTaxownerAnnex1),
		witnesseddateTaxownerAnnex1 = decodeOptionalStringType(json.witnesseddateTaxownerAnnex1),
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableWitnessSignatoryType(t: SourceMasterTableWitnessSignatoryType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = SourceMasterTable.encodeJsonSourceMasterTableWitnessSignatoryFields(t.valueSubFields)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableWitnessSignatoryType(json: {[string]: any}): SourceMasterTableWitnessSignatoryType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then SourceMasterTable.decodeJsonSourceMasterTableWitnessSignatoryFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableFieldsMap(so: SourceMasterTableFieldsMap): {[string]: any}
	local result: {[string]: any} = {
	}
	result.asaFullnameInvestornameGeneralinfo = encodeOptionalStringType(so.asaFullnameInvestornameGeneralinfo)
	if so.lpSignatory ~= nil then
		result.lpSignatory = SourceMasterTable.encodeJsonSourceMasterTableLpSignatoryType(so.lpSignatory)
	end
	if so.mainGpSignatory ~= nil then
		result.mainGpSignatory = SourceMasterTable.encodeJsonSourceMasterTableMainGpSignatoryType(so.mainGpSignatory)
	end
	if so.luxGpSignatory ~= nil then
		result.luxGpSignatory = SourceMasterTable.encodeJsonSourceMasterTableLuxGpSignatoryType(so.luxGpSignatory)
	end
	result.dateGpsignaturepage = encodeOptionalStringType(so.dateGpsignaturepage)
	if so.taxownerSignatory ~= nil then
		result.taxownerSignatory = SourceMasterTable.encodeJsonSourceMasterTableTaxownerSignatoryType(so.taxownerSignatory)
	end
	if so.witnessSignatory ~= nil then
		result.witnessSignatory = SourceMasterTable.encodeJsonSourceMasterTableWitnessSignatoryType(so.witnessSignatory)
	end
	result.asaFullnameInvestornameAmlquestionnaire = encodeOptionalStringType(so.asaFullnameInvestornameAmlquestionnaire)
	result.jointaccountholdersnamesPart1Duediligencequestionnaire = encodeOptionalStringType(so.jointaccountholdersnamesPart1Duediligencequestionnaire)
	result.asaDateofbirthIndividualAmlquestionnaire = encodeOptionalStringType(so.asaDateofbirthIndividualAmlquestionnaire)
	result.asaPlaceofbirthIndividualAmlquestionnaire = encodeOptionalStringType(so.asaPlaceofbirthIndividualAmlquestionnaire)
	result.ssnorftiorppnoPart1Duediligencequestionnaire = encodeOptionalStringType(so.ssnorftiorppnoPart1Duediligencequestionnaire)
	result.asaNationalityIndividualAmlquestionnaire = encodeOptionalStringType(so.asaNationalityIndividualAmlquestionnaire)
	result.asaFulladdressCurrentresidentialaddressIndividualAmlquestionnaire = encodeOptionalStringType(so.asaFulladdressCurrentresidentialaddressIndividualAmlquestionnaire)
	if so.residentialaddressIndividual ~= nil then
		result.residentialaddressIndividual = SourceMasterTable.encodeJsonSourceMasterTableResidentialaddressIndividualType(so.residentialaddressIndividual)
	end
	result.indiInternationalsupplementsPart1Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.indiInternationalsupplementsPart1Duediligencequestionnaire)
	result.asaOccupationIndividualAmlquestionnaire = encodeOptionalStringType(so.asaOccupationIndividualAmlquestionnaire)
	result.professionalactivityAndTitleIndividualAmlquestionnaire = encodeOptionalStringType(so.professionalactivityAndTitleIndividualAmlquestionnaire)
	result.nameofemployerPart1Duediligencequestionnaire = encodeOptionalStringType(so.nameofemployerPart1Duediligencequestionnaire)
	result.addressofemployerPart1Duediligencequestionnaire = encodeOptionalStringType(so.addressofemployerPart1Duediligencequestionnaire)
	result.sourceofwealthPart1Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.sourceofwealthPart1Duediligencequestionnaire)
	result.nomineePart1Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.nomineePart1Duediligencequestionnaire)
	result.categoryNomineePart1Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.categoryNomineePart1Duediligencequestionnaire)
	result.specifyotherCategoryNomineePart1Duediligencequestionnaire = encodeOptionalStringType(so.specifyotherCategoryNomineePart1Duediligencequestionnaire)
	result.affiliatedPart1Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.affiliatedPart1Duediligencequestionnaire)
	result.nameAffiliatedPart1Duediligencequestionnaire = encodeOptionalStringType(so.nameAffiliatedPart1Duediligencequestionnaire)
	result.asaPoliticallyexposedpersonsAmlquestionnaire = encodeOptionalMultipleCheckboxType(so.asaPoliticallyexposedpersonsAmlquestionnaire)
	if so.clientquestionnairePart1Signatory ~= nil then
		result.clientquestionnairePart1Signatory = SourceMasterTable.encodeJsonSourceMasterTableClientquestionnairePart1SignatoryType(so.clientquestionnairePart1Signatory)
	end
	result.asaFullnameInvestornameGeneralinfo1 = encodeOptionalStringType(so.asaFullnameInvestornameGeneralinfo1)
	result.tradenamePart2Duediligencequestionnaire = encodeOptionalStringType(so.tradenamePart2Duediligencequestionnaire)
	result.jurisdictionoforganizationPart2Duediligencequestionnaire = encodeOptionalStringType(so.jurisdictionoforganizationPart2Duediligencequestionnaire)
	result.asaDateofestablishmentEntityAmlquestionnaire = encodeOptionalStringType(so.asaDateofestablishmentEntityAmlquestionnaire)
	result.purposeofbusinessEntityAmlquestionnaire = encodeOptionalStringType(so.purposeofbusinessEntityAmlquestionnaire)
	result.asaFulladdressCurrentbusinessaddressEntityAmlquestionnaire = encodeOptionalStringType(so.asaFulladdressCurrentbusinessaddressEntityAmlquestionnaire)
	if so.placeofbusinessEntity ~= nil then
		result.placeofbusinessEntity = SourceMasterTable.encodeJsonSourceMasterTablePlaceofbusinessEntityType(so.placeofbusinessEntity)
	end
	result.entityInternationalsupplementsPart1Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.entityInternationalsupplementsPart1Duediligencequestionnaire)
	result.websitePart2Duediligencequestionnaire = encodeOptionalStringType(so.websitePart2Duediligencequestionnaire)
	result.tinPart2Duediligencequestionnaire = encodeOptionalStringType(so.tinPart2Duediligencequestionnaire)
	result.sourceoffundsPart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.sourceoffundsPart2Duediligencequestionnaire)
	result.legalformofentityPart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.legalformofentityPart2Duediligencequestionnaire)
	result.specificotherLegalformofentityPart2Duediligencequestionnaire = encodeOptionalStringType(so.specificotherLegalformofentityPart2Duediligencequestionnaire)
	result.trustPart1Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.trustPart1Duediligencequestionnaire)
	result.asaFormpfFormpf = encodeOptionalMultipleCheckboxType(so.asaFormpfFormpf)
	result.asaSpecifyOtherFormpf = encodeOptionalStringType(so.asaSpecifyOtherFormpf)
	result.financialinstitutionRegulatedstatusPart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.financialinstitutionRegulatedstatusPart2Duediligencequestionnaire)
	result.indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire = encodeOptionalStringType(so.indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire)
	result.departmentRegulatedstatusPart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.departmentRegulatedstatusPart2Duediligencequestionnaire)
	result.entityRegulatedstatusPart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.entityRegulatedstatusPart2Duediligencequestionnaire)
	result.luxsentityRegulatedstatusPart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.luxsentityRegulatedstatusPart2Duediligencequestionnaire)
	result.indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire = encodeOptionalStringType(so.indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire)
	result.tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire = encodeOptionalStringType(so.tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire)
	result.goventityPart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.goventityPart2Duediligencequestionnaire)
	result.nomineePart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.nomineePart2Duediligencequestionnaire)
	result.categoryNomineePart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.categoryNomineePart2Duediligencequestionnaire)
	result.specificrepresentativeCategoryNomineePart2Duediligencequestionnaire = encodeOptionalStringType(so.specificrepresentativeCategoryNomineePart2Duediligencequestionnaire)
	result.affiliatedPart2Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.affiliatedPart2Duediligencequestionnaire)
	result.indicateAffiliatedPart2Duediligencequestionnaire = encodeOptionalStringType(so.indicateAffiliatedPart2Duediligencequestionnaire)
	result.nameControlpersonPart2Duediligencequestionnaire = encodeOptionalStringType(so.nameControlpersonPart2Duediligencequestionnaire)
	result.tittleControlpersonPart2Duediligencequestionnaire = encodeOptionalStringType(so.tittleControlpersonPart2Duediligencequestionnaire)
	result.dobControlpersonPart2Duediligencequestionnaire = encodeOptionalStringType(so.dobControlpersonPart2Duediligencequestionnaire)
	result.addressControlpersonPart2Duediligencequestionnaire = encodeOptionalStringType(so.addressControlpersonPart2Duediligencequestionnaire)
	result.idControlpersonPart2Duediligencequestionnaire = encodeOptionalStringType(so.idControlpersonPart2Duediligencequestionnaire)
	result.citizenshipControlpersonPart2Duediligencequestionnaire = encodeOptionalStringType(so.citizenshipControlpersonPart2Duediligencequestionnaire)
	result.pepControlpersonPart2Duediligencequestionnaire = encodeOptionalStringType(so.pepControlpersonPart2Duediligencequestionnaire)
	result.publiclytradedControlpersonPart2Duediligencequestionnaire = encodeOptionalStringType(so.publiclytradedControlpersonPart2Duediligencequestionnaire)
	result.regulatedentityControlpersonPart2Duediligencequestionnaire = encodeOptionalStringType(so.regulatedentityControlpersonPart2Duediligencequestionnaire)
	result.nameControlpersonPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.nameControlpersonPart2Duediligencequestionnaire0)
	result.tittleControlpersonPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.tittleControlpersonPart2Duediligencequestionnaire0)
	result.dobControlpersonPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.dobControlpersonPart2Duediligencequestionnaire0)
	result.addressControlpersonPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.addressControlpersonPart2Duediligencequestionnaire0)
	result.idControlpersonPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.idControlpersonPart2Duediligencequestionnaire0)
	result.citizenshipControlpersonPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.citizenshipControlpersonPart2Duediligencequestionnaire0)
	result.pepControlpersonPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.pepControlpersonPart2Duediligencequestionnaire0)
	result.publiclytradedControlpersonPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.publiclytradedControlpersonPart2Duediligencequestionnaire0)
	result.regulatedentityControlpersonPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.regulatedentityControlpersonPart2Duediligencequestionnaire0)
	result.nameControlpersonPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.nameControlpersonPart2Duediligencequestionnaire1)
	result.tittleControlpersonPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.tittleControlpersonPart2Duediligencequestionnaire1)
	result.dobControlpersonPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.dobControlpersonPart2Duediligencequestionnaire1)
	result.addressControlpersonPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.addressControlpersonPart2Duediligencequestionnaire1)
	result.idControlpersonPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.idControlpersonPart2Duediligencequestionnaire1)
	result.citizenshipControlpersonPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.citizenshipControlpersonPart2Duediligencequestionnaire1)
	result.pepControlpersonPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.pepControlpersonPart2Duediligencequestionnaire1)
	result.publiclytradedControlpersonPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.publiclytradedControlpersonPart2Duediligencequestionnaire1)
	result.regulatedentityControlpersonPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.regulatedentityControlpersonPart2Duediligencequestionnaire1)
	result.nameControlpersonPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.nameControlpersonPart2Duediligencequestionnaire2)
	result.tittleControlpersonPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.tittleControlpersonPart2Duediligencequestionnaire2)
	result.dobControlpersonPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.dobControlpersonPart2Duediligencequestionnaire2)
	result.addressControlpersonPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.addressControlpersonPart2Duediligencequestionnaire2)
	result.idControlpersonPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.idControlpersonPart2Duediligencequestionnaire2)
	result.citizenshipControlpersonPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.citizenshipControlpersonPart2Duediligencequestionnaire2)
	result.pepControlpersonPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.pepControlpersonPart2Duediligencequestionnaire2)
	result.publiclytradedControlpersonPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.publiclytradedControlpersonPart2Duediligencequestionnaire2)
	result.regulatedentityControlpersonPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.regulatedentityControlpersonPart2Duediligencequestionnaire2)
	result.nameControlpersonPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.nameControlpersonPart2Duediligencequestionnaire3)
	result.tittleControlpersonPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.tittleControlpersonPart2Duediligencequestionnaire3)
	result.dobControlpersonPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.dobControlpersonPart2Duediligencequestionnaire3)
	result.addressControlpersonPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.addressControlpersonPart2Duediligencequestionnaire3)
	result.idControlpersonPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.idControlpersonPart2Duediligencequestionnaire3)
	result.citizenshipControlpersonPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.citizenshipControlpersonPart2Duediligencequestionnaire3)
	result.pepControlpersonPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.pepControlpersonPart2Duediligencequestionnaire3)
	result.publiclytradedControlpersonPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.publiclytradedControlpersonPart2Duediligencequestionnaire3)
	result.regulatedentityControlpersonPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.regulatedentityControlpersonPart2Duediligencequestionnaire3)
	result.asaFullnameBeneficialownerAmlquestionnaire = encodeOptionalStringType(so.asaFullnameBeneficialownerAmlquestionnaire)
	result.tittleBeneficialownerAmlquestionnaire = encodeOptionalStringType(so.tittleBeneficialownerAmlquestionnaire)
	result.asaDateofbirthBeneficialownerAmlquestionnaire = encodeOptionalStringType(so.asaDateofbirthBeneficialownerAmlquestionnaire)
	result.asaResidentialaddressBeneficialownerAmlquestionnaire = encodeOptionalStringType(so.asaResidentialaddressBeneficialownerAmlquestionnaire)
	if so.addressUbo ~= nil then
		result.addressUbo = SourceMasterTable.encodeJsonSourceMasterTableAddressUboType(so.addressUbo)
	end
	result.idBeneficialownerPart2Duediligencequestionnaire = encodeOptionalStringType(so.idBeneficialownerPart2Duediligencequestionnaire)
	result.citizenshipBeneficialownerPart2Duediligencequestionnaire = encodeOptionalStringType(so.citizenshipBeneficialownerPart2Duediligencequestionnaire)
	result.pepBeneficialownerPart2Duediligencequestionnaire = encodeOptionalStringType(so.pepBeneficialownerPart2Duediligencequestionnaire)
	result.publiclytradedBeneficialownerPart2Duediligencequestionnaire = encodeOptionalStringType(so.publiclytradedBeneficialownerPart2Duediligencequestionnaire)
	result.regulatedentityBeneficialownerPart2Duediligencequestionnaire = encodeOptionalStringType(so.regulatedentityBeneficialownerPart2Duediligencequestionnaire)
	result.asaFullnameBeneficialownerAmlquestionnaire0 = encodeOptionalStringType(so.asaFullnameBeneficialownerAmlquestionnaire0)
	result.tittleBeneficialownerAmlquestionnaire0 = encodeOptionalStringType(so.tittleBeneficialownerAmlquestionnaire0)
	result.asaDateofbirthBeneficialownerAmlquestionnaire0 = encodeOptionalStringType(so.asaDateofbirthBeneficialownerAmlquestionnaire0)
	result.asaResidentialaddressBeneficialownerAmlquestionnaire0 = encodeOptionalStringType(so.asaResidentialaddressBeneficialownerAmlquestionnaire0)
	if so.addressUbo0 ~= nil then
		result.addressUbo0 = SourceMasterTable.encodeJsonSourceMasterTableAddressUbo0Type(so.addressUbo0)
	end
	result.idBeneficialownerPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.idBeneficialownerPart2Duediligencequestionnaire0)
	result.citizenshipBeneficialownerPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.citizenshipBeneficialownerPart2Duediligencequestionnaire0)
	result.pepBeneficialownerPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.pepBeneficialownerPart2Duediligencequestionnaire0)
	result.publiclytradedBeneficialownerPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.publiclytradedBeneficialownerPart2Duediligencequestionnaire0)
	result.regulatedentityBeneficialownerPart2Duediligencequestionnaire0 = encodeOptionalStringType(so.regulatedentityBeneficialownerPart2Duediligencequestionnaire0)
	result.asaFullnameBeneficialownerAmlquestionnaire1 = encodeOptionalStringType(so.asaFullnameBeneficialownerAmlquestionnaire1)
	result.tittleBeneficialownerAmlquestionnaire1 = encodeOptionalStringType(so.tittleBeneficialownerAmlquestionnaire1)
	result.asaDateofbirthBeneficialownerAmlquestionnaire1 = encodeOptionalStringType(so.asaDateofbirthBeneficialownerAmlquestionnaire1)
	result.asaResidentialaddressBeneficialownerAmlquestionnaire1 = encodeOptionalStringType(so.asaResidentialaddressBeneficialownerAmlquestionnaire1)
	if so.addressUbo1 ~= nil then
		result.addressUbo1 = SourceMasterTable.encodeJsonSourceMasterTableAddressUbo1Type(so.addressUbo1)
	end
	result.idBeneficialownerPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.idBeneficialownerPart2Duediligencequestionnaire1)
	result.citizenshipBeneficialownerPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.citizenshipBeneficialownerPart2Duediligencequestionnaire1)
	result.pepBeneficialownerPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.pepBeneficialownerPart2Duediligencequestionnaire1)
	result.publiclytradedBeneficialownerPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.publiclytradedBeneficialownerPart2Duediligencequestionnaire1)
	result.regulatedentityBeneficialownerPart2Duediligencequestionnaire1 = encodeOptionalStringType(so.regulatedentityBeneficialownerPart2Duediligencequestionnaire1)
	result.asaFullnameBeneficialownerAmlquestionnaire2 = encodeOptionalStringType(so.asaFullnameBeneficialownerAmlquestionnaire2)
	result.tittleBeneficialownerAmlquestionnaire2 = encodeOptionalStringType(so.tittleBeneficialownerAmlquestionnaire2)
	result.asaDateofbirthBeneficialownerAmlquestionnaire2 = encodeOptionalStringType(so.asaDateofbirthBeneficialownerAmlquestionnaire2)
	result.asaResidentialaddressBeneficialownerAmlquestionnaire2 = encodeOptionalStringType(so.asaResidentialaddressBeneficialownerAmlquestionnaire2)
	if so.addressUbo2 ~= nil then
		result.addressUbo2 = SourceMasterTable.encodeJsonSourceMasterTableAddressUbo2Type(so.addressUbo2)
	end
	result.idBeneficialownerPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.idBeneficialownerPart2Duediligencequestionnaire2)
	result.citizenshipBeneficialownerPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.citizenshipBeneficialownerPart2Duediligencequestionnaire2)
	result.pepBeneficialownerPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.pepBeneficialownerPart2Duediligencequestionnaire2)
	result.publiclytradedBeneficialownerPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.publiclytradedBeneficialownerPart2Duediligencequestionnaire2)
	result.regulatedentityBeneficialownerPart2Duediligencequestionnaire2 = encodeOptionalStringType(so.regulatedentityBeneficialownerPart2Duediligencequestionnaire2)
	result.asaFullnameBeneficialownerAmlquestionnaire3 = encodeOptionalStringType(so.asaFullnameBeneficialownerAmlquestionnaire3)
	result.tittleBeneficialownerAmlquestionnaire3 = encodeOptionalStringType(so.tittleBeneficialownerAmlquestionnaire3)
	result.asaDateofbirthBeneficialownerAmlquestionnaire3 = encodeOptionalStringType(so.asaDateofbirthBeneficialownerAmlquestionnaire3)
	result.asaResidentialaddressBeneficialownerAmlquestionnaire3 = encodeOptionalStringType(so.asaResidentialaddressBeneficialownerAmlquestionnaire3)
	if so.addressUbo3 ~= nil then
		result.addressUbo3 = SourceMasterTable.encodeJsonSourceMasterTableAddressUbo3Type(so.addressUbo3)
	end
	result.idBeneficialownerPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.idBeneficialownerPart2Duediligencequestionnaire3)
	result.citizenshipBeneficialownerPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.citizenshipBeneficialownerPart2Duediligencequestionnaire3)
	result.pepBeneficialownerPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.pepBeneficialownerPart2Duediligencequestionnaire3)
	result.publiclytradedBeneficialownerPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.publiclytradedBeneficialownerPart2Duediligencequestionnaire3)
	result.regulatedentityBeneficialownerPart2Duediligencequestionnaire3 = encodeOptionalStringType(so.regulatedentityBeneficialownerPart2Duediligencequestionnaire3)
	if so.clientquestionnairePart2Signatory ~= nil then
		result.clientquestionnairePart2Signatory = SourceMasterTable.encodeJsonSourceMasterTableClientquestionnairePart2SignatoryType(so.clientquestionnairePart2Signatory)
	end
	result.asaFullnameInvestornameGeneralinfo2 = encodeOptionalStringType(so.asaFullnameInvestornameGeneralinfo2)
	if so.wireInstructions ~= nil then
		result.wireInstructions = SourceMasterTable.encodeJsonSourceMasterTableWireinstructionsType(so.wireInstructions)
	end
	result.nameofsubscriberWireinstructiontoPart3Duediligencequestionnaire = encodeOptionalMultipleCheckboxType(so.nameofsubscriberWireinstructiontoPart3Duediligencequestionnaire)
	if so.brokerageFirm ~= nil then
		result.brokerageFirm = SourceMasterTable.encodeJsonSourceMasterTableBrokeragefirmType(so.brokerageFirm)
	end
	result.typeofownershipIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.typeofownershipIndividualsInvestorquestionnaire)
	result.asaAccreditedinvestorAccreditedinvestor = encodeOptionalMultipleCheckboxType(so.asaAccreditedinvestorAccreditedinvestor)
	result.qualifiedpurchaserIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.qualifiedpurchaserIndividualsInvestorquestionnaire)
	result.uspersonIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.uspersonIndividualsInvestorquestionnaire)
	result.qualifiedclientIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.qualifiedclientIndividualsInvestorquestionnaire)
	result.notinvest1100IndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.notinvest1100IndividualsInvestorquestionnaire)
	result.taxtreatmentTaxmatterIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.taxtreatmentTaxmatterIndividualsInvestorquestionnaire)
	result.explainotherTaxtreatmentTaxmatterIndividualsInvestorquestionnaire = encodeOptionalStringType(so.explainotherTaxtreatmentTaxmatterIndividualsInvestorquestionnaire)
	result.ustinorssnTaxmatterIndividualsInvestorquestionnaire = encodeOptionalStringType(so.ustinorssnTaxmatterIndividualsInvestorquestionnaire)
	result.ustinorssnTaxmatterIndividualsInvestorquestionnaire0 = encodeOptionalStringType(so.ustinorssnTaxmatterIndividualsInvestorquestionnaire0)
	result.uktaxrefTaxmatterIndividualsInvestorquestionnaire = encodeOptionalStringType(so.uktaxrefTaxmatterIndividualsInvestorquestionnaire)
	result.uktaxrefTaxmatterIndividualsInvestorquestionnaire0 = encodeOptionalStringType(so.uktaxrefTaxmatterIndividualsInvestorquestionnaire0)
	result.nonustinTaxmatterIndividualsInvestorquestionnaire = encodeOptionalStringType(so.nonustinTaxmatterIndividualsInvestorquestionnaire)
	result.nonustinTaxmatterIndividualsInvestorquestionnaire0 = encodeOptionalStringType(so.nonustinTaxmatterIndividualsInvestorquestionnaire0)
	result.countrynonustinTaxmatterIndividualsInvestorquestionnaire = encodeOptionalStringType(so.countrynonustinTaxmatterIndividualsInvestorquestionnaire)
	result.countrynonustinTaxmatterIndividualsInvestorquestionnaire0 = encodeOptionalStringType(so.countrynonustinTaxmatterIndividualsInvestorquestionnaire0)
	result.disregardedentityTaxmatterIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.disregardedentityTaxmatterIndividualsInvestorquestionnaire)
	result.nameTaxownerTaxmatterIndividualsInvestorquestionnaire = encodeOptionalStringType(so.nameTaxownerTaxmatterIndividualsInvestorquestionnaire)
	result.countryTaxownerTaxmatterIndividualsInvestorquestionnaire = encodeOptionalStringType(so.countryTaxownerTaxmatterIndividualsInvestorquestionnaire)
	result.taxidTaxownerTaxmatterIndividualsInvestorquestionnaire = encodeOptionalStringType(so.taxidTaxownerTaxmatterIndividualsInvestorquestionnaire)
	result.staeTaxownerTaxmatterIndividualsInvestorquestionnaire = encodeOptionalStringType(so.staeTaxownerTaxmatterIndividualsInvestorquestionnaire)
	result.noncooperativejurisdictionsIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.noncooperativejurisdictionsIndividualsInvestorquestionnaire)
	result.electingfeepartnerIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.electingfeepartnerIndividualsInvestorquestionnaire)
	result.skipFinraIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.skipFinraIndividualsInvestorquestionnaire)
	result.finraIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.finraIndividualsInvestorquestionnaire)
	result.brokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.brokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup)
	result.immediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.immediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup)
	result.nameemployedImmediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaire = encodeOptionalStringType(so.nameemployedImmediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaire)
	result.personsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.personsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup)
	result.immediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.immediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup)
	result.specifynameImmediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaire = encodeOptionalStringType(so.specifynameImmediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaire)
	result.publiccompanyFinraIndividualsInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.publiccompanyFinraIndividualsInvestorquestionnaireGroup)
	result.asaConvictedlast10yearsBadactor = encodeOptionalMultipleCheckboxType(so.asaConvictedlast10yearsBadactor)
	result.asaSubjecttojudgementlast5yearsBadactor = encodeOptionalMultipleCheckboxType(so.asaSubjecttojudgementlast5yearsBadactor)
	result.asaSubjecttofinalorderBadactor = encodeOptionalMultipleCheckboxType(so.asaSubjecttofinalorderBadactor)
	result.asaSubjecttosecorder15bor15cBadactor = encodeOptionalMultipleCheckboxType(so.asaSubjecttosecorder15bor15cBadactor)
	result.asaSubjecttosecorderpast5yearsBadactor = encodeOptionalMultipleCheckboxType(so.asaSubjecttosecorderpast5yearsBadactor)
	result.asaSuspendedmembershipBadactor = encodeOptionalMultipleCheckboxType(so.asaSuspendedmembershipBadactor)
	result.asaUnderwriterBadactor = encodeOptionalMultipleCheckboxType(so.asaUnderwriterBadactor)
	result.asaUspsfalserepresentationBadactor = encodeOptionalMultipleCheckboxType(so.asaUspsfalserepresentationBadactor)
	result.notsubjectS506dregulationdIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.notsubjectS506dregulationdIndividualsInvestorquestionnaire)
	result.subscriberacknowledgesIndividualsInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.subscriberacknowledgesIndividualsInvestorquestionnaire)
	result.asaAccreditedinvestorAccreditedinvestor1 = encodeOptionalMultipleCheckboxType(so.asaAccreditedinvestorAccreditedinvestor1)
	result.nameofplanfiduciaryAccreditedinvestorEntityInvestorquestionnaire = encodeOptionalStringType(so.nameofplanfiduciaryAccreditedinvestorEntityInvestorquestionnaire)
	result.voluntaryEmployeebenefitplanEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.voluntaryEmployeebenefitplanEntityInvestorquestionnaire)
	result.registerrequiredEmployeebenefitplanEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.registerrequiredEmployeebenefitplanEntityInvestorquestionnaire)
	result.permitEmployeebenefitplanEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.permitEmployeebenefitplanEntityInvestorquestionnaire)
	result.asaQualifiedpurchaserQualifiedpurchaser = encodeOptionalMultipleCheckboxType(so.asaQualifiedpurchaserQualifiedpurchaser)
	result.purposeEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.purposeEntityInvestorquestionnaire)
	result.lessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.lessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire)
	result.howmanylessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire = encodeOptionalStringType(so.howmanylessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire)
	result.morethan10countasNumberofbeneficialownersEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.morethan10countasNumberofbeneficialownersEntityInvestorquestionnaire)
	result.howmanymorethan10countasNumberofbeneficialownersEntityInvestorquestionnaire = encodeOptionalStringType(so.howmanymorethan10countasNumberofbeneficialownersEntityInvestorquestionnaire)
	result.asaJurisdictionoftaxresidencyGeneralinfo = encodeOptionalStringType(so.asaJurisdictionoftaxresidencyGeneralinfo)
	result.jurisdictionyearendTaxmatterEntityInvestorquestionnaire = encodeOptionalStringType(so.jurisdictionyearendTaxmatterEntityInvestorquestionnaire)
	result.usyearendTaxmatterEntityInvestorquestionnaire = encodeOptionalStringType(so.usyearendTaxmatterEntityInvestorquestionnaire)
	result.taxstatusTaxmatterEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.taxstatusTaxmatterEntityInvestorquestionnaire)
	result.exemptTaxmatterEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.exemptTaxmatterEntityInvestorquestionnaire)
	result.treatmentTaxmatterEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.treatmentTaxmatterEntityInvestorquestionnaire)
	result.explainotherTreatmentTaxmatterEntityInvestorquestionnaire = encodeOptionalStringType(so.explainotherTreatmentTaxmatterEntityInvestorquestionnaire)
	result.indicatedisregardedTreatmentTaxmatterEntityInvestorquestionnaire = encodeOptionalStringType(so.indicatedisregardedTreatmentTaxmatterEntityInvestorquestionnaire)
	result.morethan50percentPartnershipsTaxmatterEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.morethan50percentPartnershipsTaxmatterEntityInvestorquestionnaire)
	result.satisfy100partnerlimitationPartnershipsTaxmatterEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.satisfy100partnerlimitationPartnershipsTaxmatterEntityInvestorquestionnaire)
	result.percentTaxmatterEntityInvestorquestionnaire = encodeOptionalStringType(so.percentTaxmatterEntityInvestorquestionnaire)
	result.foreignsovereignTaxmatterEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.foreignsovereignTaxmatterEntityInvestorquestionnaire)
	result.caipartnerTaxmatterEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.caipartnerTaxmatterEntityInvestorquestionnaire)
	result.s511TaxexemptEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.s511TaxexemptEntityInvestorquestionnaire)
	result.onwerexemptS511TaxexemptEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.onwerexemptS511TaxexemptEntityInvestorquestionnaire)
	result.partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire)
	result.taxexemptlpTaxexemptEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.taxexemptlpTaxexemptEntityInvestorquestionnaire)
	result.blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire)
	result.entitledTaxexemptEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.entitledTaxexemptEntityInvestorquestionnaire)
	result.subtypeEntitledTaxexemptEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.subtypeEntitledTaxexemptEntityInvestorquestionnaire)
	result.usgovernmentpersonEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.usgovernmentpersonEntityInvestorquestionnaire)
	result.nonusNonustaxstatusEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.nonusNonustaxstatusEntityInvestorquestionnaire)
	result.partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire)
	result.nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire)
	result.electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire)
	result.electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire)
	result.usgovernmentalTaxcreditEntityInvestorquestionnaire = encodeOptionalStringType(so.usgovernmentalTaxcreditEntityInvestorquestionnaire)
	result.taxexemptTaxcreditEntityInvestorquestionnaire = encodeOptionalStringType(so.taxexemptTaxcreditEntityInvestorquestionnaire)
	result.taxableusTaxcreditEntityInvestorquestionnaire = encodeOptionalStringType(so.taxableusTaxcreditEntityInvestorquestionnaire)
	result.nonusTaxcreditEntityInvestorquestionnaire = encodeOptionalStringType(so.nonusTaxcreditEntityInvestorquestionnaire)
	result.prohibitforeignentityEntityInvestorquestionnaire = encodeOptionalStringType(so.prohibitforeignentityEntityInvestorquestionnaire)
	result.noncooperativejurisdictionsEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.noncooperativejurisdictionsEntityInvestorquestionnaire)
	result.fiscallytransparentS894benefitsEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.fiscallytransparentS894benefitsEntityInvestorquestionnaire)
	result.caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire)
	result.withholdingqualifiedholderEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.withholdingqualifiedholderEntityInvestorquestionnaire)
	result.planassetsErisaEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.planassetsErisaEntityInvestorquestionnaire)
	result.asaErisaErisa = encodeOptionalMultipleCheckboxType(so.asaErisaErisa)
	result.percentofassetErisaEntityInvestorquestionnaire = encodeOptionalStringType(so.percentofassetErisaEntityInvestorquestionnaire)
	result.otherentityErisaEntityInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.otherentityErisaEntityInvestorquestionnaireGroup)
	result.lessthan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire = encodeOptionalStringType(so.lessthan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire)
	result.morethan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire = encodeOptionalStringType(so.morethan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire)
	result.controllinginfluenceCheckyesornoEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.controllinginfluenceCheckyesornoEntityInvestorquestionnaire)
	result.publicaccesslawmattersEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.publicaccesslawmattersEntityInvestorquestionnaire)
	result.seperatelegalpersonalityAdditionalquestionsEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.seperatelegalpersonalityAdditionalquestionsEntityInvestorquestionnaire)
	result.interestsAdditionalquestionsEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.interestsAdditionalquestionsEntityInvestorquestionnaire)
	result.avoidregistrationAdditionalquestionsEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.avoidregistrationAdditionalquestionsEntityInvestorquestionnaire)
	result.consentAdditionalquestionsEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.consentAdditionalquestionsEntityInvestorquestionnaire)
	result.restrictedpersonorcoveredpersonNewissuesEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.restrictedpersonorcoveredpersonNewissuesEntityInvestorquestionnaire)
	result.generalexemptionsNewissuesEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.generalexemptionsNewissuesEntityInvestorquestionnaire)
	result.allocateprofitsorlossesOtherentityGeneralexemptionsNewissuesEntityInvestorquestionnaire = encodeOptionalStringType(so.allocateprofitsorlossesOtherentityGeneralexemptionsNewissuesEntityInvestorquestionnaire)
	result.restrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.restrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire)
	result.brokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.brokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup)
	result.immediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.immediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup)
	result.nameemployedImmediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire = encodeOptionalStringType(so.nameemployedImmediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire)
	result.personowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.personowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup)
	result.immediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.immediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup)
	result.brokerdealernameImmediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire = encodeOptionalStringType(so.brokerdealernameImmediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire)
	result.publiccompanyRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = encodeOptionalMultipleCheckboxType(so.publiccompanyRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup)
	result.electingfeepartnerEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.electingfeepartnerEntityInvestorquestionnaire)
	result.commit1100EntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.commit1100EntityInvestorquestionnaire)
	result.qualifiedclientEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.qualifiedclientEntityInvestorquestionnaire)
	result.asaBhcSpecialentities = encodeOptionalMultipleCheckboxType(so.asaBhcSpecialentities)
	result.governmentalplanBhc = encodeOptionalMultipleCheckboxType(so.governmentalplanBhc)
	result.asaConvictedlast10yearsBadactor1 = encodeOptionalMultipleCheckboxType(so.asaConvictedlast10yearsBadactor1)
	result.asaSubjecttojudgementlast5yearsBadactor1 = encodeOptionalMultipleCheckboxType(so.asaSubjecttojudgementlast5yearsBadactor1)
	result.asaSubjecttofinalorderBadactor1 = encodeOptionalMultipleCheckboxType(so.asaSubjecttofinalorderBadactor1)
	result.asaSubjecttosecorder15bor15cBadactor1 = encodeOptionalMultipleCheckboxType(so.asaSubjecttosecorder15bor15cBadactor1)
	result.asaSubjecttosecorderpast5yearsBadactor1 = encodeOptionalMultipleCheckboxType(so.asaSubjecttosecorderpast5yearsBadactor1)
	result.asaSuspendedmembershipBadactor1 = encodeOptionalMultipleCheckboxType(so.asaSuspendedmembershipBadactor1)
	result.asaUnderwriterBadactor1 = encodeOptionalMultipleCheckboxType(so.asaUnderwriterBadactor1)
	result.asaUspsfalserepresentationBadactor1 = encodeOptionalMultipleCheckboxType(so.asaUspsfalserepresentationBadactor1)
	result.notsubject506dofregulationdEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.notsubject506dofregulationdEntityInvestorquestionnaire)
	result.beenrefferedThirdpartyreferralsEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.beenrefferedThirdpartyreferralsEntityInvestorquestionnaire)
	result.nameBeenrefferedThirdpartyreferralsEntityInvestorquestionnaire = encodeOptionalStringType(so.nameBeenrefferedThirdpartyreferralsEntityInvestorquestionnaire)
	result.signeddisclosurestatementThirdpartyreferralsEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.signeddisclosurestatementThirdpartyreferralsEntityInvestorquestionnaire)
	result.subscriberacknowledgesEntityInvestorquestionnaire = encodeOptionalMultipleCheckboxType(so.subscriberacknowledgesEntityInvestorquestionnaire)
	result.subscribernameConsentstatement = encodeOptionalStringType(so.subscribernameConsentstatement)
	result.nameAuthorizedsignatoryConsentstatement = encodeOptionalStringType(so.nameAuthorizedsignatoryConsentstatement)
	result.titleAuthorizedsignatoryConsentstatement = encodeOptionalStringType(so.titleAuthorizedsignatoryConsentstatement)
	result.nameAuthorizedsignatory2Consentstatement = encodeOptionalStringType(so.nameAuthorizedsignatory2Consentstatement)
	result.titleAuthorizedsignatory2Consentstatement = encodeOptionalStringType(so.titleAuthorizedsignatory2Consentstatement)
	result.dateAuthorizedsignatoryConsentstatement = encodeOptionalStringType(so.dateAuthorizedsignatoryConsentstatement)
	result.dateAuthorizedsignatory2Consentstatement = encodeOptionalStringType(so.dateAuthorizedsignatory2Consentstatement)
	result.transparentordisregardedSection1Exhibite = encodeOptionalMultipleCheckboxType(so.transparentordisregardedSection1Exhibite)
	result.taxableSection1Exhibite = encodeOptionalMultipleCheckboxType(so.taxableSection1Exhibite)
	result.section2Exhibite = encodeOptionalMultipleCheckboxType(so.section2Exhibite)
	result.domiciledoregisteredineeaEeaiqs = encodeOptionalMultipleCheckboxType(so.domiciledoregisteredineeaEeaiqs)
	result.specifyDomiciledoregisteredineeaEeaiqs = encodeOptionalStringType(so.specifyDomiciledoregisteredineeaEeaiqs)
	result.onbehalfEeaiqs = encodeOptionalMultipleCheckboxType(so.onbehalfEeaiqs)
	result.nameOnbehalfEeaiqs = encodeOptionalStringType(so.nameOnbehalfEeaiqs)
	result.positionOnbehalfEeaiqs = encodeOptionalStringType(so.positionOnbehalfEeaiqs)
	result.corporateOnbehalfEeaiqs = encodeOptionalStringType(so.corporateOnbehalfEeaiqs)
	result.stateOnbehalfEeaiqs = encodeOptionalStringType(so.stateOnbehalfEeaiqs)
	result.representEearepandrequest = encodeOptionalMultipleCheckboxType(so.representEearepandrequest)
	result.groupRepresentEearepandrequest = encodeOptionalMultipleCheckboxType(so.groupRepresentEearepandrequest)
	result.natureAntherinstitutionalinvestorRepresentEearepandrequest = encodeOptionalStringType(so.natureAntherinstitutionalinvestorRepresentEearepandrequest)
	result.groupLargeundertakingRepresentEearepandrequest = encodeOptionalMultipleCheckboxType(so.groupLargeundertakingRepresentEearepandrequest)
	result.electiveprofessionalcriteriaEearepandrequest = encodeOptionalMultipleCheckboxType(so.electiveprofessionalcriteriaEearepandrequest)
	result.proinvestorstatusUkrepandrequest = encodeOptionalMultipleCheckboxType(so.proinvestorstatusUkrepandrequest)
	result.groupProinvestorstatusUkrepandrequest = encodeOptionalMultipleCheckboxType(so.groupProinvestorstatusUkrepandrequest)
	result.natureAntherinstitutionalinvestorProinvestorstatusUkrepandrequest = encodeOptionalStringType(so.natureAntherinstitutionalinvestorProinvestorstatusUkrepandrequest)
	result.groupLargeundertakingProinvestorstatusUkrepandrequest = encodeOptionalMultipleCheckboxType(so.groupLargeundertakingProinvestorstatusUkrepandrequest)
	result.electiveprofessionalcriteriaUkrepandrequest = encodeOptionalMultipleCheckboxType(so.electiveprofessionalcriteriaUkrepandrequest)
	result.representUkiqs = encodeOptionalMultipleCheckboxType(so.representUkiqs)
	result.groupInvestmentproRepresentUkiqs = encodeOptionalMultipleCheckboxType(so.groupInvestmentproRepresentUkiqs)
	result.groupPersonInvestmentproRepresentUkiqs = encodeOptionalMultipleCheckboxType(so.groupPersonInvestmentproRepresentUkiqs)
	result.groupHighnetworthRepresentUkiqs = encodeOptionalMultipleCheckboxType(so.groupHighnetworthRepresentUkiqs)
	result.groupCorporateHighnetworthRepresentUkiqs = encodeOptionalMultipleCheckboxType(so.groupCorporateHighnetworthRepresentUkiqs)
	result.regularqualifiedinvestorsSwissinvestorAppendixb = encodeOptionalMultipleCheckboxType(so.regularqualifiedinvestorsSwissinvestorAppendixb)
	result.typesLargeundertakingRegularqualifiedinvestorsScheduleh = encodeOptionalMultipleCheckboxType(so.typesLargeundertakingRegularqualifiedinvestorsScheduleh)
	result.electedqualifiedinvestorsSchedulehAppendixb = encodeOptionalMultipleCheckboxType(so.electedqualifiedinvestorsSchedulehAppendixb)
	result.swissexemptSchedulehAppendixb = encodeOptionalMultipleCheckboxType(so.swissexemptSchedulehAppendixb)
	result.provinceresidentCanadianiqs = encodeOptionalStringType(so.provinceresidentCanadianiqs)
	result.isaccreditedinvestorCanadianiqs = encodeOptionalMultipleCheckboxType(so.isaccreditedinvestorCanadianiqs)
	result.ispermittedclientCanadianiqs = encodeOptionalMultipleCheckboxType(so.ispermittedclientCanadianiqs)
	result.accredittedinvestorCanadiansupplement = encodeOptionalMultipleCheckboxType(so.accredittedinvestorCanadiansupplement)
	result.permittedclientrepresentationCanadiansupplement = encodeOptionalMultipleCheckboxType(so.permittedclientrepresentationCanadiansupplement)
	if so.canadianSignatory ~= nil then
		result.canadianSignatory = SourceMasterTable.encodeJsonSourceMasterTableCanadianSignatoryType(so.canadianSignatory)
	end
	result.qualifiedinstitutionalinvestorstatusJapanregulations = encodeOptionalMultipleCheckboxType(so.qualifiedinstitutionalinvestorstatusJapanregulations)
	result.nonqualifiedinstitutionalinvestorstatusJapanregulations = encodeOptionalMultipleCheckboxType(so.nonqualifiedinstitutionalinvestorstatusJapanregulations)
	result.collectiveinvestmentschemeorspecialpurposecoJapanregulations = encodeOptionalMultipleCheckboxType(so.collectiveinvestmentschemeorspecialpurposecoJapanregulations)
	result.typeYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations = encodeOptionalStringType(so.typeYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations)
	result.numberofqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations = encodeOptionalStringType(so.numberofqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations)
	result.numberofnonqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations = encodeOptionalStringType(so.numberofnonqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations)
	result.professionalinvestorstatusJapanregulations = encodeOptionalMultipleCheckboxType(so.professionalinvestorstatusJapanregulations)
	result.treatasgeneralinvestorYesProfessionalinvestorstatusJapanregulations = encodeOptionalMultipleCheckboxType(so.treatasgeneralinvestorYesProfessionalinvestorstatusJapanregulations)
	result.totalassetsStatusofassetsProfessionalinvestorstatusJapanregulations = encodeOptionalStringType(so.totalassetsStatusofassetsProfessionalinvestorstatusJapanregulations)
	result.netassetsStatusofassetsProfessionalinvestorstatusJapanregulations = encodeOptionalStringType(so.netassetsStatusofassetsProfessionalinvestorstatusJapanregulations)
	result.financialassetsStatusofassetsProfessionalinvestorstatusJapanregulations = encodeOptionalStringType(so.financialassetsStatusofassetsProfessionalinvestorstatusJapanregulations)
	result.forcollectiveinvestmentschemeInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations = encodeOptionalStringType(so.forcollectiveinvestmentschemeInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations)
	result.forothersecuritiesInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations = encodeOptionalStringType(so.forothersecuritiesInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations)
	result.purposeoftransactionAmlJapanregulations = encodeOptionalMultipleCheckboxType(so.purposeoftransactionAmlJapanregulations)
	result.specifyOtherPurposeoftransactionAmlJapanregulations = encodeOptionalStringType(so.specifyOtherPurposeoftransactionAmlJapanregulations)
	result.businessofinvestorAmlJapanregulations = encodeOptionalMultipleCheckboxType(so.businessofinvestorAmlJapanregulations)
	result.specifyOtherBusinessofinvestorAmlJapanregulations = encodeOptionalStringType(so.specifyOtherBusinessofinvestorAmlJapanregulations)
	result.occupationofinvestorAmlJapanregulations = encodeOptionalMultipleCheckboxType(so.occupationofinvestorAmlJapanregulations)
	result.specifyOtherOccupationofinvestorAmlJapanregulations = encodeOptionalStringType(so.specifyOtherOccupationofinvestorAmlJapanregulations)
	result.taxcreditWarranties = encodeOptionalMultipleCheckboxType(so.taxcreditWarranties)
	result.subscribernameTaxcreditWarranties = encodeOptionalStringType(so.subscribernameTaxcreditWarranties)
	if so.taxowner2Signatory ~= nil then
		result.taxowner2Signatory = SourceMasterTable.encodeJsonSourceMasterTableTaxowner2SignatoryType(so.taxowner2Signatory)
	end
	if so.witness2Signatory ~= nil then
		result.witness2Signatory = SourceMasterTable.encodeJsonSourceMasterTableWitness2SignatoryType(so.witness2Signatory)
	end
	result.qualifiedbusinessSupplementalforeign = encodeOptionalMultipleCheckboxType(so.qualifiedbusinessSupplementalforeign)
	result.morethan50percstockSupplementalforeign = encodeOptionalMultipleCheckboxType(so.morethan50percstockSupplementalforeign)
	result.section9901Supplementalforeign = encodeOptionalMultipleCheckboxType(so.section9901Supplementalforeign)
	result.chinesemilitarySupplementalforeign = encodeOptionalMultipleCheckboxType(so.chinesemilitarySupplementalforeign)
	result.entitylistrequiredSupplementalforeign = encodeOptionalMultipleCheckboxType(so.entitylistrequiredSupplementalforeign)
	result.section154bSupplementalforeign = encodeOptionalMultipleCheckboxType(so.section154bSupplementalforeign)
	result.dateAddtionalrepresentations = encodeOptionalStringType(so.dateAddtionalrepresentations)
	result.letterSubscribernameAddtionalrepresentations = encodeOptionalStringType(so.letterSubscribernameAddtionalrepresentations)
	result.naturalpersonAddtionalrepresentations = encodeOptionalStringType(so.naturalpersonAddtionalrepresentations)
	result.entityAddtionalrepresentations = encodeOptionalStringType(so.entityAddtionalrepresentations)
	if so.additionalrepresentationsSignatory ~= nil then
		result.additionalrepresentationsSignatory = SourceMasterTable.encodeJsonSourceMasterTableAdditionalrepresentationsSignatoryType(so.additionalrepresentationsSignatory)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableFieldsMap(json: {[string]: any}): SourceMasterTableFieldsMap
	return {
		asaFullnameInvestornameGeneralinfo = decodeOptionalStringType(json.asaFullnameInvestornameGeneralinfo),
		lpSignatory = if json.lpSignatory then SourceMasterTable.decodeJsonSourceMasterTableLpSignatoryType(json.lpSignatory) else nil,
		mainGpSignatory = if json.mainGpSignatory then SourceMasterTable.decodeJsonSourceMasterTableMainGpSignatoryType(json.mainGpSignatory) else nil,
		luxGpSignatory = if json.luxGpSignatory then SourceMasterTable.decodeJsonSourceMasterTableLuxGpSignatoryType(json.luxGpSignatory) else nil,
		dateGpsignaturepage = decodeOptionalStringType(json.dateGpsignaturepage),
		taxownerSignatory = if json.taxownerSignatory then SourceMasterTable.decodeJsonSourceMasterTableTaxownerSignatoryType(json.taxownerSignatory) else nil,
		witnessSignatory = if json.witnessSignatory then SourceMasterTable.decodeJsonSourceMasterTableWitnessSignatoryType(json.witnessSignatory) else nil,
		asaFullnameInvestornameAmlquestionnaire = decodeOptionalStringType(json.asaFullnameInvestornameAmlquestionnaire),
		jointaccountholdersnamesPart1Duediligencequestionnaire = decodeOptionalStringType(json.jointaccountholdersnamesPart1Duediligencequestionnaire),
		asaDateofbirthIndividualAmlquestionnaire = decodeOptionalStringType(json.asaDateofbirthIndividualAmlquestionnaire),
		asaPlaceofbirthIndividualAmlquestionnaire = decodeOptionalStringType(json.asaPlaceofbirthIndividualAmlquestionnaire),
		ssnorftiorppnoPart1Duediligencequestionnaire = decodeOptionalStringType(json.ssnorftiorppnoPart1Duediligencequestionnaire),
		asaNationalityIndividualAmlquestionnaire = decodeOptionalStringType(json.asaNationalityIndividualAmlquestionnaire),
		asaFulladdressCurrentresidentialaddressIndividualAmlquestionnaire = decodeOptionalStringType(json.asaFulladdressCurrentresidentialaddressIndividualAmlquestionnaire),
		residentialaddressIndividual = if json.residentialaddressIndividual then SourceMasterTable.decodeJsonSourceMasterTableResidentialaddressIndividualType(json.residentialaddressIndividual) else nil,
		indiInternationalsupplementsPart1Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.indiInternationalsupplementsPart1Duediligencequestionnaire),
		asaOccupationIndividualAmlquestionnaire = decodeOptionalStringType(json.asaOccupationIndividualAmlquestionnaire),
		professionalactivityAndTitleIndividualAmlquestionnaire = decodeOptionalStringType(json.professionalactivityAndTitleIndividualAmlquestionnaire),
		nameofemployerPart1Duediligencequestionnaire = decodeOptionalStringType(json.nameofemployerPart1Duediligencequestionnaire),
		addressofemployerPart1Duediligencequestionnaire = decodeOptionalStringType(json.addressofemployerPart1Duediligencequestionnaire),
		sourceofwealthPart1Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.sourceofwealthPart1Duediligencequestionnaire),
		nomineePart1Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.nomineePart1Duediligencequestionnaire),
		categoryNomineePart1Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.categoryNomineePart1Duediligencequestionnaire),
		specifyotherCategoryNomineePart1Duediligencequestionnaire = decodeOptionalStringType(json.specifyotherCategoryNomineePart1Duediligencequestionnaire),
		affiliatedPart1Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.affiliatedPart1Duediligencequestionnaire),
		nameAffiliatedPart1Duediligencequestionnaire = decodeOptionalStringType(json.nameAffiliatedPart1Duediligencequestionnaire),
		asaPoliticallyexposedpersonsAmlquestionnaire = decodeOptionalMultipleCheckboxType(json.asaPoliticallyexposedpersonsAmlquestionnaire),
		clientquestionnairePart1Signatory = if json.clientquestionnairePart1Signatory then SourceMasterTable.decodeJsonSourceMasterTableClientquestionnairePart1SignatoryType(json.clientquestionnairePart1Signatory) else nil,
		asaFullnameInvestornameGeneralinfo1 = decodeOptionalStringType(json.asaFullnameInvestornameGeneralinfo1),
		tradenamePart2Duediligencequestionnaire = decodeOptionalStringType(json.tradenamePart2Duediligencequestionnaire),
		jurisdictionoforganizationPart2Duediligencequestionnaire = decodeOptionalStringType(json.jurisdictionoforganizationPart2Duediligencequestionnaire),
		asaDateofestablishmentEntityAmlquestionnaire = decodeOptionalStringType(json.asaDateofestablishmentEntityAmlquestionnaire),
		purposeofbusinessEntityAmlquestionnaire = decodeOptionalStringType(json.purposeofbusinessEntityAmlquestionnaire),
		asaFulladdressCurrentbusinessaddressEntityAmlquestionnaire = decodeOptionalStringType(json.asaFulladdressCurrentbusinessaddressEntityAmlquestionnaire),
		placeofbusinessEntity = if json.placeofbusinessEntity then SourceMasterTable.decodeJsonSourceMasterTablePlaceofbusinessEntityType(json.placeofbusinessEntity) else nil,
		entityInternationalsupplementsPart1Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.entityInternationalsupplementsPart1Duediligencequestionnaire),
		websitePart2Duediligencequestionnaire = decodeOptionalStringType(json.websitePart2Duediligencequestionnaire),
		tinPart2Duediligencequestionnaire = decodeOptionalStringType(json.tinPart2Duediligencequestionnaire),
		sourceoffundsPart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.sourceoffundsPart2Duediligencequestionnaire),
		legalformofentityPart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.legalformofentityPart2Duediligencequestionnaire),
		specificotherLegalformofentityPart2Duediligencequestionnaire = decodeOptionalStringType(json.specificotherLegalformofentityPart2Duediligencequestionnaire),
		trustPart1Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.trustPart1Duediligencequestionnaire),
		asaFormpfFormpf = decodeOptionalMultipleCheckboxType(json.asaFormpfFormpf),
		asaSpecifyOtherFormpf = decodeOptionalStringType(json.asaSpecifyOtherFormpf),
		financialinstitutionRegulatedstatusPart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.financialinstitutionRegulatedstatusPart2Duediligencequestionnaire),
		indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire = decodeOptionalStringType(json.indicateFinancialinstitutionRegulatedstatusPart2Duediligencequestionnaire),
		departmentRegulatedstatusPart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.departmentRegulatedstatusPart2Duediligencequestionnaire),
		entityRegulatedstatusPart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.entityRegulatedstatusPart2Duediligencequestionnaire),
		luxsentityRegulatedstatusPart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.luxsentityRegulatedstatusPart2Duediligencequestionnaire),
		indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire = decodeOptionalStringType(json.indicateLuxsentityRegulatedstatusPart2Duediligencequestionnaire),
		tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire = decodeOptionalStringType(json.tickersymbolLuxsentityRegulatedstatusPart2Duediligencequestionnaire),
		goventityPart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.goventityPart2Duediligencequestionnaire),
		nomineePart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.nomineePart2Duediligencequestionnaire),
		categoryNomineePart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.categoryNomineePart2Duediligencequestionnaire),
		specificrepresentativeCategoryNomineePart2Duediligencequestionnaire = decodeOptionalStringType(json.specificrepresentativeCategoryNomineePart2Duediligencequestionnaire),
		affiliatedPart2Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.affiliatedPart2Duediligencequestionnaire),
		indicateAffiliatedPart2Duediligencequestionnaire = decodeOptionalStringType(json.indicateAffiliatedPart2Duediligencequestionnaire),
		nameControlpersonPart2Duediligencequestionnaire = decodeOptionalStringType(json.nameControlpersonPart2Duediligencequestionnaire),
		tittleControlpersonPart2Duediligencequestionnaire = decodeOptionalStringType(json.tittleControlpersonPart2Duediligencequestionnaire),
		dobControlpersonPart2Duediligencequestionnaire = decodeOptionalStringType(json.dobControlpersonPart2Duediligencequestionnaire),
		addressControlpersonPart2Duediligencequestionnaire = decodeOptionalStringType(json.addressControlpersonPart2Duediligencequestionnaire),
		idControlpersonPart2Duediligencequestionnaire = decodeOptionalStringType(json.idControlpersonPart2Duediligencequestionnaire),
		citizenshipControlpersonPart2Duediligencequestionnaire = decodeOptionalStringType(json.citizenshipControlpersonPart2Duediligencequestionnaire),
		pepControlpersonPart2Duediligencequestionnaire = decodeOptionalStringType(json.pepControlpersonPart2Duediligencequestionnaire),
		publiclytradedControlpersonPart2Duediligencequestionnaire = decodeOptionalStringType(json.publiclytradedControlpersonPart2Duediligencequestionnaire),
		regulatedentityControlpersonPart2Duediligencequestionnaire = decodeOptionalStringType(json.regulatedentityControlpersonPart2Duediligencequestionnaire),
		nameControlpersonPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.nameControlpersonPart2Duediligencequestionnaire0),
		tittleControlpersonPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.tittleControlpersonPart2Duediligencequestionnaire0),
		dobControlpersonPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.dobControlpersonPart2Duediligencequestionnaire0),
		addressControlpersonPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.addressControlpersonPart2Duediligencequestionnaire0),
		idControlpersonPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.idControlpersonPart2Duediligencequestionnaire0),
		citizenshipControlpersonPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.citizenshipControlpersonPart2Duediligencequestionnaire0),
		pepControlpersonPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.pepControlpersonPart2Duediligencequestionnaire0),
		publiclytradedControlpersonPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.publiclytradedControlpersonPart2Duediligencequestionnaire0),
		regulatedentityControlpersonPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.regulatedentityControlpersonPart2Duediligencequestionnaire0),
		nameControlpersonPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.nameControlpersonPart2Duediligencequestionnaire1),
		tittleControlpersonPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.tittleControlpersonPart2Duediligencequestionnaire1),
		dobControlpersonPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.dobControlpersonPart2Duediligencequestionnaire1),
		addressControlpersonPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.addressControlpersonPart2Duediligencequestionnaire1),
		idControlpersonPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.idControlpersonPart2Duediligencequestionnaire1),
		citizenshipControlpersonPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.citizenshipControlpersonPart2Duediligencequestionnaire1),
		pepControlpersonPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.pepControlpersonPart2Duediligencequestionnaire1),
		publiclytradedControlpersonPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.publiclytradedControlpersonPart2Duediligencequestionnaire1),
		regulatedentityControlpersonPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.regulatedentityControlpersonPart2Duediligencequestionnaire1),
		nameControlpersonPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.nameControlpersonPart2Duediligencequestionnaire2),
		tittleControlpersonPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.tittleControlpersonPart2Duediligencequestionnaire2),
		dobControlpersonPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.dobControlpersonPart2Duediligencequestionnaire2),
		addressControlpersonPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.addressControlpersonPart2Duediligencequestionnaire2),
		idControlpersonPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.idControlpersonPart2Duediligencequestionnaire2),
		citizenshipControlpersonPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.citizenshipControlpersonPart2Duediligencequestionnaire2),
		pepControlpersonPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.pepControlpersonPart2Duediligencequestionnaire2),
		publiclytradedControlpersonPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.publiclytradedControlpersonPart2Duediligencequestionnaire2),
		regulatedentityControlpersonPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.regulatedentityControlpersonPart2Duediligencequestionnaire2),
		nameControlpersonPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.nameControlpersonPart2Duediligencequestionnaire3),
		tittleControlpersonPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.tittleControlpersonPart2Duediligencequestionnaire3),
		dobControlpersonPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.dobControlpersonPart2Duediligencequestionnaire3),
		addressControlpersonPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.addressControlpersonPart2Duediligencequestionnaire3),
		idControlpersonPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.idControlpersonPart2Duediligencequestionnaire3),
		citizenshipControlpersonPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.citizenshipControlpersonPart2Duediligencequestionnaire3),
		pepControlpersonPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.pepControlpersonPart2Duediligencequestionnaire3),
		publiclytradedControlpersonPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.publiclytradedControlpersonPart2Duediligencequestionnaire3),
		regulatedentityControlpersonPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.regulatedentityControlpersonPart2Duediligencequestionnaire3),
		asaFullnameBeneficialownerAmlquestionnaire = decodeOptionalStringType(json.asaFullnameBeneficialownerAmlquestionnaire),
		tittleBeneficialownerAmlquestionnaire = decodeOptionalStringType(json.tittleBeneficialownerAmlquestionnaire),
		asaDateofbirthBeneficialownerAmlquestionnaire = decodeOptionalStringType(json.asaDateofbirthBeneficialownerAmlquestionnaire),
		asaResidentialaddressBeneficialownerAmlquestionnaire = decodeOptionalStringType(json.asaResidentialaddressBeneficialownerAmlquestionnaire),
		addressUbo = if json.addressUbo then SourceMasterTable.decodeJsonSourceMasterTableAddressUboType(json.addressUbo) else nil,
		idBeneficialownerPart2Duediligencequestionnaire = decodeOptionalStringType(json.idBeneficialownerPart2Duediligencequestionnaire),
		citizenshipBeneficialownerPart2Duediligencequestionnaire = decodeOptionalStringType(json.citizenshipBeneficialownerPart2Duediligencequestionnaire),
		pepBeneficialownerPart2Duediligencequestionnaire = decodeOptionalStringType(json.pepBeneficialownerPart2Duediligencequestionnaire),
		publiclytradedBeneficialownerPart2Duediligencequestionnaire = decodeOptionalStringType(json.publiclytradedBeneficialownerPart2Duediligencequestionnaire),
		regulatedentityBeneficialownerPart2Duediligencequestionnaire = decodeOptionalStringType(json.regulatedentityBeneficialownerPart2Duediligencequestionnaire),
		asaFullnameBeneficialownerAmlquestionnaire0 = decodeOptionalStringType(json.asaFullnameBeneficialownerAmlquestionnaire0),
		tittleBeneficialownerAmlquestionnaire0 = decodeOptionalStringType(json.tittleBeneficialownerAmlquestionnaire0),
		asaDateofbirthBeneficialownerAmlquestionnaire0 = decodeOptionalStringType(json.asaDateofbirthBeneficialownerAmlquestionnaire0),
		asaResidentialaddressBeneficialownerAmlquestionnaire0 = decodeOptionalStringType(json.asaResidentialaddressBeneficialownerAmlquestionnaire0),
		addressUbo0 = if json.addressUbo0 then SourceMasterTable.decodeJsonSourceMasterTableAddressUbo0Type(json.addressUbo0) else nil,
		idBeneficialownerPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.idBeneficialownerPart2Duediligencequestionnaire0),
		citizenshipBeneficialownerPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.citizenshipBeneficialownerPart2Duediligencequestionnaire0),
		pepBeneficialownerPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.pepBeneficialownerPart2Duediligencequestionnaire0),
		publiclytradedBeneficialownerPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.publiclytradedBeneficialownerPart2Duediligencequestionnaire0),
		regulatedentityBeneficialownerPart2Duediligencequestionnaire0 = decodeOptionalStringType(json.regulatedentityBeneficialownerPart2Duediligencequestionnaire0),
		asaFullnameBeneficialownerAmlquestionnaire1 = decodeOptionalStringType(json.asaFullnameBeneficialownerAmlquestionnaire1),
		tittleBeneficialownerAmlquestionnaire1 = decodeOptionalStringType(json.tittleBeneficialownerAmlquestionnaire1),
		asaDateofbirthBeneficialownerAmlquestionnaire1 = decodeOptionalStringType(json.asaDateofbirthBeneficialownerAmlquestionnaire1),
		asaResidentialaddressBeneficialownerAmlquestionnaire1 = decodeOptionalStringType(json.asaResidentialaddressBeneficialownerAmlquestionnaire1),
		addressUbo1 = if json.addressUbo1 then SourceMasterTable.decodeJsonSourceMasterTableAddressUbo1Type(json.addressUbo1) else nil,
		idBeneficialownerPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.idBeneficialownerPart2Duediligencequestionnaire1),
		citizenshipBeneficialownerPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.citizenshipBeneficialownerPart2Duediligencequestionnaire1),
		pepBeneficialownerPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.pepBeneficialownerPart2Duediligencequestionnaire1),
		publiclytradedBeneficialownerPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.publiclytradedBeneficialownerPart2Duediligencequestionnaire1),
		regulatedentityBeneficialownerPart2Duediligencequestionnaire1 = decodeOptionalStringType(json.regulatedentityBeneficialownerPart2Duediligencequestionnaire1),
		asaFullnameBeneficialownerAmlquestionnaire2 = decodeOptionalStringType(json.asaFullnameBeneficialownerAmlquestionnaire2),
		tittleBeneficialownerAmlquestionnaire2 = decodeOptionalStringType(json.tittleBeneficialownerAmlquestionnaire2),
		asaDateofbirthBeneficialownerAmlquestionnaire2 = decodeOptionalStringType(json.asaDateofbirthBeneficialownerAmlquestionnaire2),
		asaResidentialaddressBeneficialownerAmlquestionnaire2 = decodeOptionalStringType(json.asaResidentialaddressBeneficialownerAmlquestionnaire2),
		addressUbo2 = if json.addressUbo2 then SourceMasterTable.decodeJsonSourceMasterTableAddressUbo2Type(json.addressUbo2) else nil,
		idBeneficialownerPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.idBeneficialownerPart2Duediligencequestionnaire2),
		citizenshipBeneficialownerPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.citizenshipBeneficialownerPart2Duediligencequestionnaire2),
		pepBeneficialownerPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.pepBeneficialownerPart2Duediligencequestionnaire2),
		publiclytradedBeneficialownerPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.publiclytradedBeneficialownerPart2Duediligencequestionnaire2),
		regulatedentityBeneficialownerPart2Duediligencequestionnaire2 = decodeOptionalStringType(json.regulatedentityBeneficialownerPart2Duediligencequestionnaire2),
		asaFullnameBeneficialownerAmlquestionnaire3 = decodeOptionalStringType(json.asaFullnameBeneficialownerAmlquestionnaire3),
		tittleBeneficialownerAmlquestionnaire3 = decodeOptionalStringType(json.tittleBeneficialownerAmlquestionnaire3),
		asaDateofbirthBeneficialownerAmlquestionnaire3 = decodeOptionalStringType(json.asaDateofbirthBeneficialownerAmlquestionnaire3),
		asaResidentialaddressBeneficialownerAmlquestionnaire3 = decodeOptionalStringType(json.asaResidentialaddressBeneficialownerAmlquestionnaire3),
		addressUbo3 = if json.addressUbo3 then SourceMasterTable.decodeJsonSourceMasterTableAddressUbo3Type(json.addressUbo3) else nil,
		idBeneficialownerPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.idBeneficialownerPart2Duediligencequestionnaire3),
		citizenshipBeneficialownerPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.citizenshipBeneficialownerPart2Duediligencequestionnaire3),
		pepBeneficialownerPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.pepBeneficialownerPart2Duediligencequestionnaire3),
		publiclytradedBeneficialownerPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.publiclytradedBeneficialownerPart2Duediligencequestionnaire3),
		regulatedentityBeneficialownerPart2Duediligencequestionnaire3 = decodeOptionalStringType(json.regulatedentityBeneficialownerPart2Duediligencequestionnaire3),
		clientquestionnairePart2Signatory = if json.clientquestionnairePart2Signatory then SourceMasterTable.decodeJsonSourceMasterTableClientquestionnairePart2SignatoryType(json.clientquestionnairePart2Signatory) else nil,
		asaFullnameInvestornameGeneralinfo2 = decodeOptionalStringType(json.asaFullnameInvestornameGeneralinfo2),
		wireInstructions = if json.wireInstructions then SourceMasterTable.decodeJsonSourceMasterTableWireinstructionsType(json.wireInstructions) else nil,
		nameofsubscriberWireinstructiontoPart3Duediligencequestionnaire = decodeOptionalMultipleCheckboxType(json.nameofsubscriberWireinstructiontoPart3Duediligencequestionnaire),
		brokerageFirm = if json.brokerageFirm then SourceMasterTable.decodeJsonSourceMasterTableBrokeragefirmType(json.brokerageFirm) else nil,
		typeofownershipIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.typeofownershipIndividualsInvestorquestionnaire),
		asaAccreditedinvestorAccreditedinvestor = decodeOptionalMultipleCheckboxType(json.asaAccreditedinvestorAccreditedinvestor),
		qualifiedpurchaserIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.qualifiedpurchaserIndividualsInvestorquestionnaire),
		uspersonIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.uspersonIndividualsInvestorquestionnaire),
		qualifiedclientIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.qualifiedclientIndividualsInvestorquestionnaire),
		notinvest1100IndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.notinvest1100IndividualsInvestorquestionnaire),
		taxtreatmentTaxmatterIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.taxtreatmentTaxmatterIndividualsInvestorquestionnaire),
		explainotherTaxtreatmentTaxmatterIndividualsInvestorquestionnaire = decodeOptionalStringType(json.explainotherTaxtreatmentTaxmatterIndividualsInvestorquestionnaire),
		ustinorssnTaxmatterIndividualsInvestorquestionnaire = decodeOptionalStringType(json.ustinorssnTaxmatterIndividualsInvestorquestionnaire),
		ustinorssnTaxmatterIndividualsInvestorquestionnaire0 = decodeOptionalStringType(json.ustinorssnTaxmatterIndividualsInvestorquestionnaire0),
		uktaxrefTaxmatterIndividualsInvestorquestionnaire = decodeOptionalStringType(json.uktaxrefTaxmatterIndividualsInvestorquestionnaire),
		uktaxrefTaxmatterIndividualsInvestorquestionnaire0 = decodeOptionalStringType(json.uktaxrefTaxmatterIndividualsInvestorquestionnaire0),
		nonustinTaxmatterIndividualsInvestorquestionnaire = decodeOptionalStringType(json.nonustinTaxmatterIndividualsInvestorquestionnaire),
		nonustinTaxmatterIndividualsInvestorquestionnaire0 = decodeOptionalStringType(json.nonustinTaxmatterIndividualsInvestorquestionnaire0),
		countrynonustinTaxmatterIndividualsInvestorquestionnaire = decodeOptionalStringType(json.countrynonustinTaxmatterIndividualsInvestorquestionnaire),
		countrynonustinTaxmatterIndividualsInvestorquestionnaire0 = decodeOptionalStringType(json.countrynonustinTaxmatterIndividualsInvestorquestionnaire0),
		disregardedentityTaxmatterIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.disregardedentityTaxmatterIndividualsInvestorquestionnaire),
		nameTaxownerTaxmatterIndividualsInvestorquestionnaire = decodeOptionalStringType(json.nameTaxownerTaxmatterIndividualsInvestorquestionnaire),
		countryTaxownerTaxmatterIndividualsInvestorquestionnaire = decodeOptionalStringType(json.countryTaxownerTaxmatterIndividualsInvestorquestionnaire),
		taxidTaxownerTaxmatterIndividualsInvestorquestionnaire = decodeOptionalStringType(json.taxidTaxownerTaxmatterIndividualsInvestorquestionnaire),
		staeTaxownerTaxmatterIndividualsInvestorquestionnaire = decodeOptionalStringType(json.staeTaxownerTaxmatterIndividualsInvestorquestionnaire),
		noncooperativejurisdictionsIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.noncooperativejurisdictionsIndividualsInvestorquestionnaire),
		electingfeepartnerIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.electingfeepartnerIndividualsInvestorquestionnaire),
		skipFinraIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.skipFinraIndividualsInvestorquestionnaire),
		finraIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.finraIndividualsInvestorquestionnaire),
		brokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.brokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup),
		immediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.immediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaireGroup),
		nameemployedImmediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaire = decodeOptionalStringType(json.nameemployedImmediatefamilymemberBrokerdealerpersonnelFinraIndividualsInvestorquestionnaire),
		personsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.personsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup),
		immediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.immediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaireGroup),
		specifynameImmediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaire = decodeOptionalStringType(json.specifynameImmediatefamilymemberPersonsowningabrokerdealerFinraIndividualsInvestorquestionnaire),
		publiccompanyFinraIndividualsInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.publiccompanyFinraIndividualsInvestorquestionnaireGroup),
		asaConvictedlast10yearsBadactor = decodeOptionalMultipleCheckboxType(json.asaConvictedlast10yearsBadactor),
		asaSubjecttojudgementlast5yearsBadactor = decodeOptionalMultipleCheckboxType(json.asaSubjecttojudgementlast5yearsBadactor),
		asaSubjecttofinalorderBadactor = decodeOptionalMultipleCheckboxType(json.asaSubjecttofinalorderBadactor),
		asaSubjecttosecorder15bor15cBadactor = decodeOptionalMultipleCheckboxType(json.asaSubjecttosecorder15bor15cBadactor),
		asaSubjecttosecorderpast5yearsBadactor = decodeOptionalMultipleCheckboxType(json.asaSubjecttosecorderpast5yearsBadactor),
		asaSuspendedmembershipBadactor = decodeOptionalMultipleCheckboxType(json.asaSuspendedmembershipBadactor),
		asaUnderwriterBadactor = decodeOptionalMultipleCheckboxType(json.asaUnderwriterBadactor),
		asaUspsfalserepresentationBadactor = decodeOptionalMultipleCheckboxType(json.asaUspsfalserepresentationBadactor),
		notsubjectS506dregulationdIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.notsubjectS506dregulationdIndividualsInvestorquestionnaire),
		subscriberacknowledgesIndividualsInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.subscriberacknowledgesIndividualsInvestorquestionnaire),
		asaAccreditedinvestorAccreditedinvestor1 = decodeOptionalMultipleCheckboxType(json.asaAccreditedinvestorAccreditedinvestor1),
		nameofplanfiduciaryAccreditedinvestorEntityInvestorquestionnaire = decodeOptionalStringType(json.nameofplanfiduciaryAccreditedinvestorEntityInvestorquestionnaire),
		voluntaryEmployeebenefitplanEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.voluntaryEmployeebenefitplanEntityInvestorquestionnaire),
		registerrequiredEmployeebenefitplanEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.registerrequiredEmployeebenefitplanEntityInvestorquestionnaire),
		permitEmployeebenefitplanEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.permitEmployeebenefitplanEntityInvestorquestionnaire),
		asaQualifiedpurchaserQualifiedpurchaser = decodeOptionalMultipleCheckboxType(json.asaQualifiedpurchaserQualifiedpurchaser),
		purposeEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.purposeEntityInvestorquestionnaire),
		lessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.lessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire),
		howmanylessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire = decodeOptionalStringType(json.howmanylessthan10countasNumberofbeneficialownersEntityInvestorquestionnaire),
		morethan10countasNumberofbeneficialownersEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.morethan10countasNumberofbeneficialownersEntityInvestorquestionnaire),
		howmanymorethan10countasNumberofbeneficialownersEntityInvestorquestionnaire = decodeOptionalStringType(json.howmanymorethan10countasNumberofbeneficialownersEntityInvestorquestionnaire),
		asaJurisdictionoftaxresidencyGeneralinfo = decodeOptionalStringType(json.asaJurisdictionoftaxresidencyGeneralinfo),
		jurisdictionyearendTaxmatterEntityInvestorquestionnaire = decodeOptionalStringType(json.jurisdictionyearendTaxmatterEntityInvestorquestionnaire),
		usyearendTaxmatterEntityInvestorquestionnaire = decodeOptionalStringType(json.usyearendTaxmatterEntityInvestorquestionnaire),
		taxstatusTaxmatterEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.taxstatusTaxmatterEntityInvestorquestionnaire),
		exemptTaxmatterEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.exemptTaxmatterEntityInvestorquestionnaire),
		treatmentTaxmatterEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.treatmentTaxmatterEntityInvestorquestionnaire),
		explainotherTreatmentTaxmatterEntityInvestorquestionnaire = decodeOptionalStringType(json.explainotherTreatmentTaxmatterEntityInvestorquestionnaire),
		indicatedisregardedTreatmentTaxmatterEntityInvestorquestionnaire = decodeOptionalStringType(json.indicatedisregardedTreatmentTaxmatterEntityInvestorquestionnaire),
		morethan50percentPartnershipsTaxmatterEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.morethan50percentPartnershipsTaxmatterEntityInvestorquestionnaire),
		satisfy100partnerlimitationPartnershipsTaxmatterEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.satisfy100partnerlimitationPartnershipsTaxmatterEntityInvestorquestionnaire),
		percentTaxmatterEntityInvestorquestionnaire = decodeOptionalStringType(json.percentTaxmatterEntityInvestorquestionnaire),
		foreignsovereignTaxmatterEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.foreignsovereignTaxmatterEntityInvestorquestionnaire),
		caipartnerTaxmatterEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.caipartnerTaxmatterEntityInvestorquestionnaire),
		s511TaxexemptEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.s511TaxexemptEntityInvestorquestionnaire),
		onwerexemptS511TaxexemptEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.onwerexemptS511TaxexemptEntityInvestorquestionnaire),
		partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.partnershiporflowthroughvehicleTaxexemptEntityInvestorquestionnaire),
		taxexemptlpTaxexemptEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.taxexemptlpTaxexemptEntityInvestorquestionnaire),
		blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.blockedTaxexemptlpTaxexemptEntityInvestorquestionnaire),
		entitledTaxexemptEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.entitledTaxexemptEntityInvestorquestionnaire),
		subtypeEntitledTaxexemptEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.subtypeEntitledTaxexemptEntityInvestorquestionnaire),
		usgovernmentpersonEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.usgovernmentpersonEntityInvestorquestionnaire),
		nonusNonustaxstatusEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.nonusNonustaxstatusEntityInvestorquestionnaire),
		partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.partnershiporflowthroughNonustaxstatusEntityInvestorquestionnaire),
		nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.nonuslimitedpartnerNonustaxstatusEntityInvestorquestionnaire),
		electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.electeciinvestmentsNonustaxstatusEntityInvestorquestionnaire),
		electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.electusrphcinvestmentsNonustaxstatusEntityInvestorquestionnaire),
		usgovernmentalTaxcreditEntityInvestorquestionnaire = decodeOptionalStringType(json.usgovernmentalTaxcreditEntityInvestorquestionnaire),
		taxexemptTaxcreditEntityInvestorquestionnaire = decodeOptionalStringType(json.taxexemptTaxcreditEntityInvestorquestionnaire),
		taxableusTaxcreditEntityInvestorquestionnaire = decodeOptionalStringType(json.taxableusTaxcreditEntityInvestorquestionnaire),
		nonusTaxcreditEntityInvestorquestionnaire = decodeOptionalStringType(json.nonusTaxcreditEntityInvestorquestionnaire),
		prohibitforeignentityEntityInvestorquestionnaire = decodeOptionalStringType(json.prohibitforeignentityEntityInvestorquestionnaire),
		noncooperativejurisdictionsEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.noncooperativejurisdictionsEntityInvestorquestionnaire),
		fiscallytransparentS894benefitsEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.fiscallytransparentS894benefitsEntityInvestorquestionnaire),
		caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.caymanfiscallytransparentS894benefitsEntityInvestorquestionnaire),
		withholdingqualifiedholderEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.withholdingqualifiedholderEntityInvestorquestionnaire),
		planassetsErisaEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.planassetsErisaEntityInvestorquestionnaire),
		asaErisaErisa = decodeOptionalMultipleCheckboxType(json.asaErisaErisa),
		percentofassetErisaEntityInvestorquestionnaire = decodeOptionalStringType(json.percentofassetErisaEntityInvestorquestionnaire),
		otherentityErisaEntityInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.otherentityErisaEntityInvestorquestionnaireGroup),
		lessthan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire = decodeOptionalStringType(json.lessthan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire),
		morethan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire = decodeOptionalStringType(json.morethan25percentandnotexceedOtherentityErisaEntityInvestorquestionnaire),
		controllinginfluenceCheckyesornoEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.controllinginfluenceCheckyesornoEntityInvestorquestionnaire),
		publicaccesslawmattersEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.publicaccesslawmattersEntityInvestorquestionnaire),
		seperatelegalpersonalityAdditionalquestionsEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.seperatelegalpersonalityAdditionalquestionsEntityInvestorquestionnaire),
		interestsAdditionalquestionsEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.interestsAdditionalquestionsEntityInvestorquestionnaire),
		avoidregistrationAdditionalquestionsEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.avoidregistrationAdditionalquestionsEntityInvestorquestionnaire),
		consentAdditionalquestionsEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.consentAdditionalquestionsEntityInvestorquestionnaire),
		restrictedpersonorcoveredpersonNewissuesEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.restrictedpersonorcoveredpersonNewissuesEntityInvestorquestionnaire),
		generalexemptionsNewissuesEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.generalexemptionsNewissuesEntityInvestorquestionnaire),
		allocateprofitsorlossesOtherentityGeneralexemptionsNewissuesEntityInvestorquestionnaire = decodeOptionalStringType(json.allocateprofitsorlossesOtherentityGeneralexemptionsNewissuesEntityInvestorquestionnaire),
		restrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.restrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire),
		brokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.brokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup),
		immediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.immediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup),
		nameemployedImmediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire = decodeOptionalStringType(json.nameemployedImmediatefamilymemberBrokerdealerpersonnelRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire),
		personowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.personowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup),
		immediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.immediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup),
		brokerdealernameImmediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire = decodeOptionalStringType(json.brokerdealernameImmediatefamilymemberPersonowningabrokerdealerRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaire),
		publiccompanyRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup = decodeOptionalMultipleCheckboxType(json.publiccompanyRestrictedandcoveredpersonsNewissuesEntityInvestorquestionnaireGroup),
		electingfeepartnerEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.electingfeepartnerEntityInvestorquestionnaire),
		commit1100EntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.commit1100EntityInvestorquestionnaire),
		qualifiedclientEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.qualifiedclientEntityInvestorquestionnaire),
		asaBhcSpecialentities = decodeOptionalMultipleCheckboxType(json.asaBhcSpecialentities),
		governmentalplanBhc = decodeOptionalMultipleCheckboxType(json.governmentalplanBhc),
		asaConvictedlast10yearsBadactor1 = decodeOptionalMultipleCheckboxType(json.asaConvictedlast10yearsBadactor1),
		asaSubjecttojudgementlast5yearsBadactor1 = decodeOptionalMultipleCheckboxType(json.asaSubjecttojudgementlast5yearsBadactor1),
		asaSubjecttofinalorderBadactor1 = decodeOptionalMultipleCheckboxType(json.asaSubjecttofinalorderBadactor1),
		asaSubjecttosecorder15bor15cBadactor1 = decodeOptionalMultipleCheckboxType(json.asaSubjecttosecorder15bor15cBadactor1),
		asaSubjecttosecorderpast5yearsBadactor1 = decodeOptionalMultipleCheckboxType(json.asaSubjecttosecorderpast5yearsBadactor1),
		asaSuspendedmembershipBadactor1 = decodeOptionalMultipleCheckboxType(json.asaSuspendedmembershipBadactor1),
		asaUnderwriterBadactor1 = decodeOptionalMultipleCheckboxType(json.asaUnderwriterBadactor1),
		asaUspsfalserepresentationBadactor1 = decodeOptionalMultipleCheckboxType(json.asaUspsfalserepresentationBadactor1),
		notsubject506dofregulationdEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.notsubject506dofregulationdEntityInvestorquestionnaire),
		beenrefferedThirdpartyreferralsEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.beenrefferedThirdpartyreferralsEntityInvestorquestionnaire),
		nameBeenrefferedThirdpartyreferralsEntityInvestorquestionnaire = decodeOptionalStringType(json.nameBeenrefferedThirdpartyreferralsEntityInvestorquestionnaire),
		signeddisclosurestatementThirdpartyreferralsEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.signeddisclosurestatementThirdpartyreferralsEntityInvestorquestionnaire),
		subscriberacknowledgesEntityInvestorquestionnaire = decodeOptionalMultipleCheckboxType(json.subscriberacknowledgesEntityInvestorquestionnaire),
		subscribernameConsentstatement = decodeOptionalStringType(json.subscribernameConsentstatement),
		nameAuthorizedsignatoryConsentstatement = decodeOptionalStringType(json.nameAuthorizedsignatoryConsentstatement),
		titleAuthorizedsignatoryConsentstatement = decodeOptionalStringType(json.titleAuthorizedsignatoryConsentstatement),
		nameAuthorizedsignatory2Consentstatement = decodeOptionalStringType(json.nameAuthorizedsignatory2Consentstatement),
		titleAuthorizedsignatory2Consentstatement = decodeOptionalStringType(json.titleAuthorizedsignatory2Consentstatement),
		dateAuthorizedsignatoryConsentstatement = decodeOptionalStringType(json.dateAuthorizedsignatoryConsentstatement),
		dateAuthorizedsignatory2Consentstatement = decodeOptionalStringType(json.dateAuthorizedsignatory2Consentstatement),
		transparentordisregardedSection1Exhibite = decodeOptionalMultipleCheckboxType(json.transparentordisregardedSection1Exhibite),
		taxableSection1Exhibite = decodeOptionalMultipleCheckboxType(json.taxableSection1Exhibite),
		section2Exhibite = decodeOptionalMultipleCheckboxType(json.section2Exhibite),
		domiciledoregisteredineeaEeaiqs = decodeOptionalMultipleCheckboxType(json.domiciledoregisteredineeaEeaiqs),
		specifyDomiciledoregisteredineeaEeaiqs = decodeOptionalStringType(json.specifyDomiciledoregisteredineeaEeaiqs),
		onbehalfEeaiqs = decodeOptionalMultipleCheckboxType(json.onbehalfEeaiqs),
		nameOnbehalfEeaiqs = decodeOptionalStringType(json.nameOnbehalfEeaiqs),
		positionOnbehalfEeaiqs = decodeOptionalStringType(json.positionOnbehalfEeaiqs),
		corporateOnbehalfEeaiqs = decodeOptionalStringType(json.corporateOnbehalfEeaiqs),
		stateOnbehalfEeaiqs = decodeOptionalStringType(json.stateOnbehalfEeaiqs),
		representEearepandrequest = decodeOptionalMultipleCheckboxType(json.representEearepandrequest),
		groupRepresentEearepandrequest = decodeOptionalMultipleCheckboxType(json.groupRepresentEearepandrequest),
		natureAntherinstitutionalinvestorRepresentEearepandrequest = decodeOptionalStringType(json.natureAntherinstitutionalinvestorRepresentEearepandrequest),
		groupLargeundertakingRepresentEearepandrequest = decodeOptionalMultipleCheckboxType(json.groupLargeundertakingRepresentEearepandrequest),
		electiveprofessionalcriteriaEearepandrequest = decodeOptionalMultipleCheckboxType(json.electiveprofessionalcriteriaEearepandrequest),
		proinvestorstatusUkrepandrequest = decodeOptionalMultipleCheckboxType(json.proinvestorstatusUkrepandrequest),
		groupProinvestorstatusUkrepandrequest = decodeOptionalMultipleCheckboxType(json.groupProinvestorstatusUkrepandrequest),
		natureAntherinstitutionalinvestorProinvestorstatusUkrepandrequest = decodeOptionalStringType(json.natureAntherinstitutionalinvestorProinvestorstatusUkrepandrequest),
		groupLargeundertakingProinvestorstatusUkrepandrequest = decodeOptionalMultipleCheckboxType(json.groupLargeundertakingProinvestorstatusUkrepandrequest),
		electiveprofessionalcriteriaUkrepandrequest = decodeOptionalMultipleCheckboxType(json.electiveprofessionalcriteriaUkrepandrequest),
		representUkiqs = decodeOptionalMultipleCheckboxType(json.representUkiqs),
		groupInvestmentproRepresentUkiqs = decodeOptionalMultipleCheckboxType(json.groupInvestmentproRepresentUkiqs),
		groupPersonInvestmentproRepresentUkiqs = decodeOptionalMultipleCheckboxType(json.groupPersonInvestmentproRepresentUkiqs),
		groupHighnetworthRepresentUkiqs = decodeOptionalMultipleCheckboxType(json.groupHighnetworthRepresentUkiqs),
		groupCorporateHighnetworthRepresentUkiqs = decodeOptionalMultipleCheckboxType(json.groupCorporateHighnetworthRepresentUkiqs),
		regularqualifiedinvestorsSwissinvestorAppendixb = decodeOptionalMultipleCheckboxType(json.regularqualifiedinvestorsSwissinvestorAppendixb),
		typesLargeundertakingRegularqualifiedinvestorsScheduleh = decodeOptionalMultipleCheckboxType(json.typesLargeundertakingRegularqualifiedinvestorsScheduleh),
		electedqualifiedinvestorsSchedulehAppendixb = decodeOptionalMultipleCheckboxType(json.electedqualifiedinvestorsSchedulehAppendixb),
		swissexemptSchedulehAppendixb = decodeOptionalMultipleCheckboxType(json.swissexemptSchedulehAppendixb),
		provinceresidentCanadianiqs = decodeOptionalStringType(json.provinceresidentCanadianiqs),
		isaccreditedinvestorCanadianiqs = decodeOptionalMultipleCheckboxType(json.isaccreditedinvestorCanadianiqs),
		ispermittedclientCanadianiqs = decodeOptionalMultipleCheckboxType(json.ispermittedclientCanadianiqs),
		accredittedinvestorCanadiansupplement = decodeOptionalMultipleCheckboxType(json.accredittedinvestorCanadiansupplement),
		permittedclientrepresentationCanadiansupplement = decodeOptionalMultipleCheckboxType(json.permittedclientrepresentationCanadiansupplement),
		canadianSignatory = if json.canadianSignatory then SourceMasterTable.decodeJsonSourceMasterTableCanadianSignatoryType(json.canadianSignatory) else nil,
		qualifiedinstitutionalinvestorstatusJapanregulations = decodeOptionalMultipleCheckboxType(json.qualifiedinstitutionalinvestorstatusJapanregulations),
		nonqualifiedinstitutionalinvestorstatusJapanregulations = decodeOptionalMultipleCheckboxType(json.nonqualifiedinstitutionalinvestorstatusJapanregulations),
		collectiveinvestmentschemeorspecialpurposecoJapanregulations = decodeOptionalMultipleCheckboxType(json.collectiveinvestmentschemeorspecialpurposecoJapanregulations),
		typeYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations = decodeOptionalStringType(json.typeYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations),
		numberofqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations = decodeOptionalStringType(json.numberofqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations),
		numberofnonqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations = decodeOptionalStringType(json.numberofnonqualifiedinstitutionalinvestorsYesCollectiveinvestmentschemeorspecialpurposecoJapanregulations),
		professionalinvestorstatusJapanregulations = decodeOptionalMultipleCheckboxType(json.professionalinvestorstatusJapanregulations),
		treatasgeneralinvestorYesProfessionalinvestorstatusJapanregulations = decodeOptionalMultipleCheckboxType(json.treatasgeneralinvestorYesProfessionalinvestorstatusJapanregulations),
		totalassetsStatusofassetsProfessionalinvestorstatusJapanregulations = decodeOptionalStringType(json.totalassetsStatusofassetsProfessionalinvestorstatusJapanregulations),
		netassetsStatusofassetsProfessionalinvestorstatusJapanregulations = decodeOptionalStringType(json.netassetsStatusofassetsProfessionalinvestorstatusJapanregulations),
		financialassetsStatusofassetsProfessionalinvestorstatusJapanregulations = decodeOptionalStringType(json.financialassetsStatusofassetsProfessionalinvestorstatusJapanregulations),
		forcollectiveinvestmentschemeInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations = decodeOptionalStringType(json.forcollectiveinvestmentschemeInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations),
		forothersecuritiesInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations = decodeOptionalStringType(json.forothersecuritiesInvestmentexperienceandperiodProfessionalinvestorstatusJapanregulations),
		purposeoftransactionAmlJapanregulations = decodeOptionalMultipleCheckboxType(json.purposeoftransactionAmlJapanregulations),
		specifyOtherPurposeoftransactionAmlJapanregulations = decodeOptionalStringType(json.specifyOtherPurposeoftransactionAmlJapanregulations),
		businessofinvestorAmlJapanregulations = decodeOptionalMultipleCheckboxType(json.businessofinvestorAmlJapanregulations),
		specifyOtherBusinessofinvestorAmlJapanregulations = decodeOptionalStringType(json.specifyOtherBusinessofinvestorAmlJapanregulations),
		occupationofinvestorAmlJapanregulations = decodeOptionalMultipleCheckboxType(json.occupationofinvestorAmlJapanregulations),
		specifyOtherOccupationofinvestorAmlJapanregulations = decodeOptionalStringType(json.specifyOtherOccupationofinvestorAmlJapanregulations),
		taxcreditWarranties = decodeOptionalMultipleCheckboxType(json.taxcreditWarranties),
		subscribernameTaxcreditWarranties = decodeOptionalStringType(json.subscribernameTaxcreditWarranties),
		taxowner2Signatory = if json.taxowner2Signatory then SourceMasterTable.decodeJsonSourceMasterTableTaxowner2SignatoryType(json.taxowner2Signatory) else nil,
		witness2Signatory = if json.witness2Signatory then SourceMasterTable.decodeJsonSourceMasterTableWitness2SignatoryType(json.witness2Signatory) else nil,
		qualifiedbusinessSupplementalforeign = decodeOptionalMultipleCheckboxType(json.qualifiedbusinessSupplementalforeign),
		morethan50percstockSupplementalforeign = decodeOptionalMultipleCheckboxType(json.morethan50percstockSupplementalforeign),
		section9901Supplementalforeign = decodeOptionalMultipleCheckboxType(json.section9901Supplementalforeign),
		chinesemilitarySupplementalforeign = decodeOptionalMultipleCheckboxType(json.chinesemilitarySupplementalforeign),
		entitylistrequiredSupplementalforeign = decodeOptionalMultipleCheckboxType(json.entitylistrequiredSupplementalforeign),
		section154bSupplementalforeign = decodeOptionalMultipleCheckboxType(json.section154bSupplementalforeign),
		dateAddtionalrepresentations = decodeOptionalStringType(json.dateAddtionalrepresentations),
		letterSubscribernameAddtionalrepresentations = decodeOptionalStringType(json.letterSubscribernameAddtionalrepresentations),
		naturalpersonAddtionalrepresentations = decodeOptionalStringType(json.naturalpersonAddtionalrepresentations),
		entityAddtionalrepresentations = decodeOptionalStringType(json.entityAddtionalrepresentations),
		additionalrepresentationsSignatory = if json.additionalrepresentationsSignatory then SourceMasterTable.decodeJsonSourceMasterTableAdditionalrepresentationsSignatoryType(json.additionalrepresentationsSignatory) else nil,
	}
end

function SourceMasterTable.encodeJsonSourceMasterTableSchema(so: SourceMasterTableSchema): {[string]: any}
	local result: {[string]: any} = {
		fieldKeysInOrder = so.fieldKeysInOrder,
		label = so.label,
	}
	if so.fieldsMap ~= nil then
		result.fieldsMap = SourceMasterTable.encodeJsonSourceMasterTableFieldsMap(so.fieldsMap)
	end
	return result
end

function SourceMasterTable.decodeJsonSourceMasterTableSchema(json: {[string]: any}): SourceMasterTableSchema
	return {
		fieldsMap = if json.fieldsMap then SourceMasterTable.decodeJsonSourceMasterTableFieldsMap(json.fieldsMap) else nil,
		fieldKeysInOrder = json.fieldKeysInOrder or {},
		label = json.label or "",
	}
end

return SourceMasterTable
