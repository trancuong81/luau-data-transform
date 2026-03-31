--!strict
local DataTypes = require("@lib/data_types")

local FullTargetTable = {}

export type FullTargetTableSfBeneficialownerFields = {
	sfBeneficialOwnerNullWebsiteC: DataTypes.StringType?,
	sfBeneficialOwnerNullNonUSTaxIDCountryC: DataTypes.StringType?,
	sfBeneficialOwnerNullTCGGlobalIdC: DataTypes.StringType?,
	sfBeneficialOwnerNullLastModifiedById: DataTypes.StringType?,
	anduinBeneficialOwnerNullInvestorRegisteredFullAddress: DataTypes.StringType?,
	sfBeneficialOwnerNullFirstName: DataTypes.StringType?,
	sfBeneficialOwnerNullName: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredStateProvinceC: DataTypes.StringType?,
	sfBeneficialOwnerNullUSTaxIDC: DataTypes.StringType?,
	sfBeneficialOwnerNullOwnerId: DataTypes.StringType?,
	sfBeneficialOwnerNullMiddleNameC: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredCountryC: DataTypes.StringType?,
	sfBeneficialOwnerNullAMLRefreshNotesC: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIssuedIDOnFileC: DataTypes.StringType?,
	sfBeneficialOwnerNullAMLMonitoringC: DataTypes.MultipleCheckboxType?,
	sfBeneficialOwnerNullIndividualOrganizationC: DataTypes.StringType?,
	sfBeneficialOwnerNullCountryOfBirthC: DataTypes.StringType?,
	sfBeneficialOwnerNullPoliticallyExposedPersonC: DataTypes.MultipleCheckboxType?,
	sfBeneficialOwnerNullPercentageOfOwnershipC: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIDNumberC: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIDCountryC: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIDExpirationDateC: DataTypes.StringType?,
	sfBeneficialOwnerNullIsActiveC: DataTypes.MultipleCheckboxType?,
	sfBeneficialOwnerNullNonUSTaxIDC: DataTypes.StringType?,
	sfBeneficialOwnerNullLastName: DataTypes.StringType?,
	sfBeneficialOwnerNullBeneficialOwnerLongNameC: DataTypes.StringType?,
	sfBeneficialOwnerNullKYCRefreshC: DataTypes.MultipleCheckboxType?,
	sfBeneficialOwnerNullPEPStatusC: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredPostalCodeC: DataTypes.StringType?,
	sfBeneficialOwnerNullUSTaxIDTypeC: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredStreetAddressC: DataTypes.StringType?,
	sfBeneficialOwnerNullDateOfBirthC: DataTypes.StringType?,
	sfBeneficialOwnerNullLastTriggeredTimestampC: DataTypes.StringType?,
	sfBeneficialOwnerNullRiskRatingC: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredCityC: DataTypes.StringType?,
	sfBeneficialOwnerNullSourceOfWealthC: DataTypes.StringType?,
	sfBeneficialOwnerNullAMLNotesC: DataTypes.StringType?,
	sfBeneficialOwnerNullMaxComplyIdC: DataTypes.StringType?,
	sfBeneficialOwnerNullBeneficialCountryC: DataTypes.StringType?,
	sfBeneficialOwnerNullCreatedById: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIDJurisdictionStateC: DataTypes.StringType?,
}

export type FullTargetTableSfBeneficialownerType = {
	typeId: string,
	valueSubFields: FullTargetTableSfBeneficialownerFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type FullTargetTableSfContactFields = {
	sfContactNullMailingAddress: DataTypes.StringType?,
	sfContactNullAccountId: DataTypes.StringType?,
	sfContactNullOpBusinessPhoneC: DataTypes.StringType?,
	sfContactIFCWireApproverC: DataTypes.MultipleCheckboxType?,
	sfContactNullMailingStreet: DataTypes.StringType?,
	sfContactNullMailingState: DataTypes.StringType?,
	sfContactNullMailingPostalCode: DataTypes.StringType?,
	sfContactIFCTaxAdvisorC: DataTypes.MultipleCheckboxType?,
	sfContactIFCTaxInformationNotC: DataTypes.MultipleCheckboxType?,
	sfContactIFCCapitalCallManagementNotC: DataTypes.MultipleCheckboxType?,
	sfContactIFCLegalInformationNotC: DataTypes.MultipleCheckboxType?,
	sfContactNullMailingCity: DataTypes.StringType?,
	sfContactNullOpEmailPrimaryC: DataTypes.StringType?,
	sfContactIFCAMLKYCContactC: DataTypes.MultipleCheckboxType?,
	anduinContactRole: DataTypes.MultipleCheckboxType?,
	sfContactNullMiddleNameC: DataTypes.StringType?,
	sfContactNullName: DataTypes.StringType?,
	sfContactNullSalutation: DataTypes.StringType?,
	sfContactIFCNotificationsNotC: DataTypes.MultipleCheckboxType?,
	sfContactIFCDistributionManagementNotC: DataTypes.MultipleCheckboxType?,
	sfContactNullFirstName: DataTypes.StringType?,
	sfContactIFCFinanceContactC: DataTypes.MultipleCheckboxType?,
	sfContactIFCLegalAdvisorC: DataTypes.MultipleCheckboxType?,
	sfContactIFCPrimaryContactC: DataTypes.MultipleCheckboxType?,
	anduinContactNotification: DataTypes.MultipleCheckboxType?,
	sfContactIFCNotificationsC: DataTypes.MultipleCheckboxType?,
	sfContactNullEmailFundraising: DataTypes.StringType?,
	sfContactIFCFinancialReportingNotC: DataTypes.MultipleCheckboxType?,
	sfContactNullFax: DataTypes.StringType?,
	sfContactNullTCGGlobalIdC: DataTypes.StringType?,
	sfContactIFCSecondaryContactC: DataTypes.MultipleCheckboxType?,
	sfContactNullLastName: DataTypes.StringType?,
	sfContactNullMailingCountry: DataTypes.StringType?,
	sfContactNullBusinessPhone: DataTypes.StringType?,
}

export type FullTargetTableSfContactType = {
	typeId: string,
	valueSubFields: FullTargetTableSfContactFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type FullTargetTableSfControllingpersonsFields = {
	sfControllingPersonsNullTINUnavailableC: DataTypes.StringType?,
	sfControllingPersonsNullMailingStateC: DataTypes.StringType?,
	sfControllingPersonsNullMailingCityC: DataTypes.StringType?,
	sfControllingPersonsNullDateOfBirthC: DataTypes.StringType?,
	sfControllingPersonsNullFirstNameC: DataTypes.StringType?,
	sfControllingPersonsNullSubscriptionInvestorC: DataTypes.StringType?,
	sfControllingPersonsNullCRSDocumentIDC: DataTypes.StringType?,
	sfControllingPersonsNullSubscriptionInvestorIDC: DataTypes.StringType?,
	sfControllingPersonsNullResidenceCountryC: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo5C: DataTypes.StringType?,
	sfControllingPersonsNullCountryOfBirthC: DataTypes.StringType?,
	sfControllingPersonsNullEffectiveDateC: DataTypes.StringType?,
	sfControllingPersonsNullMailingAddress2C: DataTypes.StringType?,
	sfControllingPersonsNullMailingCountryC: DataTypes.StringType?,
	sfControllingPersonsNullMiddleNameC: DataTypes.StringType?,
	sfControllingPersonsNullTINNo5C: DataTypes.StringType?,
	sfControllingPersonsNullMailingPostalCodeC: DataTypes.StringType?,
	sfControllingPersonsNullTINNo1C: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo3C: DataTypes.StringType?,
	sfControllingPersonsNullReportingCountriesC: DataTypes.StringType?,
	sfControllingPersonsNullResidencePostalCodeC: DataTypes.StringType?,
	sfControllingPersonsNullLastNameC: DataTypes.StringType?,
	sfControllingPersonsNullTypeC: DataTypes.StringType?,
	sfControllingPersonsNullResidenceStateC: DataTypes.StringType?,
	sfControllingPersonsNullType2C: DataTypes.StringType?,
	sfControllingPersonsNullTINNo4C: DataTypes.StringType?,
	sfControllingPersonsNullResidenceStreetC: DataTypes.StringType?,
	sfControllingPersonsNullControllingPersonPackageC: DataTypes.StringType?,
	sfControllingPersonsNullCRSReportingThresholdC: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo4C: DataTypes.StringType?,
	sfControllingPersonsNullTINNo2C: DataTypes.StringType?,
	sfControllingPersonsNullInactiveC: DataTypes.MultipleCheckboxType?,
	sfControllingPersonsNullResidenceCityC: DataTypes.StringType?,
	sfControllingPersonsNullType3C: DataTypes.StringType?,
	sfControllingPersonsNullTINNo3C: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo1C: DataTypes.StringType?,
	sfControllingPersonsNullPlaceOfBirthC: DataTypes.StringType?,
	sfControllingPersonsNullMailingStreetC: DataTypes.StringType?,
	sfControllingPersonsNullCRSValidationResultC: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo2C: DataTypes.StringType?,
	sfControllingPersonsNullResidenceAddress2C: DataTypes.StringType?,
	sfControllingPersonsNullCRSStatusC: DataTypes.StringType?,
	sfControllingPersonsNullName: DataTypes.StringType?,
	sfControllingPersonsNullTaxStatusC: DataTypes.StringType?,
}

export type FullTargetTableSfControllingpersonsType = {
	typeId: string,
	valueSubFields: FullTargetTableSfControllingpersonsFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type FullTargetTableSfFundSelectionFields = {
	SubFundGlobalId: DataTypes.StringType?,
	CommitmentAmount: DataTypes.StringType?,
}

export type FullTargetTableSfFundSelectionType = {
	typeId: string,
	valueSubFields: FullTargetTableSfFundSelectionFields?,
	subFieldKeysInOrder: {string},
	label: string?,
}

export type FullTargetTableFieldsMap = {
	sfInvestorAccountNullTCGGlobalIdC: DataTypes.StringType?,
	sfFundSelection: {FullTargetTableSfFundSelectionType},
	sfAccountInvestorAccountTCGGlobalIdC: DataTypes.StringType?,
	sfAccountCommonNameName: DataTypes.StringType?,
	sfAccountCommonNameTypeC: DataTypes.StringType?,
	sfAccountCommonNameIndustry: DataTypes.StringType?,
	sfAccountCommonNameBeneficialCountryFormulaC: DataTypes.StringType?,
	sfAccountCommonNameTCGGlobalIdC: DataTypes.StringType?,
	sfAccountCommonNameAccountTeamMembersC: DataTypes.StringType?,
	sfAccountCommonNameDescription: DataTypes.StringType?,
	sfAccountCommonNameBillingAddress: DataTypes.StringType?,
	sfAccountCommonNameShippingAddress: DataTypes.StringType?,
	sfAccountCommonNamePhone: DataTypes.StringType?,
	sfAccountCommonNameWebsite: DataTypes.StringType?,
	sfAccountCommonNameRecordTypeId: DataTypes.StringType?,
	sfAccountSubscriptionInvestorName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorType: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCTradeNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCommonNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPhone: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingCountry: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingStreet: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingCity: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingState: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingPostalCode: DataTypes.StringType?,
	anduinAccountSubscriptionInvestorBillingFullAddress: DataTypes.StringType?,
	sfAccountSubscriptionInvestorParentId: DataTypes.StringType?,
	sfAccountSubscriptionInvestorParentTypeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCOccupationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCTitleC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCEmployerNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCSubscribingAsARepresentativeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWLCSubscribingAsRepresentativeDetailsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorIndustry: DataTypes.StringType?,
	sfAccountSubscriptionInvestorDomesticForeignC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCitizenshipC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTCGGlobalIdC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorHasCarlyleOnboardingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorHasSolutionsOnboardingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorDisregardedEntityC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIndividualOrganizationC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxCountryJurisdictionC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorStateOfTaxResidenceC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLInvestorTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLAddressCityC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLAddressStateProvinceC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBeneficialOwnerTypeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLAddressCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBeneficialCountryFormulaC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorRegulatedEntityC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorRiskRatingC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBrokerDealerC: DataTypes.MultipleCheckboxType?,
	anduinAccountSubscriptionInvestorBrokerDealerC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorRiskRating3NotesC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBankNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBankLocationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorRiskCommitteeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorFINRARetailInvestorC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorLuxTaxAssessmentRatingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWebsite: DataTypes.StringType?,
	sfAccountSubscriptionInvestorHighRiskJurisdictionC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorEligibleIntroducerLetterCertificateC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorMediumHighRiskJurisdictionC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIntroducerLetterCertificateCommentsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorNomineeIntermediaryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLPreClearanceC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorHighRiskIndustryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLPreClearanceFundsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorComplexStructureC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTypeOfBlockC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorNegativeNewsC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAccountBlockingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorBearerSharesC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAccountBlockingDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorShellBankC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAccountBlockingRemovedDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPoliticallyExposedPersonPEPC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLReviewCycleC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPEPStatusDetailsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorNextAMLReviewDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPEPStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorMarketingMethodC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorSourceOfWealthCategoryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorMarketingDetailsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSourceOfWealthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorMiFIDClientCategoryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorSourceOfFundsCategoryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorSourceOfFundsDetailsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSoWSoFCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorLegalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorHighRiskFactorsC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAwarenessNexusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLNotesC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorApprovalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorNameChangeApprovalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLApproverC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorFMApproverC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorFormTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorFMTaxIdC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorEquityTaxIdC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTaxEntityTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorFATCAStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorUSTINTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWithholdingForeignPartnershipEINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTaxResidencyCertificatesC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSponsoringEntityGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorW9OtherEntityTypeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAccountOpeningDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorJointAccountNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTreatyCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCountryOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCitizenshipCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCountryOfIncorporationFormationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorExemptPayeeCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorDateOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBranchGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorGIINStatusDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorGIINStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedForeignPensionFundQFPFC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxReportingByAlpInvestC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxAccountOwnerC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingStreetC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingCityC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingStateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingPostalCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingStreet2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOTaxStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOCitizenshipCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOCountryOfIncorporationFormationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOUSTaxIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOIndividualOrOrganizationC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOUSTINTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOInvestorForeignDomesticC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAONonUSTaxIDCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOForeignTaxIdC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWithholdingForeignPartnershipEINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAODateOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOTaxCountryJurisdictionC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOExemptPayeeCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingStreetC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingCityC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOInvestorMailingStateProvinceC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingPostalCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingStreet2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOTaxFormTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOBranchGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOCountryOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFATCAClassificationC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOSponsoringEntityGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOW9OtherEntityTypeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFirstNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOLastNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOMiddleNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFATCAStatusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOExemptionFromFATCAWithholdingCodC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorIdentificationAsASpecifiedUKPersonC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCDOTEntityAccountHolderStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAffiliatedCorporationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorReportableUKPersonC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorReportableGGYJEYGIBIOMPersonC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCRSClassificationC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorRelatedEntityC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPlaceOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorDateOfOrganizationFormationDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorEffectiveDateOfSelfCertificationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorNameOfSecuritiesMarketC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorStatusOfCRSReviewC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorReportableNonReportableAccountC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC: DataTypes.MultipleCheckboxType?,
	anduinAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorReportingCountriesC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINUnavailableC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo1C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo1C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo3C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo3C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo4C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo4C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo5C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo5C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorRegisteredAddress2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorMailingAddress2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAccreditedInvestorStatusEntitiesC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAccreditedInvestorStatusIndividualC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorGovernmentIssuedIDOnFileC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorGovernmentIDExpirationDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorExpirationOfRestrictiveCovenantPerioC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorIsCapitalShareholderControlledC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsIndivRetirementBenefitPlanC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsBHCC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIndividualRetirementAccountIRAC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedPurchaserC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedInvestorStatusEntityC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedClientStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedInvestorStatusIndividualC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsJapaneseResC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsFIELQualifiedC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsArticle63AppliedC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorEUElectiveProfessionalClientC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorDescription: DataTypes.StringType?,
	sfAccountSubscriptionInvestorUBSEscrowAccountC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorMSSBIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorMRORC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorIsUSTaxExemptC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsSection115Entity: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorOwnerIsUSTaxExempt: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTreatedAsTaxExemptLP: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxExemptSubtypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorExemptFromStateAndLocalIncomeTaxC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWHRateOIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWHRateECIC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWHRateFATCAC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorRecordTypeId: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAccountStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWLCRegulatorC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCExchangeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCTickerSymbolC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC: DataTypes.MultipleCheckboxType?,
	anduinAccountSubscriptionInvestorSignerFirstName: DataTypes.StringType?,
	anduinAccountSubscriptionInvestorSignerMiddleName: DataTypes.StringType?,
	anduinAccountSubscriptionInvestorSignerLastName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSignerFirstName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSignerMiddleName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSignerLastName: DataTypes.StringType?,
	sfAgreementOnboardingNameC: DataTypes.StringType?,
	sfAgreementOnboardingStatusC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingTypeC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingCommonSubscriptionEntityC: DataTypes.StringType?,
	sfAgreementOnboardingSubscriptionInvestorApprovalStatusC: DataTypes.StringType?,
	sfAgreementOnboardingAccountC: DataTypes.StringType?,
	sfAgreementOnboardingRelatedCommonNameC: DataTypes.StringType?,
	sfAgreementOnboardingSIIndividualOrOrganizationC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorForeignDomesticC: DataTypes.StringType?,
	sfAgreementOnboardingOriginalCompletedDateC: DataTypes.StringType?,
	sfAgreementOnboardingParentAgreementIdC: DataTypes.StringType?,
	sfAgreementOnboardingCommitmentTypeC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingInvestorFundC: DataTypes.StringType?,
	sfAgreementOnboardingOpportunityC: DataTypes.StringType?,
	sfAgreementOnboardingFundC: DataTypes.StringType?,
	sfAgreementOnboardingCurrencyC: DataTypes.StringType?,
	sfAgreementOnboardingFundCloseC: DataTypes.StringType?,
	sfAgreementOnboardingPartnershipC: DataTypes.StringType?,
	sfAgreementOnboardingRequestedCommitmentAmountC: DataTypes.StringType?,
	sfAgreementOnboardingCommitmentC: DataTypes.StringType?,
	sfAgreementOnboardingUSDAmountC: DataTypes.StringType?,
	sfAgreementOnboardingEffectiveDateC: DataTypes.StringType?,
	sfAgreementOnboardingInvestranVehicleTypeC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingRelatedAgreementsGroupC: DataTypes.StringType?,
	sfAgreementOnboardingAssociatedLegalEntitiesC: DataTypes.StringType?,
	sfAgreementOnboardingAgreementLegalEntitiesExternalIdsC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredCountryC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredStreetAddressC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredCityC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredStateProvinceC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredPostalCodeC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredAddress2C: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingCountryC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingStreetC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingCityC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingStateProvinceC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingZipPostalCodeC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingAddress2C: DataTypes.StringType?,
	sfAgreementOnboardingSIUSTaxpayerIdentificationNumberC: DataTypes.StringType?,
	sfAgreementOnboardingSIUSTINTypeC: DataTypes.StringType?,
	sfAgreementOnboardingSITaxStatusC: DataTypes.StringType?,
	sfAgreementOnboardingSITaxCountryJurisdictionC: DataTypes.StringType?,
	sfAgreementOnboardingSIFATCAClassificationC: DataTypes.StringType?,
	sfAgreementOnboardingSINonUSTaxIDC: DataTypes.StringType?,
	sfAgreementOnboardingSINonUSTaxIDCountryC: DataTypes.StringType?,
	sfAgreementOnboardingSICitizenshipCountryC: DataTypes.StringType?,
	sfAgreementOnboardingSICountryOfIncorporationFormationC: DataTypes.StringType?,
	sfAgreementOnboardingSICountryOfBirthC: DataTypes.StringType?,
	sfAgreementOnboardingSIDateOfBirthC: DataTypes.StringType?,
	sfAgreementOnboardingSIExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfAgreementOnboardingSIExemptPayeeCodeC: DataTypes.StringType?,
	sfAgreementOnboardingSIGIINC: DataTypes.StringType?,
	sfAgreementOnboardingSIBranchGIINC: DataTypes.StringType?,
	sfAgreementOnboardingX892CAIC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingX892CAITextC: DataTypes.StringType?,
	sfAgreementOnboardingTaxExemptStatusNotesC: DataTypes.StringType?,
	sfAgreementOnboardingERISAPartnerC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIsERISATitleIC: DataTypes.MultipleCheckboxType?,
	anduinAgreementOnboardingIsERISATitleIC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSIDisregardedGPOfGPC: DataTypes.StringType?,
	sfAgreementOnboardingSIQualifiedInstitutionalInvestorFIELC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSIFundingParentSubEntityC: DataTypes.StringType?,
	sfAgreementOnboardingSIArticle63Paragraph1AppliesC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSIFundingSiloC: DataTypes.StringType?,
	sfAgreementOnboardingNewCommitmentOrTransferC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingConfirmationOfInvestmentOnOwnBehalfC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingInvestorTypeC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingLuxTaxAssessmentC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingInvestingInLuxFundsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingLuxTaxAssessmentScoreC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSourceOfFundsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingEvidenceOfExistenceC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSourceOfWealthC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingEvidenceOfCorporateAuthorityC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSourceOfWealthDetailsC: DataTypes.StringType?,
	sfAgreementOnboardingSignedStructureChartC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingListOfLegalRepsAndDirectorsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingEvidenceOfEachTierOfTheStructureC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIdentificationOfAuthorizedSignatoriesC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIdentificationOfUBOsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingFinCENControlPersonC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingWorldCheckResultsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingControlPersonJurisdictionC: DataTypes.StringType?,
	sfAgreementOnboardingWorldCheckDetailsC: DataTypes.StringType?,
	sfAgreementOnboardingExceptionsWaiversC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingApprovalForHighRiskOrPEPC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingExceptionsWaiversDetailsC: DataTypes.StringType?,
	sfAgreementOnboardingAnalystC: DataTypes.StringType?,
	sfAgreementOnboardingKYCSatisfactoryC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingAMLReviewInitiatedC: DataTypes.StringType?,
	sfAgreementOnboardingPostCloseDetailsC: DataTypes.StringType?,
	sfAgreementOnboardingAMLClearanceDateC: DataTypes.StringType?,
	sfAgreementOnboardingPostCloseFollowUpDateC: DataTypes.StringType?,
	sfAgreementOnboardingAMLNotesC: DataTypes.StringType?,
	sfAgreementOnboardingAMLApprovalDateC: DataTypes.StringType?,
	sfAgreementOnboardingEligibleIntroducerLetterCertificateC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingExternalAccountNumberC: DataTypes.StringType?,
	sfAgreementOnboardingCommentsC: DataTypes.StringType?,
	sfAgreementOnboardingExternalAccountInstitutionC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingAMLDataApprovedC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingAMLApproverC: DataTypes.StringType?,
	sfAgreementOnboardingAMLApprovedC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingFMApprovedC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSkipAMLApprovalsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIFStatusC: DataTypes.StringType?,
	sfAgreementOnboardingRecordTypeId: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestingAssetsOfAnyRetirementPlC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIsInvestorControllingC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIsERISAFOIAC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSIQualifiedInvestorStatusEntityC: DataTypes.MultipleCheckboxType?,
	anduinAgreementOnboardingSignerFirstName: DataTypes.StringType?,
	anduinAgreementOnboardingSignerMiddleName: DataTypes.StringType?,
	anduinAgreementOnboardingSignerLastName: DataTypes.StringType?,
	sfAgreementOnboardingSignerFirstName: DataTypes.StringType?,
	sfAgreementOnboardingSignerMiddleName: DataTypes.StringType?,
	sfAgreementOnboardingSignerLastName: DataTypes.StringType?,
	sfAgreementNullTCGGlobalIdC: DataTypes.StringType?,
	sfAgreementNullCommitmentC: DataTypes.StringType?,
	anduinAgreementNullSignerFirstName: DataTypes.StringType?,
	anduinAgreementNullSignerMiddleName: DataTypes.StringType?,
	anduinAgreementNullSignerLastName: DataTypes.StringType?,
	sfAgreementNullSignerFirstName: DataTypes.StringType?,
	sfAgreementNullSignerMiddleName: DataTypes.StringType?,
	sfAgreementNullSignerLastName: DataTypes.StringType?,
	sfAgreementNullWLCInternationalSupplementsC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullReceiveUnappliedBalanceReductionAmtC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullIsNotIRCUSPerson: DataTypes.MultipleCheckboxType?,
	sfAgreementNullOwnerIsNotIRCUSPerson: DataTypes.MultipleCheckboxType?,
	sfAgreementNullTreatedAsNonUSLP: DataTypes.MultipleCheckboxType?,
	sfAgreementNullECIC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullUBTIC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullUSRPHCC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullWLC894EligibleC: DataTypes.MultipleCheckboxType?,
	sfFundFundPrivateEquityRealAssetName: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetProductNameC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundLegalNameC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundAbbreviationC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetStatusC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundStatusC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetInactiveDateC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetVintageYearC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetInvestorDiscretionC: DataTypes.MultipleCheckboxType?,
	sfFundFundPrivateEquityRealAssetFundStrategyDescriptionC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetPartOfProgramC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetPRACoverageC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetAIFMDC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetMandateBackgroundC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetCarlyleNotResponsibleForAMLKYCC: DataTypes.MultipleCheckboxType?,
	sfFundFundPrivateEquityRealAssetFundTypeC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetProductLineC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetProductTypeC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundFamilyC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundFocusC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetRegionC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetStructureC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetCurrencyC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundFocusAdditionalInfoC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundSpecificParagraphC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetManagedAccountDirectInvestmentsC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetClosingDateC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFinalClosingDateC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFinalClosingDatePerLPAC: DataTypes.StringType?,
	sfFundFundCloseName: DataTypes.StringType?,
	sfFundFundCloseFundC: DataTypes.StringType?,
	sfFundFundCloseCloseDateC: DataTypes.StringType?,
	sfFundFundCloseRecordTypeId: DataTypes.StringType?,
	sfFundNullTCGGlobalIdC: DataTypes.StringType?,
	sfBeneficialOwner: {FullTargetTableSfBeneficialownerType},
	sfControllingPersons: {FullTargetTableSfControllingpersonsType},
	sfIFCNullEmailC: DataTypes.StringType?,
	sfIFCNullStatusC: DataTypes.StringType?,
	sfIFCNullCommonNameC: DataTypes.StringType?,
	sfIFCNullInvestorClassificationC: DataTypes.StringType?,
	sfIFCNullBeneficialCountryC: DataTypes.StringType?,
	sfIFCNullDateOfBirthC: DataTypes.StringType?,
	sfIFCNullIndividualOrOrganizationC: DataTypes.StringType?,
	sfIFCNullFullAddressC: DataTypes.StringType?,
	sfIFCNullCreatedById: DataTypes.StringType?,
	sfIFCNullName: DataTypes.StringType?,
	sfIFCNullLastModifiedById: DataTypes.StringType?,
	sfIFCNullExternalIDC: DataTypes.StringType?,
	sfIFCNullRecordTypeId: DataTypes.StringType?,
	sfIFCNullContactCountryC: DataTypes.StringType?,
	sfIFCNullContactIDC: DataTypes.StringType?,
	sfIFCNullContactNameC: DataTypes.StringType?,
	sfIFCNullContactRecordTypeNameC: DataTypes.StringType?,
	sfIFCNullContactTCGGlobalIDC: DataTypes.StringType?,
	sfIFCNullContactSCNRegisteredCountryC: DataTypes.StringType?,
	sfContact: {FullTargetTableSfContactType},
	sfTaxFormW9TaxAccountOwner: DataTypes.StringType?,
	sfTaxFormW9DisregardedEntityName: DataTypes.StringType?,
	sfTaxFormW9TAOTaxAccountOwner: DataTypes.StringType?,
	sfTaxFormW9TaxStatusC: DataTypes.MultipleCheckboxType?,
	sfTaxFormW9TAOTaxStatusC: DataTypes.MultipleCheckboxType?,
	sfTaxFormW9TaxEntityTypeC: DataTypes.StringType?,
	sfTaxFormW9ExemptPayeeCodeC: DataTypes.StringType?,
	sfTaxFormW9ExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfTaxFormW9TAOExemptPayeeCodeC: DataTypes.StringType?,
	sfTaxFormW9TAOExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfTaxFormW9BillingStreet: DataTypes.StringType?,
	sfTaxFormW9BillingCity: DataTypes.StringType?,
	sfTaxFormW9BillingState: DataTypes.StringType?,
	sfTaxFormW9BillingPostalCode: DataTypes.StringType?,
	sfTaxFormW9BillingCountry: DataTypes.StringType?,
	sfTaxFormW9TAOBillingStreetC: DataTypes.StringType?,
	sfTaxFormW9TAOBillingCityC: DataTypes.StringType?,
	sfTaxFormW9TAOBillingStateC: DataTypes.StringType?,
	sfTaxFormW9TAOBillingPostalCodeC: DataTypes.StringType?,
	sfTaxFormW9TAOBillingCountryC: DataTypes.StringType?,
	sfTaxFormW9FMTaxIdC: DataTypes.StringType?,
	sfTaxFormW9USTINTypeC: DataTypes.MultipleCheckboxType?,
	sfTaxFormW9TAOUSTaxIDC: DataTypes.StringType?,
	sfTaxFormW9TAOUSTINTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWHRateExpirationDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorValidationResultC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorEffectiveDateOfTaxFormStatusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorEffectiveDateOfFATCAStatusAndRateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSubjectToFATCAWithholdingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorStatusOfFATCAReviewC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorFATCAMonitoredC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorLimitationOfBenefitsOtherC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorLimitationOfBenefitsC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOGlobalIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOTaxIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOStatusOfFATCAReviewC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOSubjectToFATCAWithholdingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOTaxApprovalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOTaxFormStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOTreatyCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRateFIRPTAIncomeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRateInterestIncomeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRatePrivateDividendC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRatePublicDividendC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOGIINStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAODemographicApprovalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOGIINStatusDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOEffectiveDateFATCACompletedStatusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOEffectiveDateOfTaxFormStatusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOLimitationOfBenefitsOtherC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFATCAMonitoredC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOBeneficialCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOEW8StatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOClientIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFATCADocumentIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOValidationResultC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCRSStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCRSDocumentIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCRSValidationResultC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorFATCADocumentIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSExemptionCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorStateExemptCertificationProvidedC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorDateStateExemptCertificateProvidedC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLRefreshStatusC: DataTypes.MultipleCheckboxType?,
	sfIFCNullHideIFCFromContactSelfServicingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOLimitationOfBenefitsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingInitialAdditional: DataTypes.MultipleCheckboxType?,
}

export type FullTargetTableSchema = {
	fieldsMap: FullTargetTableFieldsMap?,
	fieldKeysInOrder: {string},
	label: string,
}

function FullTargetTable.makeFullTargetTableSfBeneficialownerFields(config: {
	sfBeneficialOwnerNullWebsiteC: DataTypes.StringType?,
	sfBeneficialOwnerNullNonUSTaxIDCountryC: DataTypes.StringType?,
	sfBeneficialOwnerNullTCGGlobalIdC: DataTypes.StringType?,
	sfBeneficialOwnerNullLastModifiedById: DataTypes.StringType?,
	anduinBeneficialOwnerNullInvestorRegisteredFullAddress: DataTypes.StringType?,
	sfBeneficialOwnerNullFirstName: DataTypes.StringType?,
	sfBeneficialOwnerNullName: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredStateProvinceC: DataTypes.StringType?,
	sfBeneficialOwnerNullUSTaxIDC: DataTypes.StringType?,
	sfBeneficialOwnerNullOwnerId: DataTypes.StringType?,
	sfBeneficialOwnerNullMiddleNameC: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredCountryC: DataTypes.StringType?,
	sfBeneficialOwnerNullAMLRefreshNotesC: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIssuedIDOnFileC: DataTypes.StringType?,
	sfBeneficialOwnerNullAMLMonitoringC: DataTypes.MultipleCheckboxType?,
	sfBeneficialOwnerNullIndividualOrganizationC: DataTypes.StringType?,
	sfBeneficialOwnerNullCountryOfBirthC: DataTypes.StringType?,
	sfBeneficialOwnerNullPoliticallyExposedPersonC: DataTypes.MultipleCheckboxType?,
	sfBeneficialOwnerNullPercentageOfOwnershipC: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIDNumberC: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIDCountryC: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIDExpirationDateC: DataTypes.StringType?,
	sfBeneficialOwnerNullIsActiveC: DataTypes.MultipleCheckboxType?,
	sfBeneficialOwnerNullNonUSTaxIDC: DataTypes.StringType?,
	sfBeneficialOwnerNullLastName: DataTypes.StringType?,
	sfBeneficialOwnerNullBeneficialOwnerLongNameC: DataTypes.StringType?,
	sfBeneficialOwnerNullKYCRefreshC: DataTypes.MultipleCheckboxType?,
	sfBeneficialOwnerNullPEPStatusC: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredPostalCodeC: DataTypes.StringType?,
	sfBeneficialOwnerNullUSTaxIDTypeC: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredStreetAddressC: DataTypes.StringType?,
	sfBeneficialOwnerNullDateOfBirthC: DataTypes.StringType?,
	sfBeneficialOwnerNullLastTriggeredTimestampC: DataTypes.StringType?,
	sfBeneficialOwnerNullRiskRatingC: DataTypes.StringType?,
	sfBeneficialOwnerNullInvestorRegisteredCityC: DataTypes.StringType?,
	sfBeneficialOwnerNullSourceOfWealthC: DataTypes.StringType?,
	sfBeneficialOwnerNullAMLNotesC: DataTypes.StringType?,
	sfBeneficialOwnerNullMaxComplyIdC: DataTypes.StringType?,
	sfBeneficialOwnerNullBeneficialCountryC: DataTypes.StringType?,
	sfBeneficialOwnerNullCreatedById: DataTypes.StringType?,
	sfBeneficialOwnerNullGovernmentIDJurisdictionStateC: DataTypes.StringType?,
}?): FullTargetTableSfBeneficialownerFields
	local c = config or {}
	return {
		sfBeneficialOwnerNullWebsiteC = c.sfBeneficialOwnerNullWebsiteC,
		sfBeneficialOwnerNullNonUSTaxIDCountryC = c.sfBeneficialOwnerNullNonUSTaxIDCountryC,
		sfBeneficialOwnerNullTCGGlobalIdC = c.sfBeneficialOwnerNullTCGGlobalIdC,
		sfBeneficialOwnerNullLastModifiedById = c.sfBeneficialOwnerNullLastModifiedById,
		anduinBeneficialOwnerNullInvestorRegisteredFullAddress = c.anduinBeneficialOwnerNullInvestorRegisteredFullAddress,
		sfBeneficialOwnerNullFirstName = c.sfBeneficialOwnerNullFirstName,
		sfBeneficialOwnerNullName = c.sfBeneficialOwnerNullName,
		sfBeneficialOwnerNullInvestorRegisteredStateProvinceC = c.sfBeneficialOwnerNullInvestorRegisteredStateProvinceC,
		sfBeneficialOwnerNullUSTaxIDC = c.sfBeneficialOwnerNullUSTaxIDC,
		sfBeneficialOwnerNullOwnerId = c.sfBeneficialOwnerNullOwnerId,
		sfBeneficialOwnerNullMiddleNameC = c.sfBeneficialOwnerNullMiddleNameC,
		sfBeneficialOwnerNullInvestorRegisteredCountryC = c.sfBeneficialOwnerNullInvestorRegisteredCountryC,
		sfBeneficialOwnerNullAMLRefreshNotesC = c.sfBeneficialOwnerNullAMLRefreshNotesC,
		sfBeneficialOwnerNullGovernmentIssuedIDOnFileC = c.sfBeneficialOwnerNullGovernmentIssuedIDOnFileC,
		sfBeneficialOwnerNullAMLMonitoringC = c.sfBeneficialOwnerNullAMLMonitoringC,
		sfBeneficialOwnerNullIndividualOrganizationC = c.sfBeneficialOwnerNullIndividualOrganizationC,
		sfBeneficialOwnerNullCountryOfBirthC = c.sfBeneficialOwnerNullCountryOfBirthC,
		sfBeneficialOwnerNullPoliticallyExposedPersonC = c.sfBeneficialOwnerNullPoliticallyExposedPersonC,
		sfBeneficialOwnerNullPercentageOfOwnershipC = c.sfBeneficialOwnerNullPercentageOfOwnershipC,
		sfBeneficialOwnerNullGovernmentIDNumberC = c.sfBeneficialOwnerNullGovernmentIDNumberC,
		sfBeneficialOwnerNullGovernmentIDCountryC = c.sfBeneficialOwnerNullGovernmentIDCountryC,
		sfBeneficialOwnerNullGovernmentIDExpirationDateC = c.sfBeneficialOwnerNullGovernmentIDExpirationDateC,
		sfBeneficialOwnerNullIsActiveC = c.sfBeneficialOwnerNullIsActiveC,
		sfBeneficialOwnerNullNonUSTaxIDC = c.sfBeneficialOwnerNullNonUSTaxIDC,
		sfBeneficialOwnerNullLastName = c.sfBeneficialOwnerNullLastName,
		sfBeneficialOwnerNullBeneficialOwnerLongNameC = c.sfBeneficialOwnerNullBeneficialOwnerLongNameC,
		sfBeneficialOwnerNullKYCRefreshC = c.sfBeneficialOwnerNullKYCRefreshC,
		sfBeneficialOwnerNullPEPStatusC = c.sfBeneficialOwnerNullPEPStatusC,
		sfBeneficialOwnerNullInvestorRegisteredPostalCodeC = c.sfBeneficialOwnerNullInvestorRegisteredPostalCodeC,
		sfBeneficialOwnerNullUSTaxIDTypeC = c.sfBeneficialOwnerNullUSTaxIDTypeC,
		sfBeneficialOwnerNullInvestorRegisteredStreetAddressC = c.sfBeneficialOwnerNullInvestorRegisteredStreetAddressC,
		sfBeneficialOwnerNullDateOfBirthC = c.sfBeneficialOwnerNullDateOfBirthC,
		sfBeneficialOwnerNullLastTriggeredTimestampC = c.sfBeneficialOwnerNullLastTriggeredTimestampC,
		sfBeneficialOwnerNullRiskRatingC = c.sfBeneficialOwnerNullRiskRatingC,
		sfBeneficialOwnerNullInvestorRegisteredCityC = c.sfBeneficialOwnerNullInvestorRegisteredCityC,
		sfBeneficialOwnerNullSourceOfWealthC = c.sfBeneficialOwnerNullSourceOfWealthC,
		sfBeneficialOwnerNullAMLNotesC = c.sfBeneficialOwnerNullAMLNotesC,
		sfBeneficialOwnerNullMaxComplyIdC = c.sfBeneficialOwnerNullMaxComplyIdC,
		sfBeneficialOwnerNullBeneficialCountryC = c.sfBeneficialOwnerNullBeneficialCountryC,
		sfBeneficialOwnerNullCreatedById = c.sfBeneficialOwnerNullCreatedById,
		sfBeneficialOwnerNullGovernmentIDJurisdictionStateC = c.sfBeneficialOwnerNullGovernmentIDJurisdictionStateC,
	}
end

function FullTargetTable.makeFullTargetTableSfBeneficialownerType(config: {
	typeId: string?,
	valueSubFields: FullTargetTableSfBeneficialownerFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): FullTargetTableSfBeneficialownerType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function FullTargetTable.makeFullTargetTableSfContactFields(config: {
	sfContactNullMailingAddress: DataTypes.StringType?,
	sfContactNullAccountId: DataTypes.StringType?,
	sfContactNullOpBusinessPhoneC: DataTypes.StringType?,
	sfContactIFCWireApproverC: DataTypes.MultipleCheckboxType?,
	sfContactNullMailingStreet: DataTypes.StringType?,
	sfContactNullMailingState: DataTypes.StringType?,
	sfContactNullMailingPostalCode: DataTypes.StringType?,
	sfContactIFCTaxAdvisorC: DataTypes.MultipleCheckboxType?,
	sfContactIFCTaxInformationNotC: DataTypes.MultipleCheckboxType?,
	sfContactIFCCapitalCallManagementNotC: DataTypes.MultipleCheckboxType?,
	sfContactIFCLegalInformationNotC: DataTypes.MultipleCheckboxType?,
	sfContactNullMailingCity: DataTypes.StringType?,
	sfContactNullOpEmailPrimaryC: DataTypes.StringType?,
	sfContactIFCAMLKYCContactC: DataTypes.MultipleCheckboxType?,
	anduinContactRole: DataTypes.MultipleCheckboxType?,
	sfContactNullMiddleNameC: DataTypes.StringType?,
	sfContactNullName: DataTypes.StringType?,
	sfContactNullSalutation: DataTypes.StringType?,
	sfContactIFCNotificationsNotC: DataTypes.MultipleCheckboxType?,
	sfContactIFCDistributionManagementNotC: DataTypes.MultipleCheckboxType?,
	sfContactNullFirstName: DataTypes.StringType?,
	sfContactIFCFinanceContactC: DataTypes.MultipleCheckboxType?,
	sfContactIFCLegalAdvisorC: DataTypes.MultipleCheckboxType?,
	sfContactIFCPrimaryContactC: DataTypes.MultipleCheckboxType?,
	anduinContactNotification: DataTypes.MultipleCheckboxType?,
	sfContactIFCNotificationsC: DataTypes.MultipleCheckboxType?,
	sfContactNullEmailFundraising: DataTypes.StringType?,
	sfContactIFCFinancialReportingNotC: DataTypes.MultipleCheckboxType?,
	sfContactNullFax: DataTypes.StringType?,
	sfContactNullTCGGlobalIdC: DataTypes.StringType?,
	sfContactIFCSecondaryContactC: DataTypes.MultipleCheckboxType?,
	sfContactNullLastName: DataTypes.StringType?,
	sfContactNullMailingCountry: DataTypes.StringType?,
	sfContactNullBusinessPhone: DataTypes.StringType?,
}?): FullTargetTableSfContactFields
	local c = config or {}
	return {
		sfContactNullMailingAddress = c.sfContactNullMailingAddress,
		sfContactNullAccountId = c.sfContactNullAccountId,
		sfContactNullOpBusinessPhoneC = c.sfContactNullOpBusinessPhoneC,
		sfContactIFCWireApproverC = c.sfContactIFCWireApproverC,
		sfContactNullMailingStreet = c.sfContactNullMailingStreet,
		sfContactNullMailingState = c.sfContactNullMailingState,
		sfContactNullMailingPostalCode = c.sfContactNullMailingPostalCode,
		sfContactIFCTaxAdvisorC = c.sfContactIFCTaxAdvisorC,
		sfContactIFCTaxInformationNotC = c.sfContactIFCTaxInformationNotC,
		sfContactIFCCapitalCallManagementNotC = c.sfContactIFCCapitalCallManagementNotC,
		sfContactIFCLegalInformationNotC = c.sfContactIFCLegalInformationNotC,
		sfContactNullMailingCity = c.sfContactNullMailingCity,
		sfContactNullOpEmailPrimaryC = c.sfContactNullOpEmailPrimaryC,
		sfContactIFCAMLKYCContactC = c.sfContactIFCAMLKYCContactC,
		anduinContactRole = c.anduinContactRole,
		sfContactNullMiddleNameC = c.sfContactNullMiddleNameC,
		sfContactNullName = c.sfContactNullName,
		sfContactNullSalutation = c.sfContactNullSalutation,
		sfContactIFCNotificationsNotC = c.sfContactIFCNotificationsNotC,
		sfContactIFCDistributionManagementNotC = c.sfContactIFCDistributionManagementNotC,
		sfContactNullFirstName = c.sfContactNullFirstName,
		sfContactIFCFinanceContactC = c.sfContactIFCFinanceContactC,
		sfContactIFCLegalAdvisorC = c.sfContactIFCLegalAdvisorC,
		sfContactIFCPrimaryContactC = c.sfContactIFCPrimaryContactC,
		anduinContactNotification = c.anduinContactNotification,
		sfContactIFCNotificationsC = c.sfContactIFCNotificationsC,
		sfContactNullEmailFundraising = c.sfContactNullEmailFundraising,
		sfContactIFCFinancialReportingNotC = c.sfContactIFCFinancialReportingNotC,
		sfContactNullFax = c.sfContactNullFax,
		sfContactNullTCGGlobalIdC = c.sfContactNullTCGGlobalIdC,
		sfContactIFCSecondaryContactC = c.sfContactIFCSecondaryContactC,
		sfContactNullLastName = c.sfContactNullLastName,
		sfContactNullMailingCountry = c.sfContactNullMailingCountry,
		sfContactNullBusinessPhone = c.sfContactNullBusinessPhone,
	}
end

function FullTargetTable.makeFullTargetTableSfContactType(config: {
	typeId: string?,
	valueSubFields: FullTargetTableSfContactFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): FullTargetTableSfContactType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function FullTargetTable.makeFullTargetTableSfControllingpersonsFields(config: {
	sfControllingPersonsNullTINUnavailableC: DataTypes.StringType?,
	sfControllingPersonsNullMailingStateC: DataTypes.StringType?,
	sfControllingPersonsNullMailingCityC: DataTypes.StringType?,
	sfControllingPersonsNullDateOfBirthC: DataTypes.StringType?,
	sfControllingPersonsNullFirstNameC: DataTypes.StringType?,
	sfControllingPersonsNullSubscriptionInvestorC: DataTypes.StringType?,
	sfControllingPersonsNullCRSDocumentIDC: DataTypes.StringType?,
	sfControllingPersonsNullSubscriptionInvestorIDC: DataTypes.StringType?,
	sfControllingPersonsNullResidenceCountryC: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo5C: DataTypes.StringType?,
	sfControllingPersonsNullCountryOfBirthC: DataTypes.StringType?,
	sfControllingPersonsNullEffectiveDateC: DataTypes.StringType?,
	sfControllingPersonsNullMailingAddress2C: DataTypes.StringType?,
	sfControllingPersonsNullMailingCountryC: DataTypes.StringType?,
	sfControllingPersonsNullMiddleNameC: DataTypes.StringType?,
	sfControllingPersonsNullTINNo5C: DataTypes.StringType?,
	sfControllingPersonsNullMailingPostalCodeC: DataTypes.StringType?,
	sfControllingPersonsNullTINNo1C: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo3C: DataTypes.StringType?,
	sfControllingPersonsNullReportingCountriesC: DataTypes.StringType?,
	sfControllingPersonsNullResidencePostalCodeC: DataTypes.StringType?,
	sfControllingPersonsNullLastNameC: DataTypes.StringType?,
	sfControllingPersonsNullTypeC: DataTypes.StringType?,
	sfControllingPersonsNullResidenceStateC: DataTypes.StringType?,
	sfControllingPersonsNullType2C: DataTypes.StringType?,
	sfControllingPersonsNullTINNo4C: DataTypes.StringType?,
	sfControllingPersonsNullResidenceStreetC: DataTypes.StringType?,
	sfControllingPersonsNullControllingPersonPackageC: DataTypes.StringType?,
	sfControllingPersonsNullCRSReportingThresholdC: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo4C: DataTypes.StringType?,
	sfControllingPersonsNullTINNo2C: DataTypes.StringType?,
	sfControllingPersonsNullInactiveC: DataTypes.MultipleCheckboxType?,
	sfControllingPersonsNullResidenceCityC: DataTypes.StringType?,
	sfControllingPersonsNullType3C: DataTypes.StringType?,
	sfControllingPersonsNullTINNo3C: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo1C: DataTypes.StringType?,
	sfControllingPersonsNullPlaceOfBirthC: DataTypes.StringType?,
	sfControllingPersonsNullMailingStreetC: DataTypes.StringType?,
	sfControllingPersonsNullCRSValidationResultC: DataTypes.StringType?,
	sfControllingPersonsNullTINCountryNo2C: DataTypes.StringType?,
	sfControllingPersonsNullResidenceAddress2C: DataTypes.StringType?,
	sfControllingPersonsNullCRSStatusC: DataTypes.StringType?,
	sfControllingPersonsNullName: DataTypes.StringType?,
	sfControllingPersonsNullTaxStatusC: DataTypes.StringType?,
}?): FullTargetTableSfControllingpersonsFields
	local c = config or {}
	return {
		sfControllingPersonsNullTINUnavailableC = c.sfControllingPersonsNullTINUnavailableC,
		sfControllingPersonsNullMailingStateC = c.sfControllingPersonsNullMailingStateC,
		sfControllingPersonsNullMailingCityC = c.sfControllingPersonsNullMailingCityC,
		sfControllingPersonsNullDateOfBirthC = c.sfControllingPersonsNullDateOfBirthC,
		sfControllingPersonsNullFirstNameC = c.sfControllingPersonsNullFirstNameC,
		sfControllingPersonsNullSubscriptionInvestorC = c.sfControllingPersonsNullSubscriptionInvestorC,
		sfControllingPersonsNullCRSDocumentIDC = c.sfControllingPersonsNullCRSDocumentIDC,
		sfControllingPersonsNullSubscriptionInvestorIDC = c.sfControllingPersonsNullSubscriptionInvestorIDC,
		sfControllingPersonsNullResidenceCountryC = c.sfControllingPersonsNullResidenceCountryC,
		sfControllingPersonsNullTINCountryNo5C = c.sfControllingPersonsNullTINCountryNo5C,
		sfControllingPersonsNullCountryOfBirthC = c.sfControllingPersonsNullCountryOfBirthC,
		sfControllingPersonsNullEffectiveDateC = c.sfControllingPersonsNullEffectiveDateC,
		sfControllingPersonsNullMailingAddress2C = c.sfControllingPersonsNullMailingAddress2C,
		sfControllingPersonsNullMailingCountryC = c.sfControllingPersonsNullMailingCountryC,
		sfControllingPersonsNullMiddleNameC = c.sfControllingPersonsNullMiddleNameC,
		sfControllingPersonsNullTINNo5C = c.sfControllingPersonsNullTINNo5C,
		sfControllingPersonsNullMailingPostalCodeC = c.sfControllingPersonsNullMailingPostalCodeC,
		sfControllingPersonsNullTINNo1C = c.sfControllingPersonsNullTINNo1C,
		sfControllingPersonsNullTINCountryNo3C = c.sfControllingPersonsNullTINCountryNo3C,
		sfControllingPersonsNullReportingCountriesC = c.sfControllingPersonsNullReportingCountriesC,
		sfControllingPersonsNullResidencePostalCodeC = c.sfControllingPersonsNullResidencePostalCodeC,
		sfControllingPersonsNullLastNameC = c.sfControllingPersonsNullLastNameC,
		sfControllingPersonsNullTypeC = c.sfControllingPersonsNullTypeC,
		sfControllingPersonsNullResidenceStateC = c.sfControllingPersonsNullResidenceStateC,
		sfControllingPersonsNullType2C = c.sfControllingPersonsNullType2C,
		sfControllingPersonsNullTINNo4C = c.sfControllingPersonsNullTINNo4C,
		sfControllingPersonsNullResidenceStreetC = c.sfControllingPersonsNullResidenceStreetC,
		sfControllingPersonsNullControllingPersonPackageC = c.sfControllingPersonsNullControllingPersonPackageC,
		sfControllingPersonsNullCRSReportingThresholdC = c.sfControllingPersonsNullCRSReportingThresholdC,
		sfControllingPersonsNullTINCountryNo4C = c.sfControllingPersonsNullTINCountryNo4C,
		sfControllingPersonsNullTINNo2C = c.sfControllingPersonsNullTINNo2C,
		sfControllingPersonsNullInactiveC = c.sfControllingPersonsNullInactiveC,
		sfControllingPersonsNullResidenceCityC = c.sfControllingPersonsNullResidenceCityC,
		sfControllingPersonsNullType3C = c.sfControllingPersonsNullType3C,
		sfControllingPersonsNullTINNo3C = c.sfControllingPersonsNullTINNo3C,
		sfControllingPersonsNullTINCountryNo1C = c.sfControllingPersonsNullTINCountryNo1C,
		sfControllingPersonsNullPlaceOfBirthC = c.sfControllingPersonsNullPlaceOfBirthC,
		sfControllingPersonsNullMailingStreetC = c.sfControllingPersonsNullMailingStreetC,
		sfControllingPersonsNullCRSValidationResultC = c.sfControllingPersonsNullCRSValidationResultC,
		sfControllingPersonsNullTINCountryNo2C = c.sfControllingPersonsNullTINCountryNo2C,
		sfControllingPersonsNullResidenceAddress2C = c.sfControllingPersonsNullResidenceAddress2C,
		sfControllingPersonsNullCRSStatusC = c.sfControllingPersonsNullCRSStatusC,
		sfControllingPersonsNullName = c.sfControllingPersonsNullName,
		sfControllingPersonsNullTaxStatusC = c.sfControllingPersonsNullTaxStatusC,
	}
end

function FullTargetTable.makeFullTargetTableSfControllingpersonsType(config: {
	typeId: string?,
	valueSubFields: FullTargetTableSfControllingpersonsFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): FullTargetTableSfControllingpersonsType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function FullTargetTable.makeFullTargetTableSfFundSelectionFields(config: {
	SubFundGlobalId: DataTypes.StringType?,
	CommitmentAmount: DataTypes.StringType?,
}?): FullTargetTableSfFundSelectionFields
	local c = config or {}
	return {
		SubFundGlobalId = c.SubFundGlobalId,
		CommitmentAmount = c.CommitmentAmount,
	}
end

function FullTargetTable.makeFullTargetTableSfFundSelectionType(config: {
	typeId: string?,
	valueSubFields: FullTargetTableSfFundSelectionFields?,
	subFieldKeysInOrder: {string}?,
	label: string?,
}?): FullTargetTableSfFundSelectionType
	local c = config or {}
	return {
		typeId = c.typeId or "",
		valueSubFields = c.valueSubFields,
		subFieldKeysInOrder = c.subFieldKeysInOrder or {},
		label = c.label,
	}
end

function FullTargetTable.makeFullTargetTableFieldsMap(config: {
	sfInvestorAccountNullTCGGlobalIdC: DataTypes.StringType?,
	sfFundSelection: {FullTargetTableSfFundSelectionType}?,
	sfAccountInvestorAccountTCGGlobalIdC: DataTypes.StringType?,
	sfAccountCommonNameName: DataTypes.StringType?,
	sfAccountCommonNameTypeC: DataTypes.StringType?,
	sfAccountCommonNameIndustry: DataTypes.StringType?,
	sfAccountCommonNameBeneficialCountryFormulaC: DataTypes.StringType?,
	sfAccountCommonNameTCGGlobalIdC: DataTypes.StringType?,
	sfAccountCommonNameAccountTeamMembersC: DataTypes.StringType?,
	sfAccountCommonNameDescription: DataTypes.StringType?,
	sfAccountCommonNameBillingAddress: DataTypes.StringType?,
	sfAccountCommonNameShippingAddress: DataTypes.StringType?,
	sfAccountCommonNamePhone: DataTypes.StringType?,
	sfAccountCommonNameWebsite: DataTypes.StringType?,
	sfAccountCommonNameRecordTypeId: DataTypes.StringType?,
	sfAccountSubscriptionInvestorName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorType: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCTradeNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCommonNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPhone: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingCountry: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingStreet: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingCity: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingState: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBillingPostalCode: DataTypes.StringType?,
	anduinAccountSubscriptionInvestorBillingFullAddress: DataTypes.StringType?,
	sfAccountSubscriptionInvestorParentId: DataTypes.StringType?,
	sfAccountSubscriptionInvestorParentTypeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCOccupationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCTitleC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCEmployerNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCSubscribingAsARepresentativeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWLCSubscribingAsRepresentativeDetailsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorIndustry: DataTypes.StringType?,
	sfAccountSubscriptionInvestorDomesticForeignC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCitizenshipC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTCGGlobalIdC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorHasCarlyleOnboardingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorHasSolutionsOnboardingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorDisregardedEntityC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIndividualOrganizationC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxCountryJurisdictionC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorStateOfTaxResidenceC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLInvestorTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLAddressCityC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLAddressStateProvinceC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBeneficialOwnerTypeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLAddressCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBeneficialCountryFormulaC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorRegulatedEntityC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorRiskRatingC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBrokerDealerC: DataTypes.MultipleCheckboxType?,
	anduinAccountSubscriptionInvestorBrokerDealerC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorRiskRating3NotesC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBankNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBankLocationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorRiskCommitteeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorFINRARetailInvestorC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorLuxTaxAssessmentRatingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWebsite: DataTypes.StringType?,
	sfAccountSubscriptionInvestorHighRiskJurisdictionC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorEligibleIntroducerLetterCertificateC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorMediumHighRiskJurisdictionC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIntroducerLetterCertificateCommentsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorNomineeIntermediaryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLPreClearanceC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorHighRiskIndustryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLPreClearanceFundsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorComplexStructureC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTypeOfBlockC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorNegativeNewsC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAccountBlockingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorBearerSharesC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAccountBlockingDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorShellBankC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAccountBlockingRemovedDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPoliticallyExposedPersonPEPC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLReviewCycleC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPEPStatusDetailsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorNextAMLReviewDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPEPStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorMarketingMethodC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorSourceOfWealthCategoryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorMarketingDetailsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSourceOfWealthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorMiFIDClientCategoryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorSourceOfFundsCategoryC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorSourceOfFundsDetailsC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSoWSoFCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorLegalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorHighRiskFactorsC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAwarenessNexusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLNotesC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorApprovalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorNameChangeApprovalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAMLApproverC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorFMApproverC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorFormTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorFMTaxIdC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorEquityTaxIdC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTaxEntityTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorFATCAStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorUSTINTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWithholdingForeignPartnershipEINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTaxResidencyCertificatesC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSponsoringEntityGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorW9OtherEntityTypeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAccountOpeningDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorJointAccountNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTreatyCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCountryOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCitizenshipCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCountryOfIncorporationFormationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorExemptPayeeCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorDateOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorBranchGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorGIINStatusDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorGIINStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedForeignPensionFundQFPFC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxReportingByAlpInvestC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxAccountOwnerC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingStreetC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingCityC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingStateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingPostalCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOBillingStreet2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOTaxStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOCitizenshipCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOCountryOfIncorporationFormationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOUSTaxIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOIndividualOrOrganizationC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOUSTINTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOInvestorForeignDomesticC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAONonUSTaxIDCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOForeignTaxIdC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWithholdingForeignPartnershipEINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAODateOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOTaxCountryJurisdictionC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOExemptPayeeCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingStreetC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingCityC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOInvestorMailingStateProvinceC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingPostalCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOShippingStreet2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOTaxFormTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOBranchGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOCountryOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFATCAClassificationC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOSponsoringEntityGIINC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOW9OtherEntityTypeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFirstNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOLastNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOMiddleNameC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFATCAStatusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOExemptionFromFATCAWithholdingCodC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorIdentificationAsASpecifiedUKPersonC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCDOTEntityAccountHolderStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAffiliatedCorporationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorReportableUKPersonC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorReportableGGYJEYGIBIOMPersonC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCRSClassificationC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorRelatedEntityC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorPlaceOfBirthC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorDateOfOrganizationFormationDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorEffectiveDateOfSelfCertificationC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorNameOfSecuritiesMarketC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorStatusOfCRSReviewC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorReportableNonReportableAccountC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC: DataTypes.MultipleCheckboxType?,
	anduinAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorReportingCountriesC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINUnavailableC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo1C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo1C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo3C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo3C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo4C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo4C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINCountryNo5C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTINNo5C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorRegisteredAddress2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorMailingAddress2C: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAccreditedInvestorStatusEntitiesC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorAccreditedInvestorStatusIndividualC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorGovernmentIssuedIDOnFileC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorGovernmentIDExpirationDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorExpirationOfRestrictiveCovenantPerioC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorIsCapitalShareholderControlledC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsIndivRetirementBenefitPlanC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsBHCC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIndividualRetirementAccountIRAC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedPurchaserC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedInvestorStatusEntityC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedClientStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorQualifiedInvestorStatusIndividualC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsJapaneseResC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsFIELQualifiedC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsArticle63AppliedC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorEUElectiveProfessionalClientC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorDescription: DataTypes.StringType?,
	sfAccountSubscriptionInvestorUBSEscrowAccountC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorMSSBIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorMRORC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorIsUSTaxExemptC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorIsSection115Entity: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorOwnerIsUSTaxExempt: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTreatedAsTaxExemptLP: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTaxExemptSubtypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorExemptFromStateAndLocalIncomeTaxC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWHRateOIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWHRateECIC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWHRateFATCAC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorRecordTypeId: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAccountStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWLCRegulatorC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCExchangeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCTickerSymbolC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC: DataTypes.MultipleCheckboxType?,
	anduinAccountSubscriptionInvestorSignerFirstName: DataTypes.StringType?,
	anduinAccountSubscriptionInvestorSignerMiddleName: DataTypes.StringType?,
	anduinAccountSubscriptionInvestorSignerLastName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSignerFirstName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSignerMiddleName: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSignerLastName: DataTypes.StringType?,
	sfAgreementOnboardingNameC: DataTypes.StringType?,
	sfAgreementOnboardingStatusC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingTypeC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingCommonSubscriptionEntityC: DataTypes.StringType?,
	sfAgreementOnboardingSubscriptionInvestorApprovalStatusC: DataTypes.StringType?,
	sfAgreementOnboardingAccountC: DataTypes.StringType?,
	sfAgreementOnboardingRelatedCommonNameC: DataTypes.StringType?,
	sfAgreementOnboardingSIIndividualOrOrganizationC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorForeignDomesticC: DataTypes.StringType?,
	sfAgreementOnboardingOriginalCompletedDateC: DataTypes.StringType?,
	sfAgreementOnboardingParentAgreementIdC: DataTypes.StringType?,
	sfAgreementOnboardingCommitmentTypeC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingInvestorFundC: DataTypes.StringType?,
	sfAgreementOnboardingOpportunityC: DataTypes.StringType?,
	sfAgreementOnboardingFundC: DataTypes.StringType?,
	sfAgreementOnboardingCurrencyC: DataTypes.StringType?,
	sfAgreementOnboardingFundCloseC: DataTypes.StringType?,
	sfAgreementOnboardingPartnershipC: DataTypes.StringType?,
	sfAgreementOnboardingRequestedCommitmentAmountC: DataTypes.StringType?,
	sfAgreementOnboardingCommitmentC: DataTypes.StringType?,
	sfAgreementOnboardingUSDAmountC: DataTypes.StringType?,
	sfAgreementOnboardingEffectiveDateC: DataTypes.StringType?,
	sfAgreementOnboardingInvestranVehicleTypeC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingRelatedAgreementsGroupC: DataTypes.StringType?,
	sfAgreementOnboardingAssociatedLegalEntitiesC: DataTypes.StringType?,
	sfAgreementOnboardingAgreementLegalEntitiesExternalIdsC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredCountryC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredStreetAddressC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredCityC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredStateProvinceC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredPostalCodeC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorRegisteredAddress2C: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingCountryC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingStreetC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingCityC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingStateProvinceC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingZipPostalCodeC: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestorMailingAddress2C: DataTypes.StringType?,
	sfAgreementOnboardingSIUSTaxpayerIdentificationNumberC: DataTypes.StringType?,
	sfAgreementOnboardingSIUSTINTypeC: DataTypes.StringType?,
	sfAgreementOnboardingSITaxStatusC: DataTypes.StringType?,
	sfAgreementOnboardingSITaxCountryJurisdictionC: DataTypes.StringType?,
	sfAgreementOnboardingSIFATCAClassificationC: DataTypes.StringType?,
	sfAgreementOnboardingSINonUSTaxIDC: DataTypes.StringType?,
	sfAgreementOnboardingSINonUSTaxIDCountryC: DataTypes.StringType?,
	sfAgreementOnboardingSICitizenshipCountryC: DataTypes.StringType?,
	sfAgreementOnboardingSICountryOfIncorporationFormationC: DataTypes.StringType?,
	sfAgreementOnboardingSICountryOfBirthC: DataTypes.StringType?,
	sfAgreementOnboardingSIDateOfBirthC: DataTypes.StringType?,
	sfAgreementOnboardingSIExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfAgreementOnboardingSIExemptPayeeCodeC: DataTypes.StringType?,
	sfAgreementOnboardingSIGIINC: DataTypes.StringType?,
	sfAgreementOnboardingSIBranchGIINC: DataTypes.StringType?,
	sfAgreementOnboardingX892CAIC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingX892CAITextC: DataTypes.StringType?,
	sfAgreementOnboardingTaxExemptStatusNotesC: DataTypes.StringType?,
	sfAgreementOnboardingERISAPartnerC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIsERISATitleIC: DataTypes.MultipleCheckboxType?,
	anduinAgreementOnboardingIsERISATitleIC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSIDisregardedGPOfGPC: DataTypes.StringType?,
	sfAgreementOnboardingSIQualifiedInstitutionalInvestorFIELC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSIFundingParentSubEntityC: DataTypes.StringType?,
	sfAgreementOnboardingSIArticle63Paragraph1AppliesC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSIFundingSiloC: DataTypes.StringType?,
	sfAgreementOnboardingNewCommitmentOrTransferC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingConfirmationOfInvestmentOnOwnBehalfC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingInvestorTypeC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingLuxTaxAssessmentC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingInvestingInLuxFundsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingLuxTaxAssessmentScoreC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSourceOfFundsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingEvidenceOfExistenceC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSourceOfWealthC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingEvidenceOfCorporateAuthorityC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSourceOfWealthDetailsC: DataTypes.StringType?,
	sfAgreementOnboardingSignedStructureChartC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingListOfLegalRepsAndDirectorsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingEvidenceOfEachTierOfTheStructureC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIdentificationOfAuthorizedSignatoriesC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIdentificationOfUBOsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingFinCENControlPersonC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingWorldCheckResultsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingControlPersonJurisdictionC: DataTypes.StringType?,
	sfAgreementOnboardingWorldCheckDetailsC: DataTypes.StringType?,
	sfAgreementOnboardingExceptionsWaiversC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingApprovalForHighRiskOrPEPC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingExceptionsWaiversDetailsC: DataTypes.StringType?,
	sfAgreementOnboardingAnalystC: DataTypes.StringType?,
	sfAgreementOnboardingKYCSatisfactoryC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingAMLReviewInitiatedC: DataTypes.StringType?,
	sfAgreementOnboardingPostCloseDetailsC: DataTypes.StringType?,
	sfAgreementOnboardingAMLClearanceDateC: DataTypes.StringType?,
	sfAgreementOnboardingPostCloseFollowUpDateC: DataTypes.StringType?,
	sfAgreementOnboardingAMLNotesC: DataTypes.StringType?,
	sfAgreementOnboardingAMLApprovalDateC: DataTypes.StringType?,
	sfAgreementOnboardingEligibleIntroducerLetterCertificateC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingExternalAccountNumberC: DataTypes.StringType?,
	sfAgreementOnboardingCommentsC: DataTypes.StringType?,
	sfAgreementOnboardingExternalAccountInstitutionC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingAMLDataApprovedC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingAMLApproverC: DataTypes.StringType?,
	sfAgreementOnboardingAMLApprovedC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingFMApprovedC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSkipAMLApprovalsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIFStatusC: DataTypes.StringType?,
	sfAgreementOnboardingRecordTypeId: DataTypes.StringType?,
	sfAgreementOnboardingSIInvestingAssetsOfAnyRetirementPlC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIsInvestorControllingC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingIsERISAFOIAC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingSIQualifiedInvestorStatusEntityC: DataTypes.MultipleCheckboxType?,
	anduinAgreementOnboardingSignerFirstName: DataTypes.StringType?,
	anduinAgreementOnboardingSignerMiddleName: DataTypes.StringType?,
	anduinAgreementOnboardingSignerLastName: DataTypes.StringType?,
	sfAgreementOnboardingSignerFirstName: DataTypes.StringType?,
	sfAgreementOnboardingSignerMiddleName: DataTypes.StringType?,
	sfAgreementOnboardingSignerLastName: DataTypes.StringType?,
	sfAgreementNullTCGGlobalIdC: DataTypes.StringType?,
	sfAgreementNullCommitmentC: DataTypes.StringType?,
	anduinAgreementNullSignerFirstName: DataTypes.StringType?,
	anduinAgreementNullSignerMiddleName: DataTypes.StringType?,
	anduinAgreementNullSignerLastName: DataTypes.StringType?,
	sfAgreementNullSignerFirstName: DataTypes.StringType?,
	sfAgreementNullSignerMiddleName: DataTypes.StringType?,
	sfAgreementNullSignerLastName: DataTypes.StringType?,
	sfAgreementNullWLCInternationalSupplementsC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullReceiveUnappliedBalanceReductionAmtC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullIsNotIRCUSPerson: DataTypes.MultipleCheckboxType?,
	sfAgreementNullOwnerIsNotIRCUSPerson: DataTypes.MultipleCheckboxType?,
	sfAgreementNullTreatedAsNonUSLP: DataTypes.MultipleCheckboxType?,
	sfAgreementNullECIC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullUBTIC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullUSRPHCC: DataTypes.MultipleCheckboxType?,
	sfAgreementNullWLC894EligibleC: DataTypes.MultipleCheckboxType?,
	sfFundFundPrivateEquityRealAssetName: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetProductNameC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundLegalNameC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundAbbreviationC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetStatusC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundStatusC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetInactiveDateC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetVintageYearC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetInvestorDiscretionC: DataTypes.MultipleCheckboxType?,
	sfFundFundPrivateEquityRealAssetFundStrategyDescriptionC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetPartOfProgramC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetPRACoverageC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetAIFMDC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetMandateBackgroundC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetCarlyleNotResponsibleForAMLKYCC: DataTypes.MultipleCheckboxType?,
	sfFundFundPrivateEquityRealAssetFundTypeC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetProductLineC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetProductTypeC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundFamilyC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundFocusC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetRegionC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetStructureC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetCurrencyC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundFocusAdditionalInfoC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFundSpecificParagraphC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetManagedAccountDirectInvestmentsC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetClosingDateC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFinalClosingDateC: DataTypes.StringType?,
	sfFundFundPrivateEquityRealAssetFinalClosingDatePerLPAC: DataTypes.StringType?,
	sfFundFundCloseName: DataTypes.StringType?,
	sfFundFundCloseFundC: DataTypes.StringType?,
	sfFundFundCloseCloseDateC: DataTypes.StringType?,
	sfFundFundCloseRecordTypeId: DataTypes.StringType?,
	sfFundNullTCGGlobalIdC: DataTypes.StringType?,
	sfBeneficialOwner: {FullTargetTableSfBeneficialownerType}?,
	sfControllingPersons: {FullTargetTableSfControllingpersonsType}?,
	sfIFCNullEmailC: DataTypes.StringType?,
	sfIFCNullStatusC: DataTypes.StringType?,
	sfIFCNullCommonNameC: DataTypes.StringType?,
	sfIFCNullInvestorClassificationC: DataTypes.StringType?,
	sfIFCNullBeneficialCountryC: DataTypes.StringType?,
	sfIFCNullDateOfBirthC: DataTypes.StringType?,
	sfIFCNullIndividualOrOrganizationC: DataTypes.StringType?,
	sfIFCNullFullAddressC: DataTypes.StringType?,
	sfIFCNullCreatedById: DataTypes.StringType?,
	sfIFCNullName: DataTypes.StringType?,
	sfIFCNullLastModifiedById: DataTypes.StringType?,
	sfIFCNullExternalIDC: DataTypes.StringType?,
	sfIFCNullRecordTypeId: DataTypes.StringType?,
	sfIFCNullContactCountryC: DataTypes.StringType?,
	sfIFCNullContactIDC: DataTypes.StringType?,
	sfIFCNullContactNameC: DataTypes.StringType?,
	sfIFCNullContactRecordTypeNameC: DataTypes.StringType?,
	sfIFCNullContactTCGGlobalIDC: DataTypes.StringType?,
	sfIFCNullContactSCNRegisteredCountryC: DataTypes.StringType?,
	sfContact: {FullTargetTableSfContactType}?,
	sfTaxFormW9TaxAccountOwner: DataTypes.StringType?,
	sfTaxFormW9DisregardedEntityName: DataTypes.StringType?,
	sfTaxFormW9TAOTaxAccountOwner: DataTypes.StringType?,
	sfTaxFormW9TaxStatusC: DataTypes.MultipleCheckboxType?,
	sfTaxFormW9TAOTaxStatusC: DataTypes.MultipleCheckboxType?,
	sfTaxFormW9TaxEntityTypeC: DataTypes.StringType?,
	sfTaxFormW9ExemptPayeeCodeC: DataTypes.StringType?,
	sfTaxFormW9ExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfTaxFormW9TAOExemptPayeeCodeC: DataTypes.StringType?,
	sfTaxFormW9TAOExemptionFromFATCAReportingCodeC: DataTypes.StringType?,
	sfTaxFormW9BillingStreet: DataTypes.StringType?,
	sfTaxFormW9BillingCity: DataTypes.StringType?,
	sfTaxFormW9BillingState: DataTypes.StringType?,
	sfTaxFormW9BillingPostalCode: DataTypes.StringType?,
	sfTaxFormW9BillingCountry: DataTypes.StringType?,
	sfTaxFormW9TAOBillingStreetC: DataTypes.StringType?,
	sfTaxFormW9TAOBillingCityC: DataTypes.StringType?,
	sfTaxFormW9TAOBillingStateC: DataTypes.StringType?,
	sfTaxFormW9TAOBillingPostalCodeC: DataTypes.StringType?,
	sfTaxFormW9TAOBillingCountryC: DataTypes.StringType?,
	sfTaxFormW9FMTaxIdC: DataTypes.StringType?,
	sfTaxFormW9USTINTypeC: DataTypes.MultipleCheckboxType?,
	sfTaxFormW9TAOUSTaxIDC: DataTypes.StringType?,
	sfTaxFormW9TAOUSTINTypeC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorWHRateExpirationDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorValidationResultC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorEffectiveDateOfTaxFormStatusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorEffectiveDateOfFATCAStatusAndRateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSubjectToFATCAWithholdingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorStatusOfFATCAReviewC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorFATCAMonitoredC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorLimitationOfBenefitsOtherC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorLimitationOfBenefitsC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOGlobalIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOTaxIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOStatusOfFATCAReviewC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOSubjectToFATCAWithholdingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOTaxApprovalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOTaxFormStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOTreatyCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRateFIRPTAIncomeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRateInterestIncomeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRatePrivateDividendC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOWHRatePublicDividendC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOGIINStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAODemographicApprovalStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOGIINStatusDateC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOEffectiveDateFATCACompletedStatusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOEffectiveDateOfTaxFormStatusC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOLimitationOfBenefitsOtherC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFATCAMonitoredC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOBeneficialCountryC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOEW8StatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOClientIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOFATCADocumentIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorTAOValidationResultC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCRSStatusC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorCRSDocumentIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorCRSValidationResultC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorFATCADocumentIDC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorSExemptionCodeC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorStateExemptCertificationProvidedC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorDateStateExemptCertificateProvidedC: DataTypes.StringType?,
	sfAccountSubscriptionInvestorAMLRefreshStatusC: DataTypes.MultipleCheckboxType?,
	sfIFCNullHideIFCFromContactSelfServicingC: DataTypes.MultipleCheckboxType?,
	sfAccountSubscriptionInvestorTAOLimitationOfBenefitsC: DataTypes.MultipleCheckboxType?,
	sfAgreementOnboardingInitialAdditional: DataTypes.MultipleCheckboxType?,
}?): FullTargetTableFieldsMap
	local c = config or {}
	return {
		sfInvestorAccountNullTCGGlobalIdC = c.sfInvestorAccountNullTCGGlobalIdC,
		sfFundSelection = c.sfFundSelection or {},
		sfAccountInvestorAccountTCGGlobalIdC = c.sfAccountInvestorAccountTCGGlobalIdC,
		sfAccountCommonNameName = c.sfAccountCommonNameName,
		sfAccountCommonNameTypeC = c.sfAccountCommonNameTypeC,
		sfAccountCommonNameIndustry = c.sfAccountCommonNameIndustry,
		sfAccountCommonNameBeneficialCountryFormulaC = c.sfAccountCommonNameBeneficialCountryFormulaC,
		sfAccountCommonNameTCGGlobalIdC = c.sfAccountCommonNameTCGGlobalIdC,
		sfAccountCommonNameAccountTeamMembersC = c.sfAccountCommonNameAccountTeamMembersC,
		sfAccountCommonNameDescription = c.sfAccountCommonNameDescription,
		sfAccountCommonNameBillingAddress = c.sfAccountCommonNameBillingAddress,
		sfAccountCommonNameShippingAddress = c.sfAccountCommonNameShippingAddress,
		sfAccountCommonNamePhone = c.sfAccountCommonNamePhone,
		sfAccountCommonNameWebsite = c.sfAccountCommonNameWebsite,
		sfAccountCommonNameRecordTypeId = c.sfAccountCommonNameRecordTypeId,
		sfAccountSubscriptionInvestorName = c.sfAccountSubscriptionInvestorName,
		sfAccountSubscriptionInvestorType = c.sfAccountSubscriptionInvestorType,
		sfAccountSubscriptionInvestorWLCTradeNameC = c.sfAccountSubscriptionInvestorWLCTradeNameC,
		sfAccountSubscriptionInvestorCommonNameC = c.sfAccountSubscriptionInvestorCommonNameC,
		sfAccountSubscriptionInvestorPhone = c.sfAccountSubscriptionInvestorPhone,
		sfAccountSubscriptionInvestorBillingCountry = c.sfAccountSubscriptionInvestorBillingCountry,
		sfAccountSubscriptionInvestorBillingStreet = c.sfAccountSubscriptionInvestorBillingStreet,
		sfAccountSubscriptionInvestorBillingCity = c.sfAccountSubscriptionInvestorBillingCity,
		sfAccountSubscriptionInvestorBillingState = c.sfAccountSubscriptionInvestorBillingState,
		sfAccountSubscriptionInvestorBillingPostalCode = c.sfAccountSubscriptionInvestorBillingPostalCode,
		anduinAccountSubscriptionInvestorBillingFullAddress = c.anduinAccountSubscriptionInvestorBillingFullAddress,
		sfAccountSubscriptionInvestorParentId = c.sfAccountSubscriptionInvestorParentId,
		sfAccountSubscriptionInvestorParentTypeC = c.sfAccountSubscriptionInvestorParentTypeC,
		sfAccountSubscriptionInvestorWLCOccupationC = c.sfAccountSubscriptionInvestorWLCOccupationC,
		sfAccountSubscriptionInvestorWLCTitleC = c.sfAccountSubscriptionInvestorWLCTitleC,
		sfAccountSubscriptionInvestorWLCEmployerNameC = c.sfAccountSubscriptionInvestorWLCEmployerNameC,
		sfAccountSubscriptionInvestorWLCSubscribingAsARepresentativeC = c.sfAccountSubscriptionInvestorWLCSubscribingAsARepresentativeC,
		sfAccountSubscriptionInvestorWLCSubscribingAsRepresentativeDetailsC = c.sfAccountSubscriptionInvestorWLCSubscribingAsRepresentativeDetailsC,
		sfAccountSubscriptionInvestorIndustry = c.sfAccountSubscriptionInvestorIndustry,
		sfAccountSubscriptionInvestorDomesticForeignC = c.sfAccountSubscriptionInvestorDomesticForeignC,
		sfAccountSubscriptionInvestorCitizenshipC = c.sfAccountSubscriptionInvestorCitizenshipC,
		sfAccountSubscriptionInvestorTCGGlobalIdC = c.sfAccountSubscriptionInvestorTCGGlobalIdC,
		sfAccountSubscriptionInvestorHasCarlyleOnboardingC = c.sfAccountSubscriptionInvestorHasCarlyleOnboardingC,
		sfAccountSubscriptionInvestorHasSolutionsOnboardingC = c.sfAccountSubscriptionInvestorHasSolutionsOnboardingC,
		sfAccountSubscriptionInvestorDisregardedEntityC = c.sfAccountSubscriptionInvestorDisregardedEntityC,
		sfAccountSubscriptionInvestorIndividualOrganizationC = c.sfAccountSubscriptionInvestorIndividualOrganizationC,
		sfAccountSubscriptionInvestorTaxCountryJurisdictionC = c.sfAccountSubscriptionInvestorTaxCountryJurisdictionC,
		sfAccountSubscriptionInvestorStateOfTaxResidenceC = c.sfAccountSubscriptionInvestorStateOfTaxResidenceC,
		sfAccountSubscriptionInvestorAMLInvestorTypeC = c.sfAccountSubscriptionInvestorAMLInvestorTypeC,
		sfAccountSubscriptionInvestorAMLAddressCityC = c.sfAccountSubscriptionInvestorAMLAddressCityC,
		sfAccountSubscriptionInvestorAMLAddressStateProvinceC = c.sfAccountSubscriptionInvestorAMLAddressStateProvinceC,
		sfAccountSubscriptionInvestorBeneficialOwnerTypeC = c.sfAccountSubscriptionInvestorBeneficialOwnerTypeC,
		sfAccountSubscriptionInvestorAMLAddressCountryC = c.sfAccountSubscriptionInvestorAMLAddressCountryC,
		sfAccountSubscriptionInvestorBeneficialCountryFormulaC = c.sfAccountSubscriptionInvestorBeneficialCountryFormulaC,
		sfAccountSubscriptionInvestorRegulatedEntityC = c.sfAccountSubscriptionInvestorRegulatedEntityC,
		sfAccountSubscriptionInvestorRiskRatingC = c.sfAccountSubscriptionInvestorRiskRatingC,
		sfAccountSubscriptionInvestorBrokerDealerC = c.sfAccountSubscriptionInvestorBrokerDealerC,
		anduinAccountSubscriptionInvestorBrokerDealerC = c.anduinAccountSubscriptionInvestorBrokerDealerC,
		sfAccountSubscriptionInvestorRiskRating3NotesC = c.sfAccountSubscriptionInvestorRiskRating3NotesC,
		sfAccountSubscriptionInvestorBankNameC = c.sfAccountSubscriptionInvestorBankNameC,
		sfAccountSubscriptionInvestorBankLocationC = c.sfAccountSubscriptionInvestorBankLocationC,
		sfAccountSubscriptionInvestorRiskCommitteeC = c.sfAccountSubscriptionInvestorRiskCommitteeC,
		sfAccountSubscriptionInvestorFINRARetailInvestorC = c.sfAccountSubscriptionInvestorFINRARetailInvestorC,
		sfAccountSubscriptionInvestorLuxTaxAssessmentRatingC = c.sfAccountSubscriptionInvestorLuxTaxAssessmentRatingC,
		sfAccountSubscriptionInvestorWebsite = c.sfAccountSubscriptionInvestorWebsite,
		sfAccountSubscriptionInvestorHighRiskJurisdictionC = c.sfAccountSubscriptionInvestorHighRiskJurisdictionC,
		sfAccountSubscriptionInvestorEligibleIntroducerLetterCertificateC = c.sfAccountSubscriptionInvestorEligibleIntroducerLetterCertificateC,
		sfAccountSubscriptionInvestorMediumHighRiskJurisdictionC = c.sfAccountSubscriptionInvestorMediumHighRiskJurisdictionC,
		sfAccountSubscriptionInvestorIntroducerLetterCertificateCommentsC = c.sfAccountSubscriptionInvestorIntroducerLetterCertificateCommentsC,
		sfAccountSubscriptionInvestorNomineeIntermediaryC = c.sfAccountSubscriptionInvestorNomineeIntermediaryC,
		sfAccountSubscriptionInvestorAMLPreClearanceC = c.sfAccountSubscriptionInvestorAMLPreClearanceC,
		sfAccountSubscriptionInvestorHighRiskIndustryC = c.sfAccountSubscriptionInvestorHighRiskIndustryC,
		sfAccountSubscriptionInvestorAMLPreClearanceFundsC = c.sfAccountSubscriptionInvestorAMLPreClearanceFundsC,
		sfAccountSubscriptionInvestorComplexStructureC = c.sfAccountSubscriptionInvestorComplexStructureC,
		sfAccountSubscriptionInvestorTypeOfBlockC = c.sfAccountSubscriptionInvestorTypeOfBlockC,
		sfAccountSubscriptionInvestorNegativeNewsC = c.sfAccountSubscriptionInvestorNegativeNewsC,
		sfAccountSubscriptionInvestorAccountBlockingC = c.sfAccountSubscriptionInvestorAccountBlockingC,
		sfAccountSubscriptionInvestorBearerSharesC = c.sfAccountSubscriptionInvestorBearerSharesC,
		sfAccountSubscriptionInvestorAccountBlockingDateC = c.sfAccountSubscriptionInvestorAccountBlockingDateC,
		sfAccountSubscriptionInvestorShellBankC = c.sfAccountSubscriptionInvestorShellBankC,
		sfAccountSubscriptionInvestorAccountBlockingRemovedDateC = c.sfAccountSubscriptionInvestorAccountBlockingRemovedDateC,
		sfAccountSubscriptionInvestorPoliticallyExposedPersonPEPC = c.sfAccountSubscriptionInvestorPoliticallyExposedPersonPEPC,
		sfAccountSubscriptionInvestorAMLReviewCycleC = c.sfAccountSubscriptionInvestorAMLReviewCycleC,
		sfAccountSubscriptionInvestorPEPStatusDetailsC = c.sfAccountSubscriptionInvestorPEPStatusDetailsC,
		sfAccountSubscriptionInvestorNextAMLReviewDateC = c.sfAccountSubscriptionInvestorNextAMLReviewDateC,
		sfAccountSubscriptionInvestorPEPStatusC = c.sfAccountSubscriptionInvestorPEPStatusC,
		sfAccountSubscriptionInvestorMarketingMethodC = c.sfAccountSubscriptionInvestorMarketingMethodC,
		sfAccountSubscriptionInvestorSourceOfWealthCategoryC = c.sfAccountSubscriptionInvestorSourceOfWealthCategoryC,
		sfAccountSubscriptionInvestorMarketingDetailsC = c.sfAccountSubscriptionInvestorMarketingDetailsC,
		sfAccountSubscriptionInvestorSourceOfWealthC = c.sfAccountSubscriptionInvestorSourceOfWealthC,
		sfAccountSubscriptionInvestorMiFIDClientCategoryC = c.sfAccountSubscriptionInvestorMiFIDClientCategoryC,
		sfAccountSubscriptionInvestorSourceOfFundsCategoryC = c.sfAccountSubscriptionInvestorSourceOfFundsCategoryC,
		sfAccountSubscriptionInvestorSourceOfFundsDetailsC = c.sfAccountSubscriptionInvestorSourceOfFundsDetailsC,
		sfAccountSubscriptionInvestorSoWSoFCountryC = c.sfAccountSubscriptionInvestorSoWSoFCountryC,
		sfAccountSubscriptionInvestorLegalStatusC = c.sfAccountSubscriptionInvestorLegalStatusC,
		sfAccountSubscriptionInvestorHighRiskFactorsC = c.sfAccountSubscriptionInvestorHighRiskFactorsC,
		sfAccountSubscriptionInvestorAwarenessNexusC = c.sfAccountSubscriptionInvestorAwarenessNexusC,
		sfAccountSubscriptionInvestorAMLNotesC = c.sfAccountSubscriptionInvestorAMLNotesC,
		sfAccountSubscriptionInvestorApprovalStatusC = c.sfAccountSubscriptionInvestorApprovalStatusC,
		sfAccountSubscriptionInvestorNameChangeApprovalStatusC = c.sfAccountSubscriptionInvestorNameChangeApprovalStatusC,
		sfAccountSubscriptionInvestorAMLApproverC = c.sfAccountSubscriptionInvestorAMLApproverC,
		sfAccountSubscriptionInvestorFMApproverC = c.sfAccountSubscriptionInvestorFMApproverC,
		sfAccountSubscriptionInvestorFormTypeC = c.sfAccountSubscriptionInvestorFormTypeC,
		sfAccountSubscriptionInvestorTaxIDC = c.sfAccountSubscriptionInvestorTaxIDC,
		sfAccountSubscriptionInvestorFMTaxIdC = c.sfAccountSubscriptionInvestorFMTaxIdC,
		sfAccountSubscriptionInvestorEquityTaxIdC = c.sfAccountSubscriptionInvestorEquityTaxIdC,
		sfAccountSubscriptionInvestorTaxEntityTypeC = c.sfAccountSubscriptionInvestorTaxEntityTypeC,
		sfAccountSubscriptionInvestorTaxStatusC = c.sfAccountSubscriptionInvestorTaxStatusC,
		sfAccountSubscriptionInvestorFATCAStatusC = c.sfAccountSubscriptionInvestorFATCAStatusC,
		sfAccountSubscriptionInvestorUSTINTypeC = c.sfAccountSubscriptionInvestorUSTINTypeC,
		sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberC = c.sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberC,
		sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberCountryC = c.sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberCountryC,
		sfAccountSubscriptionInvestorWithholdingForeignPartnershipEINC = c.sfAccountSubscriptionInvestorWithholdingForeignPartnershipEINC,
		sfAccountSubscriptionInvestorTaxResidencyCertificatesC = c.sfAccountSubscriptionInvestorTaxResidencyCertificatesC,
		sfAccountSubscriptionInvestorSponsoringEntityGIINC = c.sfAccountSubscriptionInvestorSponsoringEntityGIINC,
		sfAccountSubscriptionInvestorW9OtherEntityTypeC = c.sfAccountSubscriptionInvestorW9OtherEntityTypeC,
		sfAccountSubscriptionInvestorAccountOpeningDateC = c.sfAccountSubscriptionInvestorAccountOpeningDateC,
		sfAccountSubscriptionInvestorJointAccountNameC = c.sfAccountSubscriptionInvestorJointAccountNameC,
		sfAccountSubscriptionInvestorTreatyCountryC = c.sfAccountSubscriptionInvestorTreatyCountryC,
		sfAccountSubscriptionInvestorCountryOfBirthC = c.sfAccountSubscriptionInvestorCountryOfBirthC,
		sfAccountSubscriptionInvestorCitizenshipCountryC = c.sfAccountSubscriptionInvestorCitizenshipCountryC,
		sfAccountSubscriptionInvestorCountryOfIncorporationFormationC = c.sfAccountSubscriptionInvestorCountryOfIncorporationFormationC,
		sfAccountSubscriptionInvestorExemptionFromFATCAReportingCodeC = c.sfAccountSubscriptionInvestorExemptionFromFATCAReportingCodeC,
		sfAccountSubscriptionInvestorExemptPayeeCodeC = c.sfAccountSubscriptionInvestorExemptPayeeCodeC,
		sfAccountSubscriptionInvestorDateOfBirthC = c.sfAccountSubscriptionInvestorDateOfBirthC,
		sfAccountSubscriptionInvestorBranchGIINC = c.sfAccountSubscriptionInvestorBranchGIINC,
		sfAccountSubscriptionInvestorGIINStatusDateC = c.sfAccountSubscriptionInvestorGIINStatusDateC,
		sfAccountSubscriptionInvestorGIINC = c.sfAccountSubscriptionInvestorGIINC,
		sfAccountSubscriptionInvestorGIINStatusC = c.sfAccountSubscriptionInvestorGIINStatusC,
		sfAccountSubscriptionInvestorQualifiedForeignPensionFundQFPFC = c.sfAccountSubscriptionInvestorQualifiedForeignPensionFundQFPFC,
		sfAccountSubscriptionInvestorTaxReportingByAlpInvestC = c.sfAccountSubscriptionInvestorTaxReportingByAlpInvestC,
		sfAccountSubscriptionInvestorTaxAccountOwnerC = c.sfAccountSubscriptionInvestorTaxAccountOwnerC,
		sfAccountSubscriptionInvestorTAOBillingCountryC = c.sfAccountSubscriptionInvestorTAOBillingCountryC,
		sfAccountSubscriptionInvestorTAOBillingStreetC = c.sfAccountSubscriptionInvestorTAOBillingStreetC,
		sfAccountSubscriptionInvestorTAOBillingCityC = c.sfAccountSubscriptionInvestorTAOBillingCityC,
		sfAccountSubscriptionInvestorTAOBillingStateC = c.sfAccountSubscriptionInvestorTAOBillingStateC,
		sfAccountSubscriptionInvestorTAOBillingPostalCodeC = c.sfAccountSubscriptionInvestorTAOBillingPostalCodeC,
		sfAccountSubscriptionInvestorTAOBillingStreet2C = c.sfAccountSubscriptionInvestorTAOBillingStreet2C,
		sfAccountSubscriptionInvestorTAOTaxStatusC = c.sfAccountSubscriptionInvestorTAOTaxStatusC,
		sfAccountSubscriptionInvestorTAOCitizenshipCountryC = c.sfAccountSubscriptionInvestorTAOCitizenshipCountryC,
		sfAccountSubscriptionInvestorTAOCountryOfIncorporationFormationC = c.sfAccountSubscriptionInvestorTAOCountryOfIncorporationFormationC,
		sfAccountSubscriptionInvestorTAOUSTaxIDC = c.sfAccountSubscriptionInvestorTAOUSTaxIDC,
		sfAccountSubscriptionInvestorTAOIndividualOrOrganizationC = c.sfAccountSubscriptionInvestorTAOIndividualOrOrganizationC,
		sfAccountSubscriptionInvestorTAOUSTINTypeC = c.sfAccountSubscriptionInvestorTAOUSTINTypeC,
		sfAccountSubscriptionInvestorTAOInvestorForeignDomesticC = c.sfAccountSubscriptionInvestorTAOInvestorForeignDomesticC,
		sfAccountSubscriptionInvestorTAONonUSTaxIDCountryC = c.sfAccountSubscriptionInvestorTAONonUSTaxIDCountryC,
		sfAccountSubscriptionInvestorTAOForeignTaxIdC = c.sfAccountSubscriptionInvestorTAOForeignTaxIdC,
		sfAccountSubscriptionInvestorTAOWithholdingForeignPartnershipEINC = c.sfAccountSubscriptionInvestorTAOWithholdingForeignPartnershipEINC,
		sfAccountSubscriptionInvestorTAODateOfBirthC = c.sfAccountSubscriptionInvestorTAODateOfBirthC,
		sfAccountSubscriptionInvestorTAOExemptionFromFATCAReportingCodeC = c.sfAccountSubscriptionInvestorTAOExemptionFromFATCAReportingCodeC,
		sfAccountSubscriptionInvestorTAOTaxCountryJurisdictionC = c.sfAccountSubscriptionInvestorTAOTaxCountryJurisdictionC,
		sfAccountSubscriptionInvestorTAOExemptPayeeCodeC = c.sfAccountSubscriptionInvestorTAOExemptPayeeCodeC,
		sfAccountSubscriptionInvestorTAOShippingCountryC = c.sfAccountSubscriptionInvestorTAOShippingCountryC,
		sfAccountSubscriptionInvestorTAOShippingStreetC = c.sfAccountSubscriptionInvestorTAOShippingStreetC,
		sfAccountSubscriptionInvestorTAOShippingCityC = c.sfAccountSubscriptionInvestorTAOShippingCityC,
		sfAccountSubscriptionInvestorTAOInvestorMailingStateProvinceC = c.sfAccountSubscriptionInvestorTAOInvestorMailingStateProvinceC,
		sfAccountSubscriptionInvestorTAOShippingPostalCodeC = c.sfAccountSubscriptionInvestorTAOShippingPostalCodeC,
		sfAccountSubscriptionInvestorTAOShippingStreet2C = c.sfAccountSubscriptionInvestorTAOShippingStreet2C,
		sfAccountSubscriptionInvestorTAOTaxFormTypeC = c.sfAccountSubscriptionInvestorTAOTaxFormTypeC,
		sfAccountSubscriptionInvestorTAOBranchGIINC = c.sfAccountSubscriptionInvestorTAOBranchGIINC,
		sfAccountSubscriptionInvestorTAOGIINC = c.sfAccountSubscriptionInvestorTAOGIINC,
		sfAccountSubscriptionInvestorTAOCountryOfBirthC = c.sfAccountSubscriptionInvestorTAOCountryOfBirthC,
		sfAccountSubscriptionInvestorTAOFATCAClassificationC = c.sfAccountSubscriptionInvestorTAOFATCAClassificationC,
		sfAccountSubscriptionInvestorTAOSponsoringEntityGIINC = c.sfAccountSubscriptionInvestorTAOSponsoringEntityGIINC,
		sfAccountSubscriptionInvestorTAOW9OtherEntityTypeC = c.sfAccountSubscriptionInvestorTAOW9OtherEntityTypeC,
		sfAccountSubscriptionInvestorTAOFirstNameC = c.sfAccountSubscriptionInvestorTAOFirstNameC,
		sfAccountSubscriptionInvestorTAOLastNameC = c.sfAccountSubscriptionInvestorTAOLastNameC,
		sfAccountSubscriptionInvestorTAOMiddleNameC = c.sfAccountSubscriptionInvestorTAOMiddleNameC,
		sfAccountSubscriptionInvestorTAOFATCAStatusC = c.sfAccountSubscriptionInvestorTAOFATCAStatusC,
		sfAccountSubscriptionInvestorTAOExemptionFromFATCAWithholdingCodC = c.sfAccountSubscriptionInvestorTAOExemptionFromFATCAWithholdingCodC,
		sfAccountSubscriptionInvestorIdentificationAsASpecifiedUKPersonC = c.sfAccountSubscriptionInvestorIdentificationAsASpecifiedUKPersonC,
		sfAccountSubscriptionInvestorCDOTEntityAccountHolderStatusC = c.sfAccountSubscriptionInvestorCDOTEntityAccountHolderStatusC,
		sfAccountSubscriptionInvestorAffiliatedCorporationC = c.sfAccountSubscriptionInvestorAffiliatedCorporationC,
		sfAccountSubscriptionInvestorReportableUKPersonC = c.sfAccountSubscriptionInvestorReportableUKPersonC,
		sfAccountSubscriptionInvestorReportableGGYJEYGIBIOMPersonC = c.sfAccountSubscriptionInvestorReportableGGYJEYGIBIOMPersonC,
		sfAccountSubscriptionInvestorCRSClassificationC = c.sfAccountSubscriptionInvestorCRSClassificationC,
		sfAccountSubscriptionInvestorRelatedEntityC = c.sfAccountSubscriptionInvestorRelatedEntityC,
		sfAccountSubscriptionInvestorPlaceOfBirthC = c.sfAccountSubscriptionInvestorPlaceOfBirthC,
		sfAccountSubscriptionInvestorDateOfOrganizationFormationDateC = c.sfAccountSubscriptionInvestorDateOfOrganizationFormationDateC,
		sfAccountSubscriptionInvestorEffectiveDateOfSelfCertificationC = c.sfAccountSubscriptionInvestorEffectiveDateOfSelfCertificationC,
		sfAccountSubscriptionInvestorNameOfSecuritiesMarketC = c.sfAccountSubscriptionInvestorNameOfSecuritiesMarketC,
		sfAccountSubscriptionInvestorStatusOfCRSReviewC = c.sfAccountSubscriptionInvestorStatusOfCRSReviewC,
		sfAccountSubscriptionInvestorReportableNonReportableAccountC = c.sfAccountSubscriptionInvestorReportableNonReportableAccountC,
		sfAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC = c.sfAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC,
		anduinAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC = c.anduinAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC,
		sfAccountSubscriptionInvestorReportingCountriesC = c.sfAccountSubscriptionInvestorReportingCountriesC,
		sfAccountSubscriptionInvestorTINUnavailableC = c.sfAccountSubscriptionInvestorTINUnavailableC,
		sfAccountSubscriptionInvestorTINCountryNo1C = c.sfAccountSubscriptionInvestorTINCountryNo1C,
		sfAccountSubscriptionInvestorTINNo1C = c.sfAccountSubscriptionInvestorTINNo1C,
		sfAccountSubscriptionInvestorTINCountryNo2C = c.sfAccountSubscriptionInvestorTINCountryNo2C,
		sfAccountSubscriptionInvestorTINNo2C = c.sfAccountSubscriptionInvestorTINNo2C,
		sfAccountSubscriptionInvestorTINCountryNo3C = c.sfAccountSubscriptionInvestorTINCountryNo3C,
		sfAccountSubscriptionInvestorTINNo3C = c.sfAccountSubscriptionInvestorTINNo3C,
		sfAccountSubscriptionInvestorTINCountryNo4C = c.sfAccountSubscriptionInvestorTINCountryNo4C,
		sfAccountSubscriptionInvestorTINNo4C = c.sfAccountSubscriptionInvestorTINNo4C,
		sfAccountSubscriptionInvestorTINCountryNo5C = c.sfAccountSubscriptionInvestorTINCountryNo5C,
		sfAccountSubscriptionInvestorTINNo5C = c.sfAccountSubscriptionInvestorTINNo5C,
		sfAccountSubscriptionInvestorRegisteredAddress2C = c.sfAccountSubscriptionInvestorRegisteredAddress2C,
		sfAccountSubscriptionInvestorMailingAddress2C = c.sfAccountSubscriptionInvestorMailingAddress2C,
		sfAccountSubscriptionInvestorAccreditedInvestorStatusEntitiesC = c.sfAccountSubscriptionInvestorAccreditedInvestorStatusEntitiesC,
		sfAccountSubscriptionInvestorAccreditedInvestorStatusIndividualC = c.sfAccountSubscriptionInvestorAccreditedInvestorStatusIndividualC,
		sfAccountSubscriptionInvestorGovernmentIssuedIDOnFileC = c.sfAccountSubscriptionInvestorGovernmentIssuedIDOnFileC,
		sfAccountSubscriptionInvestorGovernmentIDExpirationDateC = c.sfAccountSubscriptionInvestorGovernmentIDExpirationDateC,
		sfAccountSubscriptionInvestorExpirationOfRestrictiveCovenantPerioC = c.sfAccountSubscriptionInvestorExpirationOfRestrictiveCovenantPerioC,
		sfAccountSubscriptionInvestorIsCapitalShareholderControlledC = c.sfAccountSubscriptionInvestorIsCapitalShareholderControlledC,
		sfAccountSubscriptionInvestorIsIndivRetirementBenefitPlanC = c.sfAccountSubscriptionInvestorIsIndivRetirementBenefitPlanC,
		sfAccountSubscriptionInvestorIsBHCC = c.sfAccountSubscriptionInvestorIsBHCC,
		sfAccountSubscriptionInvestorIndividualRetirementAccountIRAC = c.sfAccountSubscriptionInvestorIndividualRetirementAccountIRAC,
		sfAccountSubscriptionInvestorQualifiedPurchaserC = c.sfAccountSubscriptionInvestorQualifiedPurchaserC,
		sfAccountSubscriptionInvestorQualifiedInvestorStatusEntityC = c.sfAccountSubscriptionInvestorQualifiedInvestorStatusEntityC,
		sfAccountSubscriptionInvestorQualifiedClientStatusC = c.sfAccountSubscriptionInvestorQualifiedClientStatusC,
		sfAccountSubscriptionInvestorQualifiedInvestorStatusIndividualC = c.sfAccountSubscriptionInvestorQualifiedInvestorStatusIndividualC,
		sfAccountSubscriptionInvestorIsJapaneseResC = c.sfAccountSubscriptionInvestorIsJapaneseResC,
		sfAccountSubscriptionInvestorIsFIELQualifiedC = c.sfAccountSubscriptionInvestorIsFIELQualifiedC,
		sfAccountSubscriptionInvestorIsArticle63AppliedC = c.sfAccountSubscriptionInvestorIsArticle63AppliedC,
		sfAccountSubscriptionInvestorEUElectiveProfessionalClientC = c.sfAccountSubscriptionInvestorEUElectiveProfessionalClientC,
		sfAccountSubscriptionInvestorDescription = c.sfAccountSubscriptionInvestorDescription,
		sfAccountSubscriptionInvestorUBSEscrowAccountC = c.sfAccountSubscriptionInvestorUBSEscrowAccountC,
		sfAccountSubscriptionInvestorMSSBIDC = c.sfAccountSubscriptionInvestorMSSBIDC,
		sfAccountSubscriptionInvestorMRORC = c.sfAccountSubscriptionInvestorMRORC,
		sfAccountSubscriptionInvestorIsUSTaxExemptC = c.sfAccountSubscriptionInvestorIsUSTaxExemptC,
		sfAccountSubscriptionInvestorIsSection115Entity = c.sfAccountSubscriptionInvestorIsSection115Entity,
		sfAccountSubscriptionInvestorOwnerIsUSTaxExempt = c.sfAccountSubscriptionInvestorOwnerIsUSTaxExempt,
		sfAccountSubscriptionInvestorTreatedAsTaxExemptLP = c.sfAccountSubscriptionInvestorTreatedAsTaxExemptLP,
		sfAccountSubscriptionInvestorTaxExemptSubtypeC = c.sfAccountSubscriptionInvestorTaxExemptSubtypeC,
		sfAccountSubscriptionInvestorExemptFromStateAndLocalIncomeTaxC = c.sfAccountSubscriptionInvestorExemptFromStateAndLocalIncomeTaxC,
		sfAccountSubscriptionInvestorWHRateOIDC = c.sfAccountSubscriptionInvestorWHRateOIDC,
		sfAccountSubscriptionInvestorWHRateECIC = c.sfAccountSubscriptionInvestorWHRateECIC,
		sfAccountSubscriptionInvestorWHRateFATCAC = c.sfAccountSubscriptionInvestorWHRateFATCAC,
		sfAccountSubscriptionInvestorRecordTypeId = c.sfAccountSubscriptionInvestorRecordTypeId,
		sfAccountSubscriptionInvestorAccountStatusC = c.sfAccountSubscriptionInvestorAccountStatusC,
		sfAccountSubscriptionInvestorWLCRegulatorC = c.sfAccountSubscriptionInvestorWLCRegulatorC,
		sfAccountSubscriptionInvestorWLCExchangeC = c.sfAccountSubscriptionInvestorWLCExchangeC,
		sfAccountSubscriptionInvestorWLCTickerSymbolC = c.sfAccountSubscriptionInvestorWLCTickerSymbolC,
		sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC = c.sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC,
		anduinAccountSubscriptionInvestorSignerFirstName = c.anduinAccountSubscriptionInvestorSignerFirstName,
		anduinAccountSubscriptionInvestorSignerMiddleName = c.anduinAccountSubscriptionInvestorSignerMiddleName,
		anduinAccountSubscriptionInvestorSignerLastName = c.anduinAccountSubscriptionInvestorSignerLastName,
		sfAccountSubscriptionInvestorSignerFirstName = c.sfAccountSubscriptionInvestorSignerFirstName,
		sfAccountSubscriptionInvestorSignerMiddleName = c.sfAccountSubscriptionInvestorSignerMiddleName,
		sfAccountSubscriptionInvestorSignerLastName = c.sfAccountSubscriptionInvestorSignerLastName,
		sfAgreementOnboardingNameC = c.sfAgreementOnboardingNameC,
		sfAgreementOnboardingStatusC = c.sfAgreementOnboardingStatusC,
		sfAgreementOnboardingTypeC = c.sfAgreementOnboardingTypeC,
		sfAgreementOnboardingCommonSubscriptionEntityC = c.sfAgreementOnboardingCommonSubscriptionEntityC,
		sfAgreementOnboardingSubscriptionInvestorApprovalStatusC = c.sfAgreementOnboardingSubscriptionInvestorApprovalStatusC,
		sfAgreementOnboardingAccountC = c.sfAgreementOnboardingAccountC,
		sfAgreementOnboardingRelatedCommonNameC = c.sfAgreementOnboardingRelatedCommonNameC,
		sfAgreementOnboardingSIIndividualOrOrganizationC = c.sfAgreementOnboardingSIIndividualOrOrganizationC,
		sfAgreementOnboardingSIInvestorForeignDomesticC = c.sfAgreementOnboardingSIInvestorForeignDomesticC,
		sfAgreementOnboardingOriginalCompletedDateC = c.sfAgreementOnboardingOriginalCompletedDateC,
		sfAgreementOnboardingParentAgreementIdC = c.sfAgreementOnboardingParentAgreementIdC,
		sfAgreementOnboardingCommitmentTypeC = c.sfAgreementOnboardingCommitmentTypeC,
		sfAgreementOnboardingInvestorFundC = c.sfAgreementOnboardingInvestorFundC,
		sfAgreementOnboardingOpportunityC = c.sfAgreementOnboardingOpportunityC,
		sfAgreementOnboardingFundC = c.sfAgreementOnboardingFundC,
		sfAgreementOnboardingCurrencyC = c.sfAgreementOnboardingCurrencyC,
		sfAgreementOnboardingFundCloseC = c.sfAgreementOnboardingFundCloseC,
		sfAgreementOnboardingPartnershipC = c.sfAgreementOnboardingPartnershipC,
		sfAgreementOnboardingRequestedCommitmentAmountC = c.sfAgreementOnboardingRequestedCommitmentAmountC,
		sfAgreementOnboardingCommitmentC = c.sfAgreementOnboardingCommitmentC,
		sfAgreementOnboardingUSDAmountC = c.sfAgreementOnboardingUSDAmountC,
		sfAgreementOnboardingEffectiveDateC = c.sfAgreementOnboardingEffectiveDateC,
		sfAgreementOnboardingInvestranVehicleTypeC = c.sfAgreementOnboardingInvestranVehicleTypeC,
		sfAgreementOnboardingRelatedAgreementsGroupC = c.sfAgreementOnboardingRelatedAgreementsGroupC,
		sfAgreementOnboardingAssociatedLegalEntitiesC = c.sfAgreementOnboardingAssociatedLegalEntitiesC,
		sfAgreementOnboardingAgreementLegalEntitiesExternalIdsC = c.sfAgreementOnboardingAgreementLegalEntitiesExternalIdsC,
		sfAgreementOnboardingSIInvestorRegisteredCountryC = c.sfAgreementOnboardingSIInvestorRegisteredCountryC,
		sfAgreementOnboardingSIInvestorRegisteredStreetAddressC = c.sfAgreementOnboardingSIInvestorRegisteredStreetAddressC,
		sfAgreementOnboardingSIInvestorRegisteredCityC = c.sfAgreementOnboardingSIInvestorRegisteredCityC,
		sfAgreementOnboardingSIInvestorRegisteredStateProvinceC = c.sfAgreementOnboardingSIInvestorRegisteredStateProvinceC,
		sfAgreementOnboardingSIInvestorRegisteredPostalCodeC = c.sfAgreementOnboardingSIInvestorRegisteredPostalCodeC,
		sfAgreementOnboardingSIInvestorRegisteredAddress2C = c.sfAgreementOnboardingSIInvestorRegisteredAddress2C,
		sfAgreementOnboardingSIInvestorMailingCountryC = c.sfAgreementOnboardingSIInvestorMailingCountryC,
		sfAgreementOnboardingSIInvestorMailingStreetC = c.sfAgreementOnboardingSIInvestorMailingStreetC,
		sfAgreementOnboardingSIInvestorMailingCityC = c.sfAgreementOnboardingSIInvestorMailingCityC,
		sfAgreementOnboardingSIInvestorMailingStateProvinceC = c.sfAgreementOnboardingSIInvestorMailingStateProvinceC,
		sfAgreementOnboardingSIInvestorMailingZipPostalCodeC = c.sfAgreementOnboardingSIInvestorMailingZipPostalCodeC,
		sfAgreementOnboardingSIInvestorMailingAddress2C = c.sfAgreementOnboardingSIInvestorMailingAddress2C,
		sfAgreementOnboardingSIUSTaxpayerIdentificationNumberC = c.sfAgreementOnboardingSIUSTaxpayerIdentificationNumberC,
		sfAgreementOnboardingSIUSTINTypeC = c.sfAgreementOnboardingSIUSTINTypeC,
		sfAgreementOnboardingSITaxStatusC = c.sfAgreementOnboardingSITaxStatusC,
		sfAgreementOnboardingSITaxCountryJurisdictionC = c.sfAgreementOnboardingSITaxCountryJurisdictionC,
		sfAgreementOnboardingSIFATCAClassificationC = c.sfAgreementOnboardingSIFATCAClassificationC,
		sfAgreementOnboardingSINonUSTaxIDC = c.sfAgreementOnboardingSINonUSTaxIDC,
		sfAgreementOnboardingSINonUSTaxIDCountryC = c.sfAgreementOnboardingSINonUSTaxIDCountryC,
		sfAgreementOnboardingSICitizenshipCountryC = c.sfAgreementOnboardingSICitizenshipCountryC,
		sfAgreementOnboardingSICountryOfIncorporationFormationC = c.sfAgreementOnboardingSICountryOfIncorporationFormationC,
		sfAgreementOnboardingSICountryOfBirthC = c.sfAgreementOnboardingSICountryOfBirthC,
		sfAgreementOnboardingSIDateOfBirthC = c.sfAgreementOnboardingSIDateOfBirthC,
		sfAgreementOnboardingSIExemptionFromFATCAReportingCodeC = c.sfAgreementOnboardingSIExemptionFromFATCAReportingCodeC,
		sfAgreementOnboardingSIExemptPayeeCodeC = c.sfAgreementOnboardingSIExemptPayeeCodeC,
		sfAgreementOnboardingSIGIINC = c.sfAgreementOnboardingSIGIINC,
		sfAgreementOnboardingSIBranchGIINC = c.sfAgreementOnboardingSIBranchGIINC,
		sfAgreementOnboardingX892CAIC = c.sfAgreementOnboardingX892CAIC,
		sfAgreementOnboardingX892CAITextC = c.sfAgreementOnboardingX892CAITextC,
		sfAgreementOnboardingTaxExemptStatusNotesC = c.sfAgreementOnboardingTaxExemptStatusNotesC,
		sfAgreementOnboardingERISAPartnerC = c.sfAgreementOnboardingERISAPartnerC,
		sfAgreementOnboardingIsERISATitleIC = c.sfAgreementOnboardingIsERISATitleIC,
		anduinAgreementOnboardingIsERISATitleIC = c.anduinAgreementOnboardingIsERISATitleIC,
		sfAgreementOnboardingSIDisregardedGPOfGPC = c.sfAgreementOnboardingSIDisregardedGPOfGPC,
		sfAgreementOnboardingSIQualifiedInstitutionalInvestorFIELC = c.sfAgreementOnboardingSIQualifiedInstitutionalInvestorFIELC,
		sfAgreementOnboardingSIFundingParentSubEntityC = c.sfAgreementOnboardingSIFundingParentSubEntityC,
		sfAgreementOnboardingSIArticle63Paragraph1AppliesC = c.sfAgreementOnboardingSIArticle63Paragraph1AppliesC,
		sfAgreementOnboardingSIFundingSiloC = c.sfAgreementOnboardingSIFundingSiloC,
		sfAgreementOnboardingNewCommitmentOrTransferC = c.sfAgreementOnboardingNewCommitmentOrTransferC,
		sfAgreementOnboardingConfirmationOfInvestmentOnOwnBehalfC = c.sfAgreementOnboardingConfirmationOfInvestmentOnOwnBehalfC,
		sfAgreementOnboardingInvestorTypeC = c.sfAgreementOnboardingInvestorTypeC,
		sfAgreementOnboardingLuxTaxAssessmentC = c.sfAgreementOnboardingLuxTaxAssessmentC,
		sfAgreementOnboardingInvestingInLuxFundsC = c.sfAgreementOnboardingInvestingInLuxFundsC,
		sfAgreementOnboardingLuxTaxAssessmentScoreC = c.sfAgreementOnboardingLuxTaxAssessmentScoreC,
		sfAgreementOnboardingSourceOfFundsC = c.sfAgreementOnboardingSourceOfFundsC,
		sfAgreementOnboardingEvidenceOfExistenceC = c.sfAgreementOnboardingEvidenceOfExistenceC,
		sfAgreementOnboardingSourceOfWealthC = c.sfAgreementOnboardingSourceOfWealthC,
		sfAgreementOnboardingEvidenceOfCorporateAuthorityC = c.sfAgreementOnboardingEvidenceOfCorporateAuthorityC,
		sfAgreementOnboardingSourceOfWealthDetailsC = c.sfAgreementOnboardingSourceOfWealthDetailsC,
		sfAgreementOnboardingSignedStructureChartC = c.sfAgreementOnboardingSignedStructureChartC,
		sfAgreementOnboardingListOfLegalRepsAndDirectorsC = c.sfAgreementOnboardingListOfLegalRepsAndDirectorsC,
		sfAgreementOnboardingEvidenceOfEachTierOfTheStructureC = c.sfAgreementOnboardingEvidenceOfEachTierOfTheStructureC,
		sfAgreementOnboardingIdentificationOfAuthorizedSignatoriesC = c.sfAgreementOnboardingIdentificationOfAuthorizedSignatoriesC,
		sfAgreementOnboardingIdentificationOfUBOsC = c.sfAgreementOnboardingIdentificationOfUBOsC,
		sfAgreementOnboardingFinCENControlPersonC = c.sfAgreementOnboardingFinCENControlPersonC,
		sfAgreementOnboardingWorldCheckResultsC = c.sfAgreementOnboardingWorldCheckResultsC,
		sfAgreementOnboardingControlPersonJurisdictionC = c.sfAgreementOnboardingControlPersonJurisdictionC,
		sfAgreementOnboardingWorldCheckDetailsC = c.sfAgreementOnboardingWorldCheckDetailsC,
		sfAgreementOnboardingExceptionsWaiversC = c.sfAgreementOnboardingExceptionsWaiversC,
		sfAgreementOnboardingApprovalForHighRiskOrPEPC = c.sfAgreementOnboardingApprovalForHighRiskOrPEPC,
		sfAgreementOnboardingExceptionsWaiversDetailsC = c.sfAgreementOnboardingExceptionsWaiversDetailsC,
		sfAgreementOnboardingAnalystC = c.sfAgreementOnboardingAnalystC,
		sfAgreementOnboardingKYCSatisfactoryC = c.sfAgreementOnboardingKYCSatisfactoryC,
		sfAgreementOnboardingAMLReviewInitiatedC = c.sfAgreementOnboardingAMLReviewInitiatedC,
		sfAgreementOnboardingPostCloseDetailsC = c.sfAgreementOnboardingPostCloseDetailsC,
		sfAgreementOnboardingAMLClearanceDateC = c.sfAgreementOnboardingAMLClearanceDateC,
		sfAgreementOnboardingPostCloseFollowUpDateC = c.sfAgreementOnboardingPostCloseFollowUpDateC,
		sfAgreementOnboardingAMLNotesC = c.sfAgreementOnboardingAMLNotesC,
		sfAgreementOnboardingAMLApprovalDateC = c.sfAgreementOnboardingAMLApprovalDateC,
		sfAgreementOnboardingEligibleIntroducerLetterCertificateC = c.sfAgreementOnboardingEligibleIntroducerLetterCertificateC,
		sfAgreementOnboardingExternalAccountNumberC = c.sfAgreementOnboardingExternalAccountNumberC,
		sfAgreementOnboardingCommentsC = c.sfAgreementOnboardingCommentsC,
		sfAgreementOnboardingExternalAccountInstitutionC = c.sfAgreementOnboardingExternalAccountInstitutionC,
		sfAgreementOnboardingAMLDataApprovedC = c.sfAgreementOnboardingAMLDataApprovedC,
		sfAgreementOnboardingAMLApproverC = c.sfAgreementOnboardingAMLApproverC,
		sfAgreementOnboardingAMLApprovedC = c.sfAgreementOnboardingAMLApprovedC,
		sfAgreementOnboardingFMApprovedC = c.sfAgreementOnboardingFMApprovedC,
		sfAgreementOnboardingSkipAMLApprovalsC = c.sfAgreementOnboardingSkipAMLApprovalsC,
		sfAgreementOnboardingIFStatusC = c.sfAgreementOnboardingIFStatusC,
		sfAgreementOnboardingRecordTypeId = c.sfAgreementOnboardingRecordTypeId,
		sfAgreementOnboardingSIInvestingAssetsOfAnyRetirementPlC = c.sfAgreementOnboardingSIInvestingAssetsOfAnyRetirementPlC,
		sfAgreementOnboardingIsInvestorControllingC = c.sfAgreementOnboardingIsInvestorControllingC,
		sfAgreementOnboardingIsERISAFOIAC = c.sfAgreementOnboardingIsERISAFOIAC,
		sfAgreementOnboardingSIQualifiedInvestorStatusEntityC = c.sfAgreementOnboardingSIQualifiedInvestorStatusEntityC,
		anduinAgreementOnboardingSignerFirstName = c.anduinAgreementOnboardingSignerFirstName,
		anduinAgreementOnboardingSignerMiddleName = c.anduinAgreementOnboardingSignerMiddleName,
		anduinAgreementOnboardingSignerLastName = c.anduinAgreementOnboardingSignerLastName,
		sfAgreementOnboardingSignerFirstName = c.sfAgreementOnboardingSignerFirstName,
		sfAgreementOnboardingSignerMiddleName = c.sfAgreementOnboardingSignerMiddleName,
		sfAgreementOnboardingSignerLastName = c.sfAgreementOnboardingSignerLastName,
		sfAgreementNullTCGGlobalIdC = c.sfAgreementNullTCGGlobalIdC,
		sfAgreementNullCommitmentC = c.sfAgreementNullCommitmentC,
		anduinAgreementNullSignerFirstName = c.anduinAgreementNullSignerFirstName,
		anduinAgreementNullSignerMiddleName = c.anduinAgreementNullSignerMiddleName,
		anduinAgreementNullSignerLastName = c.anduinAgreementNullSignerLastName,
		sfAgreementNullSignerFirstName = c.sfAgreementNullSignerFirstName,
		sfAgreementNullSignerMiddleName = c.sfAgreementNullSignerMiddleName,
		sfAgreementNullSignerLastName = c.sfAgreementNullSignerLastName,
		sfAgreementNullWLCInternationalSupplementsC = c.sfAgreementNullWLCInternationalSupplementsC,
		sfAgreementNullReceiveUnappliedBalanceReductionAmtC = c.sfAgreementNullReceiveUnappliedBalanceReductionAmtC,
		sfAgreementNullIsNotIRCUSPerson = c.sfAgreementNullIsNotIRCUSPerson,
		sfAgreementNullOwnerIsNotIRCUSPerson = c.sfAgreementNullOwnerIsNotIRCUSPerson,
		sfAgreementNullTreatedAsNonUSLP = c.sfAgreementNullTreatedAsNonUSLP,
		sfAgreementNullECIC = c.sfAgreementNullECIC,
		sfAgreementNullUBTIC = c.sfAgreementNullUBTIC,
		sfAgreementNullUSRPHCC = c.sfAgreementNullUSRPHCC,
		sfAgreementNullWLC894EligibleC = c.sfAgreementNullWLC894EligibleC,
		sfFundFundPrivateEquityRealAssetName = c.sfFundFundPrivateEquityRealAssetName,
		sfFundFundPrivateEquityRealAssetProductNameC = c.sfFundFundPrivateEquityRealAssetProductNameC,
		sfFundFundPrivateEquityRealAssetFundLegalNameC = c.sfFundFundPrivateEquityRealAssetFundLegalNameC,
		sfFundFundPrivateEquityRealAssetFundAbbreviationC = c.sfFundFundPrivateEquityRealAssetFundAbbreviationC,
		sfFundFundPrivateEquityRealAssetStatusC = c.sfFundFundPrivateEquityRealAssetStatusC,
		sfFundFundPrivateEquityRealAssetFundStatusC = c.sfFundFundPrivateEquityRealAssetFundStatusC,
		sfFundFundPrivateEquityRealAssetInactiveDateC = c.sfFundFundPrivateEquityRealAssetInactiveDateC,
		sfFundFundPrivateEquityRealAssetVintageYearC = c.sfFundFundPrivateEquityRealAssetVintageYearC,
		sfFundFundPrivateEquityRealAssetInvestorDiscretionC = c.sfFundFundPrivateEquityRealAssetInvestorDiscretionC,
		sfFundFundPrivateEquityRealAssetFundStrategyDescriptionC = c.sfFundFundPrivateEquityRealAssetFundStrategyDescriptionC,
		sfFundFundPrivateEquityRealAssetPartOfProgramC = c.sfFundFundPrivateEquityRealAssetPartOfProgramC,
		sfFundFundPrivateEquityRealAssetPRACoverageC = c.sfFundFundPrivateEquityRealAssetPRACoverageC,
		sfFundFundPrivateEquityRealAssetAIFMDC = c.sfFundFundPrivateEquityRealAssetAIFMDC,
		sfFundFundPrivateEquityRealAssetMandateBackgroundC = c.sfFundFundPrivateEquityRealAssetMandateBackgroundC,
		sfFundFundPrivateEquityRealAssetCarlyleNotResponsibleForAMLKYCC = c.sfFundFundPrivateEquityRealAssetCarlyleNotResponsibleForAMLKYCC,
		sfFundFundPrivateEquityRealAssetFundTypeC = c.sfFundFundPrivateEquityRealAssetFundTypeC,
		sfFundFundPrivateEquityRealAssetProductLineC = c.sfFundFundPrivateEquityRealAssetProductLineC,
		sfFundFundPrivateEquityRealAssetProductTypeC = c.sfFundFundPrivateEquityRealAssetProductTypeC,
		sfFundFundPrivateEquityRealAssetFundFamilyC = c.sfFundFundPrivateEquityRealAssetFundFamilyC,
		sfFundFundPrivateEquityRealAssetFundFocusC = c.sfFundFundPrivateEquityRealAssetFundFocusC,
		sfFundFundPrivateEquityRealAssetRegionC = c.sfFundFundPrivateEquityRealAssetRegionC,
		sfFundFundPrivateEquityRealAssetStructureC = c.sfFundFundPrivateEquityRealAssetStructureC,
		sfFundFundPrivateEquityRealAssetCurrencyC = c.sfFundFundPrivateEquityRealAssetCurrencyC,
		sfFundFundPrivateEquityRealAssetFundFocusAdditionalInfoC = c.sfFundFundPrivateEquityRealAssetFundFocusAdditionalInfoC,
		sfFundFundPrivateEquityRealAssetFundSpecificParagraphC = c.sfFundFundPrivateEquityRealAssetFundSpecificParagraphC,
		sfFundFundPrivateEquityRealAssetManagedAccountDirectInvestmentsC = c.sfFundFundPrivateEquityRealAssetManagedAccountDirectInvestmentsC,
		sfFundFundPrivateEquityRealAssetClosingDateC = c.sfFundFundPrivateEquityRealAssetClosingDateC,
		sfFundFundPrivateEquityRealAssetFinalClosingDateC = c.sfFundFundPrivateEquityRealAssetFinalClosingDateC,
		sfFundFundPrivateEquityRealAssetFinalClosingDatePerLPAC = c.sfFundFundPrivateEquityRealAssetFinalClosingDatePerLPAC,
		sfFundFundCloseName = c.sfFundFundCloseName,
		sfFundFundCloseFundC = c.sfFundFundCloseFundC,
		sfFundFundCloseCloseDateC = c.sfFundFundCloseCloseDateC,
		sfFundFundCloseRecordTypeId = c.sfFundFundCloseRecordTypeId,
		sfFundNullTCGGlobalIdC = c.sfFundNullTCGGlobalIdC,
		sfBeneficialOwner = c.sfBeneficialOwner or {},
		sfControllingPersons = c.sfControllingPersons or {},
		sfIFCNullEmailC = c.sfIFCNullEmailC,
		sfIFCNullStatusC = c.sfIFCNullStatusC,
		sfIFCNullCommonNameC = c.sfIFCNullCommonNameC,
		sfIFCNullInvestorClassificationC = c.sfIFCNullInvestorClassificationC,
		sfIFCNullBeneficialCountryC = c.sfIFCNullBeneficialCountryC,
		sfIFCNullDateOfBirthC = c.sfIFCNullDateOfBirthC,
		sfIFCNullIndividualOrOrganizationC = c.sfIFCNullIndividualOrOrganizationC,
		sfIFCNullFullAddressC = c.sfIFCNullFullAddressC,
		sfIFCNullCreatedById = c.sfIFCNullCreatedById,
		sfIFCNullName = c.sfIFCNullName,
		sfIFCNullLastModifiedById = c.sfIFCNullLastModifiedById,
		sfIFCNullExternalIDC = c.sfIFCNullExternalIDC,
		sfIFCNullRecordTypeId = c.sfIFCNullRecordTypeId,
		sfIFCNullContactCountryC = c.sfIFCNullContactCountryC,
		sfIFCNullContactIDC = c.sfIFCNullContactIDC,
		sfIFCNullContactNameC = c.sfIFCNullContactNameC,
		sfIFCNullContactRecordTypeNameC = c.sfIFCNullContactRecordTypeNameC,
		sfIFCNullContactTCGGlobalIDC = c.sfIFCNullContactTCGGlobalIDC,
		sfIFCNullContactSCNRegisteredCountryC = c.sfIFCNullContactSCNRegisteredCountryC,
		sfContact = c.sfContact or {},
		sfTaxFormW9TaxAccountOwner = c.sfTaxFormW9TaxAccountOwner,
		sfTaxFormW9DisregardedEntityName = c.sfTaxFormW9DisregardedEntityName,
		sfTaxFormW9TAOTaxAccountOwner = c.sfTaxFormW9TAOTaxAccountOwner,
		sfTaxFormW9TaxStatusC = c.sfTaxFormW9TaxStatusC,
		sfTaxFormW9TAOTaxStatusC = c.sfTaxFormW9TAOTaxStatusC,
		sfTaxFormW9TaxEntityTypeC = c.sfTaxFormW9TaxEntityTypeC,
		sfTaxFormW9ExemptPayeeCodeC = c.sfTaxFormW9ExemptPayeeCodeC,
		sfTaxFormW9ExemptionFromFATCAReportingCodeC = c.sfTaxFormW9ExemptionFromFATCAReportingCodeC,
		sfTaxFormW9TAOExemptPayeeCodeC = c.sfTaxFormW9TAOExemptPayeeCodeC,
		sfTaxFormW9TAOExemptionFromFATCAReportingCodeC = c.sfTaxFormW9TAOExemptionFromFATCAReportingCodeC,
		sfTaxFormW9BillingStreet = c.sfTaxFormW9BillingStreet,
		sfTaxFormW9BillingCity = c.sfTaxFormW9BillingCity,
		sfTaxFormW9BillingState = c.sfTaxFormW9BillingState,
		sfTaxFormW9BillingPostalCode = c.sfTaxFormW9BillingPostalCode,
		sfTaxFormW9BillingCountry = c.sfTaxFormW9BillingCountry,
		sfTaxFormW9TAOBillingStreetC = c.sfTaxFormW9TAOBillingStreetC,
		sfTaxFormW9TAOBillingCityC = c.sfTaxFormW9TAOBillingCityC,
		sfTaxFormW9TAOBillingStateC = c.sfTaxFormW9TAOBillingStateC,
		sfTaxFormW9TAOBillingPostalCodeC = c.sfTaxFormW9TAOBillingPostalCodeC,
		sfTaxFormW9TAOBillingCountryC = c.sfTaxFormW9TAOBillingCountryC,
		sfTaxFormW9FMTaxIdC = c.sfTaxFormW9FMTaxIdC,
		sfTaxFormW9USTINTypeC = c.sfTaxFormW9USTINTypeC,
		sfTaxFormW9TAOUSTaxIDC = c.sfTaxFormW9TAOUSTaxIDC,
		sfTaxFormW9TAOUSTINTypeC = c.sfTaxFormW9TAOUSTINTypeC,
		sfAccountSubscriptionInvestorWHRateExpirationDateC = c.sfAccountSubscriptionInvestorWHRateExpirationDateC,
		sfAccountSubscriptionInvestorValidationResultC = c.sfAccountSubscriptionInvestorValidationResultC,
		sfAccountSubscriptionInvestorEffectiveDateOfTaxFormStatusC = c.sfAccountSubscriptionInvestorEffectiveDateOfTaxFormStatusC,
		sfAccountSubscriptionInvestorEffectiveDateOfFATCAStatusAndRateC = c.sfAccountSubscriptionInvestorEffectiveDateOfFATCAStatusAndRateC,
		sfAccountSubscriptionInvestorSubjectToFATCAWithholdingC = c.sfAccountSubscriptionInvestorSubjectToFATCAWithholdingC,
		sfAccountSubscriptionInvestorStatusOfFATCAReviewC = c.sfAccountSubscriptionInvestorStatusOfFATCAReviewC,
		sfAccountSubscriptionInvestorFATCAMonitoredC = c.sfAccountSubscriptionInvestorFATCAMonitoredC,
		sfAccountSubscriptionInvestorLimitationOfBenefitsOtherC = c.sfAccountSubscriptionInvestorLimitationOfBenefitsOtherC,
		sfAccountSubscriptionInvestorLimitationOfBenefitsC = c.sfAccountSubscriptionInvestorLimitationOfBenefitsC,
		sfAccountSubscriptionInvestorTAOGlobalIDC = c.sfAccountSubscriptionInvestorTAOGlobalIDC,
		sfAccountSubscriptionInvestorTAOTaxIDC = c.sfAccountSubscriptionInvestorTAOTaxIDC,
		sfAccountSubscriptionInvestorTAOWHRateC = c.sfAccountSubscriptionInvestorTAOWHRateC,
		sfAccountSubscriptionInvestorTAOStatusOfFATCAReviewC = c.sfAccountSubscriptionInvestorTAOStatusOfFATCAReviewC,
		sfAccountSubscriptionInvestorTAOSubjectToFATCAWithholdingC = c.sfAccountSubscriptionInvestorTAOSubjectToFATCAWithholdingC,
		sfAccountSubscriptionInvestorTAOTaxApprovalStatusC = c.sfAccountSubscriptionInvestorTAOTaxApprovalStatusC,
		sfAccountSubscriptionInvestorTAOTaxFormStatusC = c.sfAccountSubscriptionInvestorTAOTaxFormStatusC,
		sfAccountSubscriptionInvestorTAOTreatyCountryC = c.sfAccountSubscriptionInvestorTAOTreatyCountryC,
		sfAccountSubscriptionInvestorTAOWHRateFIRPTAIncomeC = c.sfAccountSubscriptionInvestorTAOWHRateFIRPTAIncomeC,
		sfAccountSubscriptionInvestorTAOWHRateInterestIncomeC = c.sfAccountSubscriptionInvestorTAOWHRateInterestIncomeC,
		sfAccountSubscriptionInvestorTAOWHRatePrivateDividendC = c.sfAccountSubscriptionInvestorTAOWHRatePrivateDividendC,
		sfAccountSubscriptionInvestorTAOWHRatePublicDividendC = c.sfAccountSubscriptionInvestorTAOWHRatePublicDividendC,
		sfAccountSubscriptionInvestorTAOGIINStatusC = c.sfAccountSubscriptionInvestorTAOGIINStatusC,
		sfAccountSubscriptionInvestorTAODemographicApprovalStatusC = c.sfAccountSubscriptionInvestorTAODemographicApprovalStatusC,
		sfAccountSubscriptionInvestorTAOGIINStatusDateC = c.sfAccountSubscriptionInvestorTAOGIINStatusDateC,
		sfAccountSubscriptionInvestorTAOEffectiveDateFATCACompletedStatusC = c.sfAccountSubscriptionInvestorTAOEffectiveDateFATCACompletedStatusC,
		sfAccountSubscriptionInvestorTAOEffectiveDateOfTaxFormStatusC = c.sfAccountSubscriptionInvestorTAOEffectiveDateOfTaxFormStatusC,
		sfAccountSubscriptionInvestorTAOLimitationOfBenefitsOtherC = c.sfAccountSubscriptionInvestorTAOLimitationOfBenefitsOtherC,
		sfAccountSubscriptionInvestorTAOFATCAMonitoredC = c.sfAccountSubscriptionInvestorTAOFATCAMonitoredC,
		sfAccountSubscriptionInvestorTAOBeneficialCountryC = c.sfAccountSubscriptionInvestorTAOBeneficialCountryC,
		sfAccountSubscriptionInvestorTAOEW8StatusC = c.sfAccountSubscriptionInvestorTAOEW8StatusC,
		sfAccountSubscriptionInvestorTAOClientIDC = c.sfAccountSubscriptionInvestorTAOClientIDC,
		sfAccountSubscriptionInvestorTAOFATCADocumentIDC = c.sfAccountSubscriptionInvestorTAOFATCADocumentIDC,
		sfAccountSubscriptionInvestorTAOValidationResultC = c.sfAccountSubscriptionInvestorTAOValidationResultC,
		sfAccountSubscriptionInvestorCRSStatusC = c.sfAccountSubscriptionInvestorCRSStatusC,
		sfAccountSubscriptionInvestorCRSDocumentIDC = c.sfAccountSubscriptionInvestorCRSDocumentIDC,
		sfAccountSubscriptionInvestorCRSValidationResultC = c.sfAccountSubscriptionInvestorCRSValidationResultC,
		sfAccountSubscriptionInvestorFATCADocumentIDC = c.sfAccountSubscriptionInvestorFATCADocumentIDC,
		sfAccountSubscriptionInvestorSExemptionCodeC = c.sfAccountSubscriptionInvestorSExemptionCodeC,
		sfAccountSubscriptionInvestorStateExemptCertificationProvidedC = c.sfAccountSubscriptionInvestorStateExemptCertificationProvidedC,
		sfAccountSubscriptionInvestorDateStateExemptCertificateProvidedC = c.sfAccountSubscriptionInvestorDateStateExemptCertificateProvidedC,
		sfAccountSubscriptionInvestorAMLRefreshStatusC = c.sfAccountSubscriptionInvestorAMLRefreshStatusC,
		sfIFCNullHideIFCFromContactSelfServicingC = c.sfIFCNullHideIFCFromContactSelfServicingC,
		sfAccountSubscriptionInvestorTAOLimitationOfBenefitsC = c.sfAccountSubscriptionInvestorTAOLimitationOfBenefitsC,
		sfAgreementOnboardingInitialAdditional = c.sfAgreementOnboardingInitialAdditional,
	}
end

function FullTargetTable.makeFullTargetTableSchema(config: {
	fieldsMap: FullTargetTableFieldsMap?,
	fieldKeysInOrder: {string}?,
	label: string?,
}?): FullTargetTableSchema
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

function FullTargetTable.encodeJsonFullTargetTableSfBeneficialownerFields(sf: FullTargetTableSfBeneficialownerFields): {[string]: any}
	local result: {[string]: any} = {}
	result.sfBeneficialOwnerNullWebsiteC = encodeOptionalStringType(sf.sfBeneficialOwnerNullWebsiteC)
	result.sfBeneficialOwnerNullNonUSTaxIDCountryC = encodeOptionalStringType(sf.sfBeneficialOwnerNullNonUSTaxIDCountryC)
	result.sfBeneficialOwnerNullTCGGlobalIdC = encodeOptionalStringType(sf.sfBeneficialOwnerNullTCGGlobalIdC)
	result.sfBeneficialOwnerNullLastModifiedById = encodeOptionalStringType(sf.sfBeneficialOwnerNullLastModifiedById)
	result.anduinBeneficialOwnerNullInvestorRegisteredFullAddress = encodeOptionalStringType(sf.anduinBeneficialOwnerNullInvestorRegisteredFullAddress)
	result.sfBeneficialOwnerNullFirstName = encodeOptionalStringType(sf.sfBeneficialOwnerNullFirstName)
	result.sfBeneficialOwnerNullName = encodeOptionalStringType(sf.sfBeneficialOwnerNullName)
	result.sfBeneficialOwnerNullInvestorRegisteredStateProvinceC = encodeOptionalStringType(sf.sfBeneficialOwnerNullInvestorRegisteredStateProvinceC)
	result.sfBeneficialOwnerNullUSTaxIDC = encodeOptionalStringType(sf.sfBeneficialOwnerNullUSTaxIDC)
	result.sfBeneficialOwnerNullOwnerId = encodeOptionalStringType(sf.sfBeneficialOwnerNullOwnerId)
	result.sfBeneficialOwnerNullMiddleNameC = encodeOptionalStringType(sf.sfBeneficialOwnerNullMiddleNameC)
	result.sfBeneficialOwnerNullInvestorRegisteredCountryC = encodeOptionalStringType(sf.sfBeneficialOwnerNullInvestorRegisteredCountryC)
	result.sfBeneficialOwnerNullAMLRefreshNotesC = encodeOptionalStringType(sf.sfBeneficialOwnerNullAMLRefreshNotesC)
	result.sfBeneficialOwnerNullGovernmentIssuedIDOnFileC = encodeOptionalStringType(sf.sfBeneficialOwnerNullGovernmentIssuedIDOnFileC)
	result.sfBeneficialOwnerNullAMLMonitoringC = encodeOptionalMultipleCheckboxType(sf.sfBeneficialOwnerNullAMLMonitoringC)
	result.sfBeneficialOwnerNullIndividualOrganizationC = encodeOptionalStringType(sf.sfBeneficialOwnerNullIndividualOrganizationC)
	result.sfBeneficialOwnerNullCountryOfBirthC = encodeOptionalStringType(sf.sfBeneficialOwnerNullCountryOfBirthC)
	result.sfBeneficialOwnerNullPoliticallyExposedPersonC = encodeOptionalMultipleCheckboxType(sf.sfBeneficialOwnerNullPoliticallyExposedPersonC)
	result.sfBeneficialOwnerNullPercentageOfOwnershipC = encodeOptionalStringType(sf.sfBeneficialOwnerNullPercentageOfOwnershipC)
	result.sfBeneficialOwnerNullGovernmentIDNumberC = encodeOptionalStringType(sf.sfBeneficialOwnerNullGovernmentIDNumberC)
	result.sfBeneficialOwnerNullGovernmentIDCountryC = encodeOptionalStringType(sf.sfBeneficialOwnerNullGovernmentIDCountryC)
	result.sfBeneficialOwnerNullGovernmentIDExpirationDateC = encodeOptionalStringType(sf.sfBeneficialOwnerNullGovernmentIDExpirationDateC)
	result.sfBeneficialOwnerNullIsActiveC = encodeOptionalMultipleCheckboxType(sf.sfBeneficialOwnerNullIsActiveC)
	result.sfBeneficialOwnerNullNonUSTaxIDC = encodeOptionalStringType(sf.sfBeneficialOwnerNullNonUSTaxIDC)
	result.sfBeneficialOwnerNullLastName = encodeOptionalStringType(sf.sfBeneficialOwnerNullLastName)
	result.sfBeneficialOwnerNullBeneficialOwnerLongNameC = encodeOptionalStringType(sf.sfBeneficialOwnerNullBeneficialOwnerLongNameC)
	result.sfBeneficialOwnerNullKYCRefreshC = encodeOptionalMultipleCheckboxType(sf.sfBeneficialOwnerNullKYCRefreshC)
	result.sfBeneficialOwnerNullPEPStatusC = encodeOptionalStringType(sf.sfBeneficialOwnerNullPEPStatusC)
	result.sfBeneficialOwnerNullInvestorRegisteredPostalCodeC = encodeOptionalStringType(sf.sfBeneficialOwnerNullInvestorRegisteredPostalCodeC)
	result.sfBeneficialOwnerNullUSTaxIDTypeC = encodeOptionalStringType(sf.sfBeneficialOwnerNullUSTaxIDTypeC)
	result.sfBeneficialOwnerNullInvestorRegisteredStreetAddressC = encodeOptionalStringType(sf.sfBeneficialOwnerNullInvestorRegisteredStreetAddressC)
	result.sfBeneficialOwnerNullDateOfBirthC = encodeOptionalStringType(sf.sfBeneficialOwnerNullDateOfBirthC)
	result.sfBeneficialOwnerNullLastTriggeredTimestampC = encodeOptionalStringType(sf.sfBeneficialOwnerNullLastTriggeredTimestampC)
	result.sfBeneficialOwnerNullRiskRatingC = encodeOptionalStringType(sf.sfBeneficialOwnerNullRiskRatingC)
	result.sfBeneficialOwnerNullInvestorRegisteredCityC = encodeOptionalStringType(sf.sfBeneficialOwnerNullInvestorRegisteredCityC)
	result.sfBeneficialOwnerNullSourceOfWealthC = encodeOptionalStringType(sf.sfBeneficialOwnerNullSourceOfWealthC)
	result.sfBeneficialOwnerNullAMLNotesC = encodeOptionalStringType(sf.sfBeneficialOwnerNullAMLNotesC)
	result.sfBeneficialOwnerNullMaxComplyIdC = encodeOptionalStringType(sf.sfBeneficialOwnerNullMaxComplyIdC)
	result.sfBeneficialOwnerNullBeneficialCountryC = encodeOptionalStringType(sf.sfBeneficialOwnerNullBeneficialCountryC)
	result.sfBeneficialOwnerNullCreatedById = encodeOptionalStringType(sf.sfBeneficialOwnerNullCreatedById)
	result.sfBeneficialOwnerNullGovernmentIDJurisdictionStateC = encodeOptionalStringType(sf.sfBeneficialOwnerNullGovernmentIDJurisdictionStateC)
	return result
end

function FullTargetTable.decodeJsonFullTargetTableSfBeneficialownerFields(json: {[string]: any}): FullTargetTableSfBeneficialownerFields
	return {
		sfBeneficialOwnerNullWebsiteC = decodeOptionalStringType(json.sfBeneficialOwnerNullWebsiteC),
		sfBeneficialOwnerNullNonUSTaxIDCountryC = decodeOptionalStringType(json.sfBeneficialOwnerNullNonUSTaxIDCountryC),
		sfBeneficialOwnerNullTCGGlobalIdC = decodeOptionalStringType(json.sfBeneficialOwnerNullTCGGlobalIdC),
		sfBeneficialOwnerNullLastModifiedById = decodeOptionalStringType(json.sfBeneficialOwnerNullLastModifiedById),
		anduinBeneficialOwnerNullInvestorRegisteredFullAddress = decodeOptionalStringType(json.anduinBeneficialOwnerNullInvestorRegisteredFullAddress),
		sfBeneficialOwnerNullFirstName = decodeOptionalStringType(json.sfBeneficialOwnerNullFirstName),
		sfBeneficialOwnerNullName = decodeOptionalStringType(json.sfBeneficialOwnerNullName),
		sfBeneficialOwnerNullInvestorRegisteredStateProvinceC = decodeOptionalStringType(json.sfBeneficialOwnerNullInvestorRegisteredStateProvinceC),
		sfBeneficialOwnerNullUSTaxIDC = decodeOptionalStringType(json.sfBeneficialOwnerNullUSTaxIDC),
		sfBeneficialOwnerNullOwnerId = decodeOptionalStringType(json.sfBeneficialOwnerNullOwnerId),
		sfBeneficialOwnerNullMiddleNameC = decodeOptionalStringType(json.sfBeneficialOwnerNullMiddleNameC),
		sfBeneficialOwnerNullInvestorRegisteredCountryC = decodeOptionalStringType(json.sfBeneficialOwnerNullInvestorRegisteredCountryC),
		sfBeneficialOwnerNullAMLRefreshNotesC = decodeOptionalStringType(json.sfBeneficialOwnerNullAMLRefreshNotesC),
		sfBeneficialOwnerNullGovernmentIssuedIDOnFileC = decodeOptionalStringType(json.sfBeneficialOwnerNullGovernmentIssuedIDOnFileC),
		sfBeneficialOwnerNullAMLMonitoringC = decodeOptionalMultipleCheckboxType(json.sfBeneficialOwnerNullAMLMonitoringC),
		sfBeneficialOwnerNullIndividualOrganizationC = decodeOptionalStringType(json.sfBeneficialOwnerNullIndividualOrganizationC),
		sfBeneficialOwnerNullCountryOfBirthC = decodeOptionalStringType(json.sfBeneficialOwnerNullCountryOfBirthC),
		sfBeneficialOwnerNullPoliticallyExposedPersonC = decodeOptionalMultipleCheckboxType(json.sfBeneficialOwnerNullPoliticallyExposedPersonC),
		sfBeneficialOwnerNullPercentageOfOwnershipC = decodeOptionalStringType(json.sfBeneficialOwnerNullPercentageOfOwnershipC),
		sfBeneficialOwnerNullGovernmentIDNumberC = decodeOptionalStringType(json.sfBeneficialOwnerNullGovernmentIDNumberC),
		sfBeneficialOwnerNullGovernmentIDCountryC = decodeOptionalStringType(json.sfBeneficialOwnerNullGovernmentIDCountryC),
		sfBeneficialOwnerNullGovernmentIDExpirationDateC = decodeOptionalStringType(json.sfBeneficialOwnerNullGovernmentIDExpirationDateC),
		sfBeneficialOwnerNullIsActiveC = decodeOptionalMultipleCheckboxType(json.sfBeneficialOwnerNullIsActiveC),
		sfBeneficialOwnerNullNonUSTaxIDC = decodeOptionalStringType(json.sfBeneficialOwnerNullNonUSTaxIDC),
		sfBeneficialOwnerNullLastName = decodeOptionalStringType(json.sfBeneficialOwnerNullLastName),
		sfBeneficialOwnerNullBeneficialOwnerLongNameC = decodeOptionalStringType(json.sfBeneficialOwnerNullBeneficialOwnerLongNameC),
		sfBeneficialOwnerNullKYCRefreshC = decodeOptionalMultipleCheckboxType(json.sfBeneficialOwnerNullKYCRefreshC),
		sfBeneficialOwnerNullPEPStatusC = decodeOptionalStringType(json.sfBeneficialOwnerNullPEPStatusC),
		sfBeneficialOwnerNullInvestorRegisteredPostalCodeC = decodeOptionalStringType(json.sfBeneficialOwnerNullInvestorRegisteredPostalCodeC),
		sfBeneficialOwnerNullUSTaxIDTypeC = decodeOptionalStringType(json.sfBeneficialOwnerNullUSTaxIDTypeC),
		sfBeneficialOwnerNullInvestorRegisteredStreetAddressC = decodeOptionalStringType(json.sfBeneficialOwnerNullInvestorRegisteredStreetAddressC),
		sfBeneficialOwnerNullDateOfBirthC = decodeOptionalStringType(json.sfBeneficialOwnerNullDateOfBirthC),
		sfBeneficialOwnerNullLastTriggeredTimestampC = decodeOptionalStringType(json.sfBeneficialOwnerNullLastTriggeredTimestampC),
		sfBeneficialOwnerNullRiskRatingC = decodeOptionalStringType(json.sfBeneficialOwnerNullRiskRatingC),
		sfBeneficialOwnerNullInvestorRegisteredCityC = decodeOptionalStringType(json.sfBeneficialOwnerNullInvestorRegisteredCityC),
		sfBeneficialOwnerNullSourceOfWealthC = decodeOptionalStringType(json.sfBeneficialOwnerNullSourceOfWealthC),
		sfBeneficialOwnerNullAMLNotesC = decodeOptionalStringType(json.sfBeneficialOwnerNullAMLNotesC),
		sfBeneficialOwnerNullMaxComplyIdC = decodeOptionalStringType(json.sfBeneficialOwnerNullMaxComplyIdC),
		sfBeneficialOwnerNullBeneficialCountryC = decodeOptionalStringType(json.sfBeneficialOwnerNullBeneficialCountryC),
		sfBeneficialOwnerNullCreatedById = decodeOptionalStringType(json.sfBeneficialOwnerNullCreatedById),
		sfBeneficialOwnerNullGovernmentIDJurisdictionStateC = decodeOptionalStringType(json.sfBeneficialOwnerNullGovernmentIDJurisdictionStateC),
	}
end

function FullTargetTable.encodeJsonFullTargetTableSfBeneficialownerType(t: FullTargetTableSfBeneficialownerType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = FullTargetTable.encodeJsonFullTargetTableSfBeneficialownerFields(t.valueSubFields)
	end
	return result
end

function FullTargetTable.decodeJsonFullTargetTableSfBeneficialownerType(json: {[string]: any}): FullTargetTableSfBeneficialownerType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then FullTargetTable.decodeJsonFullTargetTableSfBeneficialownerFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function FullTargetTable.encodeJsonFullTargetTableSfContactFields(sf: FullTargetTableSfContactFields): {[string]: any}
	local result: {[string]: any} = {}
	result.sfContactNullMailingAddress = encodeOptionalStringType(sf.sfContactNullMailingAddress)
	result.sfContactNullAccountId = encodeOptionalStringType(sf.sfContactNullAccountId)
	result.sfContactNullOpBusinessPhoneC = encodeOptionalStringType(sf.sfContactNullOpBusinessPhoneC)
	result.sfContactIFCWireApproverC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCWireApproverC)
	result.sfContactNullMailingStreet = encodeOptionalStringType(sf.sfContactNullMailingStreet)
	result.sfContactNullMailingState = encodeOptionalStringType(sf.sfContactNullMailingState)
	result.sfContactNullMailingPostalCode = encodeOptionalStringType(sf.sfContactNullMailingPostalCode)
	result.sfContactIFCTaxAdvisorC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCTaxAdvisorC)
	result.sfContactIFCTaxInformationNotC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCTaxInformationNotC)
	result.sfContactIFCCapitalCallManagementNotC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCCapitalCallManagementNotC)
	result.sfContactIFCLegalInformationNotC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCLegalInformationNotC)
	result.sfContactNullMailingCity = encodeOptionalStringType(sf.sfContactNullMailingCity)
	result.sfContactNullOpEmailPrimaryC = encodeOptionalStringType(sf.sfContactNullOpEmailPrimaryC)
	result.sfContactIFCAMLKYCContactC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCAMLKYCContactC)
	result.anduinContactRole = encodeOptionalMultipleCheckboxType(sf.anduinContactRole)
	result.sfContactNullMiddleNameC = encodeOptionalStringType(sf.sfContactNullMiddleNameC)
	result.sfContactNullName = encodeOptionalStringType(sf.sfContactNullName)
	result.sfContactNullSalutation = encodeOptionalStringType(sf.sfContactNullSalutation)
	result.sfContactIFCNotificationsNotC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCNotificationsNotC)
	result.sfContactIFCDistributionManagementNotC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCDistributionManagementNotC)
	result.sfContactNullFirstName = encodeOptionalStringType(sf.sfContactNullFirstName)
	result.sfContactIFCFinanceContactC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCFinanceContactC)
	result.sfContactIFCLegalAdvisorC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCLegalAdvisorC)
	result.sfContactIFCPrimaryContactC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCPrimaryContactC)
	result.anduinContactNotification = encodeOptionalMultipleCheckboxType(sf.anduinContactNotification)
	result.sfContactIFCNotificationsC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCNotificationsC)
	result.sfContactNullEmailFundraising = encodeOptionalStringType(sf.sfContactNullEmailFundraising)
	result.sfContactIFCFinancialReportingNotC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCFinancialReportingNotC)
	result.sfContactNullFax = encodeOptionalStringType(sf.sfContactNullFax)
	result.sfContactNullTCGGlobalIdC = encodeOptionalStringType(sf.sfContactNullTCGGlobalIdC)
	result.sfContactIFCSecondaryContactC = encodeOptionalMultipleCheckboxType(sf.sfContactIFCSecondaryContactC)
	result.sfContactNullLastName = encodeOptionalStringType(sf.sfContactNullLastName)
	result.sfContactNullMailingCountry = encodeOptionalStringType(sf.sfContactNullMailingCountry)
	result.sfContactNullBusinessPhone = encodeOptionalStringType(sf.sfContactNullBusinessPhone)
	return result
end

function FullTargetTable.decodeJsonFullTargetTableSfContactFields(json: {[string]: any}): FullTargetTableSfContactFields
	return {
		sfContactNullMailingAddress = decodeOptionalStringType(json.sfContactNullMailingAddress),
		sfContactNullAccountId = decodeOptionalStringType(json.sfContactNullAccountId),
		sfContactNullOpBusinessPhoneC = decodeOptionalStringType(json.sfContactNullOpBusinessPhoneC),
		sfContactIFCWireApproverC = decodeOptionalMultipleCheckboxType(json.sfContactIFCWireApproverC),
		sfContactNullMailingStreet = decodeOptionalStringType(json.sfContactNullMailingStreet),
		sfContactNullMailingState = decodeOptionalStringType(json.sfContactNullMailingState),
		sfContactNullMailingPostalCode = decodeOptionalStringType(json.sfContactNullMailingPostalCode),
		sfContactIFCTaxAdvisorC = decodeOptionalMultipleCheckboxType(json.sfContactIFCTaxAdvisorC),
		sfContactIFCTaxInformationNotC = decodeOptionalMultipleCheckboxType(json.sfContactIFCTaxInformationNotC),
		sfContactIFCCapitalCallManagementNotC = decodeOptionalMultipleCheckboxType(json.sfContactIFCCapitalCallManagementNotC),
		sfContactIFCLegalInformationNotC = decodeOptionalMultipleCheckboxType(json.sfContactIFCLegalInformationNotC),
		sfContactNullMailingCity = decodeOptionalStringType(json.sfContactNullMailingCity),
		sfContactNullOpEmailPrimaryC = decodeOptionalStringType(json.sfContactNullOpEmailPrimaryC),
		sfContactIFCAMLKYCContactC = decodeOptionalMultipleCheckboxType(json.sfContactIFCAMLKYCContactC),
		anduinContactRole = decodeOptionalMultipleCheckboxType(json.anduinContactRole),
		sfContactNullMiddleNameC = decodeOptionalStringType(json.sfContactNullMiddleNameC),
		sfContactNullName = decodeOptionalStringType(json.sfContactNullName),
		sfContactNullSalutation = decodeOptionalStringType(json.sfContactNullSalutation),
		sfContactIFCNotificationsNotC = decodeOptionalMultipleCheckboxType(json.sfContactIFCNotificationsNotC),
		sfContactIFCDistributionManagementNotC = decodeOptionalMultipleCheckboxType(json.sfContactIFCDistributionManagementNotC),
		sfContactNullFirstName = decodeOptionalStringType(json.sfContactNullFirstName),
		sfContactIFCFinanceContactC = decodeOptionalMultipleCheckboxType(json.sfContactIFCFinanceContactC),
		sfContactIFCLegalAdvisorC = decodeOptionalMultipleCheckboxType(json.sfContactIFCLegalAdvisorC),
		sfContactIFCPrimaryContactC = decodeOptionalMultipleCheckboxType(json.sfContactIFCPrimaryContactC),
		anduinContactNotification = decodeOptionalMultipleCheckboxType(json.anduinContactNotification),
		sfContactIFCNotificationsC = decodeOptionalMultipleCheckboxType(json.sfContactIFCNotificationsC),
		sfContactNullEmailFundraising = decodeOptionalStringType(json.sfContactNullEmailFundraising),
		sfContactIFCFinancialReportingNotC = decodeOptionalMultipleCheckboxType(json.sfContactIFCFinancialReportingNotC),
		sfContactNullFax = decodeOptionalStringType(json.sfContactNullFax),
		sfContactNullTCGGlobalIdC = decodeOptionalStringType(json.sfContactNullTCGGlobalIdC),
		sfContactIFCSecondaryContactC = decodeOptionalMultipleCheckboxType(json.sfContactIFCSecondaryContactC),
		sfContactNullLastName = decodeOptionalStringType(json.sfContactNullLastName),
		sfContactNullMailingCountry = decodeOptionalStringType(json.sfContactNullMailingCountry),
		sfContactNullBusinessPhone = decodeOptionalStringType(json.sfContactNullBusinessPhone),
	}
end

function FullTargetTable.encodeJsonFullTargetTableSfContactType(t: FullTargetTableSfContactType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = FullTargetTable.encodeJsonFullTargetTableSfContactFields(t.valueSubFields)
	end
	return result
end

function FullTargetTable.decodeJsonFullTargetTableSfContactType(json: {[string]: any}): FullTargetTableSfContactType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then FullTargetTable.decodeJsonFullTargetTableSfContactFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function FullTargetTable.encodeJsonFullTargetTableSfControllingpersonsFields(sf: FullTargetTableSfControllingpersonsFields): {[string]: any}
	local result: {[string]: any} = {}
	result.sfControllingPersonsNullTINUnavailableC = encodeOptionalStringType(sf.sfControllingPersonsNullTINUnavailableC)
	result.sfControllingPersonsNullMailingStateC = encodeOptionalStringType(sf.sfControllingPersonsNullMailingStateC)
	result.sfControllingPersonsNullMailingCityC = encodeOptionalStringType(sf.sfControllingPersonsNullMailingCityC)
	result.sfControllingPersonsNullDateOfBirthC = encodeOptionalStringType(sf.sfControllingPersonsNullDateOfBirthC)
	result.sfControllingPersonsNullFirstNameC = encodeOptionalStringType(sf.sfControllingPersonsNullFirstNameC)
	result.sfControllingPersonsNullSubscriptionInvestorC = encodeOptionalStringType(sf.sfControllingPersonsNullSubscriptionInvestorC)
	result.sfControllingPersonsNullCRSDocumentIDC = encodeOptionalStringType(sf.sfControllingPersonsNullCRSDocumentIDC)
	result.sfControllingPersonsNullSubscriptionInvestorIDC = encodeOptionalStringType(sf.sfControllingPersonsNullSubscriptionInvestorIDC)
	result.sfControllingPersonsNullResidenceCountryC = encodeOptionalStringType(sf.sfControllingPersonsNullResidenceCountryC)
	result.sfControllingPersonsNullTINCountryNo5C = encodeOptionalStringType(sf.sfControllingPersonsNullTINCountryNo5C)
	result.sfControllingPersonsNullCountryOfBirthC = encodeOptionalStringType(sf.sfControllingPersonsNullCountryOfBirthC)
	result.sfControllingPersonsNullEffectiveDateC = encodeOptionalStringType(sf.sfControllingPersonsNullEffectiveDateC)
	result.sfControllingPersonsNullMailingAddress2C = encodeOptionalStringType(sf.sfControllingPersonsNullMailingAddress2C)
	result.sfControllingPersonsNullMailingCountryC = encodeOptionalStringType(sf.sfControllingPersonsNullMailingCountryC)
	result.sfControllingPersonsNullMiddleNameC = encodeOptionalStringType(sf.sfControllingPersonsNullMiddleNameC)
	result.sfControllingPersonsNullTINNo5C = encodeOptionalStringType(sf.sfControllingPersonsNullTINNo5C)
	result.sfControllingPersonsNullMailingPostalCodeC = encodeOptionalStringType(sf.sfControllingPersonsNullMailingPostalCodeC)
	result.sfControllingPersonsNullTINNo1C = encodeOptionalStringType(sf.sfControllingPersonsNullTINNo1C)
	result.sfControllingPersonsNullTINCountryNo3C = encodeOptionalStringType(sf.sfControllingPersonsNullTINCountryNo3C)
	result.sfControllingPersonsNullReportingCountriesC = encodeOptionalStringType(sf.sfControllingPersonsNullReportingCountriesC)
	result.sfControllingPersonsNullResidencePostalCodeC = encodeOptionalStringType(sf.sfControllingPersonsNullResidencePostalCodeC)
	result.sfControllingPersonsNullLastNameC = encodeOptionalStringType(sf.sfControllingPersonsNullLastNameC)
	result.sfControllingPersonsNullTypeC = encodeOptionalStringType(sf.sfControllingPersonsNullTypeC)
	result.sfControllingPersonsNullResidenceStateC = encodeOptionalStringType(sf.sfControllingPersonsNullResidenceStateC)
	result.sfControllingPersonsNullType2C = encodeOptionalStringType(sf.sfControllingPersonsNullType2C)
	result.sfControllingPersonsNullTINNo4C = encodeOptionalStringType(sf.sfControllingPersonsNullTINNo4C)
	result.sfControllingPersonsNullResidenceStreetC = encodeOptionalStringType(sf.sfControllingPersonsNullResidenceStreetC)
	result.sfControllingPersonsNullControllingPersonPackageC = encodeOptionalStringType(sf.sfControllingPersonsNullControllingPersonPackageC)
	result.sfControllingPersonsNullCRSReportingThresholdC = encodeOptionalStringType(sf.sfControllingPersonsNullCRSReportingThresholdC)
	result.sfControllingPersonsNullTINCountryNo4C = encodeOptionalStringType(sf.sfControllingPersonsNullTINCountryNo4C)
	result.sfControllingPersonsNullTINNo2C = encodeOptionalStringType(sf.sfControllingPersonsNullTINNo2C)
	result.sfControllingPersonsNullInactiveC = encodeOptionalMultipleCheckboxType(sf.sfControllingPersonsNullInactiveC)
	result.sfControllingPersonsNullResidenceCityC = encodeOptionalStringType(sf.sfControllingPersonsNullResidenceCityC)
	result.sfControllingPersonsNullType3C = encodeOptionalStringType(sf.sfControllingPersonsNullType3C)
	result.sfControllingPersonsNullTINNo3C = encodeOptionalStringType(sf.sfControllingPersonsNullTINNo3C)
	result.sfControllingPersonsNullTINCountryNo1C = encodeOptionalStringType(sf.sfControllingPersonsNullTINCountryNo1C)
	result.sfControllingPersonsNullPlaceOfBirthC = encodeOptionalStringType(sf.sfControllingPersonsNullPlaceOfBirthC)
	result.sfControllingPersonsNullMailingStreetC = encodeOptionalStringType(sf.sfControllingPersonsNullMailingStreetC)
	result.sfControllingPersonsNullCRSValidationResultC = encodeOptionalStringType(sf.sfControllingPersonsNullCRSValidationResultC)
	result.sfControllingPersonsNullTINCountryNo2C = encodeOptionalStringType(sf.sfControllingPersonsNullTINCountryNo2C)
	result.sfControllingPersonsNullResidenceAddress2C = encodeOptionalStringType(sf.sfControllingPersonsNullResidenceAddress2C)
	result.sfControllingPersonsNullCRSStatusC = encodeOptionalStringType(sf.sfControllingPersonsNullCRSStatusC)
	result.sfControllingPersonsNullName = encodeOptionalStringType(sf.sfControllingPersonsNullName)
	result.sfControllingPersonsNullTaxStatusC = encodeOptionalStringType(sf.sfControllingPersonsNullTaxStatusC)
	return result
end

function FullTargetTable.decodeJsonFullTargetTableSfControllingpersonsFields(json: {[string]: any}): FullTargetTableSfControllingpersonsFields
	return {
		sfControllingPersonsNullTINUnavailableC = decodeOptionalStringType(json.sfControllingPersonsNullTINUnavailableC),
		sfControllingPersonsNullMailingStateC = decodeOptionalStringType(json.sfControllingPersonsNullMailingStateC),
		sfControllingPersonsNullMailingCityC = decodeOptionalStringType(json.sfControllingPersonsNullMailingCityC),
		sfControllingPersonsNullDateOfBirthC = decodeOptionalStringType(json.sfControllingPersonsNullDateOfBirthC),
		sfControllingPersonsNullFirstNameC = decodeOptionalStringType(json.sfControllingPersonsNullFirstNameC),
		sfControllingPersonsNullSubscriptionInvestorC = decodeOptionalStringType(json.sfControllingPersonsNullSubscriptionInvestorC),
		sfControllingPersonsNullCRSDocumentIDC = decodeOptionalStringType(json.sfControllingPersonsNullCRSDocumentIDC),
		sfControllingPersonsNullSubscriptionInvestorIDC = decodeOptionalStringType(json.sfControllingPersonsNullSubscriptionInvestorIDC),
		sfControllingPersonsNullResidenceCountryC = decodeOptionalStringType(json.sfControllingPersonsNullResidenceCountryC),
		sfControllingPersonsNullTINCountryNo5C = decodeOptionalStringType(json.sfControllingPersonsNullTINCountryNo5C),
		sfControllingPersonsNullCountryOfBirthC = decodeOptionalStringType(json.sfControllingPersonsNullCountryOfBirthC),
		sfControllingPersonsNullEffectiveDateC = decodeOptionalStringType(json.sfControllingPersonsNullEffectiveDateC),
		sfControllingPersonsNullMailingAddress2C = decodeOptionalStringType(json.sfControllingPersonsNullMailingAddress2C),
		sfControllingPersonsNullMailingCountryC = decodeOptionalStringType(json.sfControllingPersonsNullMailingCountryC),
		sfControllingPersonsNullMiddleNameC = decodeOptionalStringType(json.sfControllingPersonsNullMiddleNameC),
		sfControllingPersonsNullTINNo5C = decodeOptionalStringType(json.sfControllingPersonsNullTINNo5C),
		sfControllingPersonsNullMailingPostalCodeC = decodeOptionalStringType(json.sfControllingPersonsNullMailingPostalCodeC),
		sfControllingPersonsNullTINNo1C = decodeOptionalStringType(json.sfControllingPersonsNullTINNo1C),
		sfControllingPersonsNullTINCountryNo3C = decodeOptionalStringType(json.sfControllingPersonsNullTINCountryNo3C),
		sfControllingPersonsNullReportingCountriesC = decodeOptionalStringType(json.sfControllingPersonsNullReportingCountriesC),
		sfControllingPersonsNullResidencePostalCodeC = decodeOptionalStringType(json.sfControllingPersonsNullResidencePostalCodeC),
		sfControllingPersonsNullLastNameC = decodeOptionalStringType(json.sfControllingPersonsNullLastNameC),
		sfControllingPersonsNullTypeC = decodeOptionalStringType(json.sfControllingPersonsNullTypeC),
		sfControllingPersonsNullResidenceStateC = decodeOptionalStringType(json.sfControllingPersonsNullResidenceStateC),
		sfControllingPersonsNullType2C = decodeOptionalStringType(json.sfControllingPersonsNullType2C),
		sfControllingPersonsNullTINNo4C = decodeOptionalStringType(json.sfControllingPersonsNullTINNo4C),
		sfControllingPersonsNullResidenceStreetC = decodeOptionalStringType(json.sfControllingPersonsNullResidenceStreetC),
		sfControllingPersonsNullControllingPersonPackageC = decodeOptionalStringType(json.sfControllingPersonsNullControllingPersonPackageC),
		sfControllingPersonsNullCRSReportingThresholdC = decodeOptionalStringType(json.sfControllingPersonsNullCRSReportingThresholdC),
		sfControllingPersonsNullTINCountryNo4C = decodeOptionalStringType(json.sfControllingPersonsNullTINCountryNo4C),
		sfControllingPersonsNullTINNo2C = decodeOptionalStringType(json.sfControllingPersonsNullTINNo2C),
		sfControllingPersonsNullInactiveC = decodeOptionalMultipleCheckboxType(json.sfControllingPersonsNullInactiveC),
		sfControllingPersonsNullResidenceCityC = decodeOptionalStringType(json.sfControllingPersonsNullResidenceCityC),
		sfControllingPersonsNullType3C = decodeOptionalStringType(json.sfControllingPersonsNullType3C),
		sfControllingPersonsNullTINNo3C = decodeOptionalStringType(json.sfControllingPersonsNullTINNo3C),
		sfControllingPersonsNullTINCountryNo1C = decodeOptionalStringType(json.sfControllingPersonsNullTINCountryNo1C),
		sfControllingPersonsNullPlaceOfBirthC = decodeOptionalStringType(json.sfControllingPersonsNullPlaceOfBirthC),
		sfControllingPersonsNullMailingStreetC = decodeOptionalStringType(json.sfControllingPersonsNullMailingStreetC),
		sfControllingPersonsNullCRSValidationResultC = decodeOptionalStringType(json.sfControllingPersonsNullCRSValidationResultC),
		sfControllingPersonsNullTINCountryNo2C = decodeOptionalStringType(json.sfControllingPersonsNullTINCountryNo2C),
		sfControllingPersonsNullResidenceAddress2C = decodeOptionalStringType(json.sfControllingPersonsNullResidenceAddress2C),
		sfControllingPersonsNullCRSStatusC = decodeOptionalStringType(json.sfControllingPersonsNullCRSStatusC),
		sfControllingPersonsNullName = decodeOptionalStringType(json.sfControllingPersonsNullName),
		sfControllingPersonsNullTaxStatusC = decodeOptionalStringType(json.sfControllingPersonsNullTaxStatusC),
	}
end

function FullTargetTable.encodeJsonFullTargetTableSfControllingpersonsType(t: FullTargetTableSfControllingpersonsType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = FullTargetTable.encodeJsonFullTargetTableSfControllingpersonsFields(t.valueSubFields)
	end
	return result
end

function FullTargetTable.decodeJsonFullTargetTableSfControllingpersonsType(json: {[string]: any}): FullTargetTableSfControllingpersonsType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then FullTargetTable.decodeJsonFullTargetTableSfControllingpersonsFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function FullTargetTable.encodeJsonFullTargetTableSfFundSelectionFields(sf: FullTargetTableSfFundSelectionFields): {[string]: any}
	local result: {[string]: any} = {}
	result.SubFundGlobalId = encodeOptionalStringType(sf.SubFundGlobalId)
	result.CommitmentAmount = encodeOptionalStringType(sf.CommitmentAmount)
	return result
end

function FullTargetTable.decodeJsonFullTargetTableSfFundSelectionFields(json: {[string]: any}): FullTargetTableSfFundSelectionFields
	return {
		SubFundGlobalId = decodeOptionalStringType(json.SubFundGlobalId),
		CommitmentAmount = decodeOptionalStringType(json.CommitmentAmount),
	}
end

function FullTargetTable.encodeJsonFullTargetTableSfFundSelectionType(t: FullTargetTableSfFundSelectionType): {[string]: any}
	local result: {[string]: any} = {
		typeId = t.typeId,
		subFieldKeysInOrder = t.subFieldKeysInOrder,
	}
	if t.label ~= nil then
		result.label = t.label
	end
	if t.valueSubFields ~= nil then
		result.valueSubFields = FullTargetTable.encodeJsonFullTargetTableSfFundSelectionFields(t.valueSubFields)
	end
	return result
end

function FullTargetTable.decodeJsonFullTargetTableSfFundSelectionType(json: {[string]: any}): FullTargetTableSfFundSelectionType
	return {
		typeId = json.typeId or "",
		valueSubFields = if json.valueSubFields then FullTargetTable.decodeJsonFullTargetTableSfFundSelectionFields(json.valueSubFields) else nil,
		subFieldKeysInOrder = json.subFieldKeysInOrder or {},
		label = json.label,
	}
end

function FullTargetTable.encodeJsonFullTargetTableFieldsMap(f: FullTargetTableFieldsMap): {[string]: any}
	local sfFundSelectionEncoded: {any} = {}
	for _, item in f.sfFundSelection do
		table.insert(sfFundSelectionEncoded, FullTargetTable.encodeJsonFullTargetTableSfFundSelectionType(item))
	end
	local sfBeneficialOwnerEncoded: {any} = {}
	for _, item in f.sfBeneficialOwner do
		table.insert(sfBeneficialOwnerEncoded, FullTargetTable.encodeJsonFullTargetTableSfBeneficialownerType(item))
	end
	local sfControllingPersonsEncoded: {any} = {}
	for _, item in f.sfControllingPersons do
		table.insert(sfControllingPersonsEncoded, FullTargetTable.encodeJsonFullTargetTableSfControllingpersonsType(item))
	end
	local sfContactEncoded: {any} = {}
	for _, item in f.sfContact do
		table.insert(sfContactEncoded, FullTargetTable.encodeJsonFullTargetTableSfContactType(item))
	end
	local result: {[string]: any} = {
		sfFundSelection = sfFundSelectionEncoded,
		sfBeneficialOwner = sfBeneficialOwnerEncoded,
		sfControllingPersons = sfControllingPersonsEncoded,
		sfContact = sfContactEncoded,
	}
	result.sfInvestorAccountNullTCGGlobalIdC = encodeOptionalStringType(f.sfInvestorAccountNullTCGGlobalIdC)
	result.sfAccountInvestorAccountTCGGlobalIdC = encodeOptionalStringType(f.sfAccountInvestorAccountTCGGlobalIdC)
	result.sfAccountCommonNameName = encodeOptionalStringType(f.sfAccountCommonNameName)
	result.sfAccountCommonNameTypeC = encodeOptionalStringType(f.sfAccountCommonNameTypeC)
	result.sfAccountCommonNameIndustry = encodeOptionalStringType(f.sfAccountCommonNameIndustry)
	result.sfAccountCommonNameBeneficialCountryFormulaC = encodeOptionalStringType(f.sfAccountCommonNameBeneficialCountryFormulaC)
	result.sfAccountCommonNameTCGGlobalIdC = encodeOptionalStringType(f.sfAccountCommonNameTCGGlobalIdC)
	result.sfAccountCommonNameAccountTeamMembersC = encodeOptionalStringType(f.sfAccountCommonNameAccountTeamMembersC)
	result.sfAccountCommonNameDescription = encodeOptionalStringType(f.sfAccountCommonNameDescription)
	result.sfAccountCommonNameBillingAddress = encodeOptionalStringType(f.sfAccountCommonNameBillingAddress)
	result.sfAccountCommonNameShippingAddress = encodeOptionalStringType(f.sfAccountCommonNameShippingAddress)
	result.sfAccountCommonNamePhone = encodeOptionalStringType(f.sfAccountCommonNamePhone)
	result.sfAccountCommonNameWebsite = encodeOptionalStringType(f.sfAccountCommonNameWebsite)
	result.sfAccountCommonNameRecordTypeId = encodeOptionalStringType(f.sfAccountCommonNameRecordTypeId)
	result.sfAccountSubscriptionInvestorName = encodeOptionalStringType(f.sfAccountSubscriptionInvestorName)
	result.sfAccountSubscriptionInvestorType = encodeOptionalStringType(f.sfAccountSubscriptionInvestorType)
	result.sfAccountSubscriptionInvestorWLCTradeNameC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWLCTradeNameC)
	result.sfAccountSubscriptionInvestorCommonNameC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorCommonNameC)
	result.sfAccountSubscriptionInvestorPhone = encodeOptionalStringType(f.sfAccountSubscriptionInvestorPhone)
	result.sfAccountSubscriptionInvestorBillingCountry = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBillingCountry)
	result.sfAccountSubscriptionInvestorBillingStreet = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBillingStreet)
	result.sfAccountSubscriptionInvestorBillingCity = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBillingCity)
	result.sfAccountSubscriptionInvestorBillingState = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBillingState)
	result.sfAccountSubscriptionInvestorBillingPostalCode = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBillingPostalCode)
	result.anduinAccountSubscriptionInvestorBillingFullAddress = encodeOptionalStringType(f.anduinAccountSubscriptionInvestorBillingFullAddress)
	result.sfAccountSubscriptionInvestorParentId = encodeOptionalStringType(f.sfAccountSubscriptionInvestorParentId)
	result.sfAccountSubscriptionInvestorParentTypeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorParentTypeC)
	result.sfAccountSubscriptionInvestorWLCOccupationC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWLCOccupationC)
	result.sfAccountSubscriptionInvestorWLCTitleC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWLCTitleC)
	result.sfAccountSubscriptionInvestorWLCEmployerNameC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWLCEmployerNameC)
	result.sfAccountSubscriptionInvestorWLCSubscribingAsARepresentativeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorWLCSubscribingAsARepresentativeC)
	result.sfAccountSubscriptionInvestorWLCSubscribingAsRepresentativeDetailsC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWLCSubscribingAsRepresentativeDetailsC)
	result.sfAccountSubscriptionInvestorIndustry = encodeOptionalStringType(f.sfAccountSubscriptionInvestorIndustry)
	result.sfAccountSubscriptionInvestorDomesticForeignC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorDomesticForeignC)
	result.sfAccountSubscriptionInvestorCitizenshipC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorCitizenshipC)
	result.sfAccountSubscriptionInvestorTCGGlobalIdC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTCGGlobalIdC)
	result.sfAccountSubscriptionInvestorHasCarlyleOnboardingC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorHasCarlyleOnboardingC)
	result.sfAccountSubscriptionInvestorHasSolutionsOnboardingC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorHasSolutionsOnboardingC)
	result.sfAccountSubscriptionInvestorDisregardedEntityC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorDisregardedEntityC)
	result.sfAccountSubscriptionInvestorIndividualOrganizationC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIndividualOrganizationC)
	result.sfAccountSubscriptionInvestorTaxCountryJurisdictionC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTaxCountryJurisdictionC)
	result.sfAccountSubscriptionInvestorStateOfTaxResidenceC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorStateOfTaxResidenceC)
	result.sfAccountSubscriptionInvestorAMLInvestorTypeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorAMLInvestorTypeC)
	result.sfAccountSubscriptionInvestorAMLAddressCityC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAMLAddressCityC)
	result.sfAccountSubscriptionInvestorAMLAddressStateProvinceC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAMLAddressStateProvinceC)
	result.sfAccountSubscriptionInvestorBeneficialOwnerTypeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBeneficialOwnerTypeC)
	result.sfAccountSubscriptionInvestorAMLAddressCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAMLAddressCountryC)
	result.sfAccountSubscriptionInvestorBeneficialCountryFormulaC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBeneficialCountryFormulaC)
	result.sfAccountSubscriptionInvestorRegulatedEntityC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorRegulatedEntityC)
	result.sfAccountSubscriptionInvestorRiskRatingC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorRiskRatingC)
	result.sfAccountSubscriptionInvestorBrokerDealerC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorBrokerDealerC)
	result.anduinAccountSubscriptionInvestorBrokerDealerC = encodeOptionalMultipleCheckboxType(f.anduinAccountSubscriptionInvestorBrokerDealerC)
	result.sfAccountSubscriptionInvestorRiskRating3NotesC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorRiskRating3NotesC)
	result.sfAccountSubscriptionInvestorBankNameC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBankNameC)
	result.sfAccountSubscriptionInvestorBankLocationC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBankLocationC)
	result.sfAccountSubscriptionInvestorRiskCommitteeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorRiskCommitteeC)
	result.sfAccountSubscriptionInvestorFINRARetailInvestorC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorFINRARetailInvestorC)
	result.sfAccountSubscriptionInvestorLuxTaxAssessmentRatingC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorLuxTaxAssessmentRatingC)
	result.sfAccountSubscriptionInvestorWebsite = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWebsite)
	result.sfAccountSubscriptionInvestorHighRiskJurisdictionC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorHighRiskJurisdictionC)
	result.sfAccountSubscriptionInvestorEligibleIntroducerLetterCertificateC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorEligibleIntroducerLetterCertificateC)
	result.sfAccountSubscriptionInvestorMediumHighRiskJurisdictionC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorMediumHighRiskJurisdictionC)
	result.sfAccountSubscriptionInvestorIntroducerLetterCertificateCommentsC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorIntroducerLetterCertificateCommentsC)
	result.sfAccountSubscriptionInvestorNomineeIntermediaryC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorNomineeIntermediaryC)
	result.sfAccountSubscriptionInvestorAMLPreClearanceC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorAMLPreClearanceC)
	result.sfAccountSubscriptionInvestorHighRiskIndustryC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorHighRiskIndustryC)
	result.sfAccountSubscriptionInvestorAMLPreClearanceFundsC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAMLPreClearanceFundsC)
	result.sfAccountSubscriptionInvestorComplexStructureC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorComplexStructureC)
	result.sfAccountSubscriptionInvestorTypeOfBlockC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTypeOfBlockC)
	result.sfAccountSubscriptionInvestorNegativeNewsC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorNegativeNewsC)
	result.sfAccountSubscriptionInvestorAccountBlockingC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorAccountBlockingC)
	result.sfAccountSubscriptionInvestorBearerSharesC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorBearerSharesC)
	result.sfAccountSubscriptionInvestorAccountBlockingDateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAccountBlockingDateC)
	result.sfAccountSubscriptionInvestorShellBankC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorShellBankC)
	result.sfAccountSubscriptionInvestorAccountBlockingRemovedDateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAccountBlockingRemovedDateC)
	result.sfAccountSubscriptionInvestorPoliticallyExposedPersonPEPC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorPoliticallyExposedPersonPEPC)
	result.sfAccountSubscriptionInvestorAMLReviewCycleC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAMLReviewCycleC)
	result.sfAccountSubscriptionInvestorPEPStatusDetailsC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorPEPStatusDetailsC)
	result.sfAccountSubscriptionInvestorNextAMLReviewDateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorNextAMLReviewDateC)
	result.sfAccountSubscriptionInvestorPEPStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorPEPStatusC)
	result.sfAccountSubscriptionInvestorMarketingMethodC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorMarketingMethodC)
	result.sfAccountSubscriptionInvestorSourceOfWealthCategoryC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorSourceOfWealthCategoryC)
	result.sfAccountSubscriptionInvestorMarketingDetailsC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorMarketingDetailsC)
	result.sfAccountSubscriptionInvestorSourceOfWealthC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorSourceOfWealthC)
	result.sfAccountSubscriptionInvestorMiFIDClientCategoryC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorMiFIDClientCategoryC)
	result.sfAccountSubscriptionInvestorSourceOfFundsCategoryC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorSourceOfFundsCategoryC)
	result.sfAccountSubscriptionInvestorSourceOfFundsDetailsC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorSourceOfFundsDetailsC)
	result.sfAccountSubscriptionInvestorSoWSoFCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorSoWSoFCountryC)
	result.sfAccountSubscriptionInvestorLegalStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorLegalStatusC)
	result.sfAccountSubscriptionInvestorHighRiskFactorsC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorHighRiskFactorsC)
	result.sfAccountSubscriptionInvestorAwarenessNexusC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAwarenessNexusC)
	result.sfAccountSubscriptionInvestorAMLNotesC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAMLNotesC)
	result.sfAccountSubscriptionInvestorApprovalStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorApprovalStatusC)
	result.sfAccountSubscriptionInvestorNameChangeApprovalStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorNameChangeApprovalStatusC)
	result.sfAccountSubscriptionInvestorAMLApproverC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAMLApproverC)
	result.sfAccountSubscriptionInvestorFMApproverC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorFMApproverC)
	result.sfAccountSubscriptionInvestorFormTypeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorFormTypeC)
	result.sfAccountSubscriptionInvestorTaxIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTaxIDC)
	result.sfAccountSubscriptionInvestorFMTaxIdC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorFMTaxIdC)
	result.sfAccountSubscriptionInvestorEquityTaxIdC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorEquityTaxIdC)
	result.sfAccountSubscriptionInvestorTaxEntityTypeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTaxEntityTypeC)
	result.sfAccountSubscriptionInvestorTaxStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTaxStatusC)
	result.sfAccountSubscriptionInvestorFATCAStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorFATCAStatusC)
	result.sfAccountSubscriptionInvestorUSTINTypeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorUSTINTypeC)
	result.sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberC)
	result.sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberCountryC)
	result.sfAccountSubscriptionInvestorWithholdingForeignPartnershipEINC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWithholdingForeignPartnershipEINC)
	result.sfAccountSubscriptionInvestorTaxResidencyCertificatesC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTaxResidencyCertificatesC)
	result.sfAccountSubscriptionInvestorSponsoringEntityGIINC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorSponsoringEntityGIINC)
	result.sfAccountSubscriptionInvestorW9OtherEntityTypeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorW9OtherEntityTypeC)
	result.sfAccountSubscriptionInvestorAccountOpeningDateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAccountOpeningDateC)
	result.sfAccountSubscriptionInvestorJointAccountNameC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorJointAccountNameC)
	result.sfAccountSubscriptionInvestorTreatyCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTreatyCountryC)
	result.sfAccountSubscriptionInvestorCountryOfBirthC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorCountryOfBirthC)
	result.sfAccountSubscriptionInvestorCitizenshipCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorCitizenshipCountryC)
	result.sfAccountSubscriptionInvestorCountryOfIncorporationFormationC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorCountryOfIncorporationFormationC)
	result.sfAccountSubscriptionInvestorExemptionFromFATCAReportingCodeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorExemptionFromFATCAReportingCodeC)
	result.sfAccountSubscriptionInvestorExemptPayeeCodeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorExemptPayeeCodeC)
	result.sfAccountSubscriptionInvestorDateOfBirthC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorDateOfBirthC)
	result.sfAccountSubscriptionInvestorBranchGIINC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorBranchGIINC)
	result.sfAccountSubscriptionInvestorGIINStatusDateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorGIINStatusDateC)
	result.sfAccountSubscriptionInvestorGIINC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorGIINC)
	result.sfAccountSubscriptionInvestorGIINStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorGIINStatusC)
	result.sfAccountSubscriptionInvestorQualifiedForeignPensionFundQFPFC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorQualifiedForeignPensionFundQFPFC)
	result.sfAccountSubscriptionInvestorTaxReportingByAlpInvestC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTaxReportingByAlpInvestC)
	result.sfAccountSubscriptionInvestorTaxAccountOwnerC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTaxAccountOwnerC)
	result.sfAccountSubscriptionInvestorTAOBillingCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOBillingCountryC)
	result.sfAccountSubscriptionInvestorTAOBillingStreetC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOBillingStreetC)
	result.sfAccountSubscriptionInvestorTAOBillingCityC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOBillingCityC)
	result.sfAccountSubscriptionInvestorTAOBillingStateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOBillingStateC)
	result.sfAccountSubscriptionInvestorTAOBillingPostalCodeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOBillingPostalCodeC)
	result.sfAccountSubscriptionInvestorTAOBillingStreet2C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOBillingStreet2C)
	result.sfAccountSubscriptionInvestorTAOTaxStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOTaxStatusC)
	result.sfAccountSubscriptionInvestorTAOCitizenshipCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOCitizenshipCountryC)
	result.sfAccountSubscriptionInvestorTAOCountryOfIncorporationFormationC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOCountryOfIncorporationFormationC)
	result.sfAccountSubscriptionInvestorTAOUSTaxIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOUSTaxIDC)
	result.sfAccountSubscriptionInvestorTAOIndividualOrOrganizationC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOIndividualOrOrganizationC)
	result.sfAccountSubscriptionInvestorTAOUSTINTypeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOUSTINTypeC)
	result.sfAccountSubscriptionInvestorTAOInvestorForeignDomesticC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOInvestorForeignDomesticC)
	result.sfAccountSubscriptionInvestorTAONonUSTaxIDCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAONonUSTaxIDCountryC)
	result.sfAccountSubscriptionInvestorTAOForeignTaxIdC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOForeignTaxIdC)
	result.sfAccountSubscriptionInvestorTAOWithholdingForeignPartnershipEINC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOWithholdingForeignPartnershipEINC)
	result.sfAccountSubscriptionInvestorTAODateOfBirthC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAODateOfBirthC)
	result.sfAccountSubscriptionInvestorTAOExemptionFromFATCAReportingCodeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOExemptionFromFATCAReportingCodeC)
	result.sfAccountSubscriptionInvestorTAOTaxCountryJurisdictionC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOTaxCountryJurisdictionC)
	result.sfAccountSubscriptionInvestorTAOExemptPayeeCodeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOExemptPayeeCodeC)
	result.sfAccountSubscriptionInvestorTAOShippingCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOShippingCountryC)
	result.sfAccountSubscriptionInvestorTAOShippingStreetC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOShippingStreetC)
	result.sfAccountSubscriptionInvestorTAOShippingCityC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOShippingCityC)
	result.sfAccountSubscriptionInvestorTAOInvestorMailingStateProvinceC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOInvestorMailingStateProvinceC)
	result.sfAccountSubscriptionInvestorTAOShippingPostalCodeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOShippingPostalCodeC)
	result.sfAccountSubscriptionInvestorTAOShippingStreet2C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOShippingStreet2C)
	result.sfAccountSubscriptionInvestorTAOTaxFormTypeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOTaxFormTypeC)
	result.sfAccountSubscriptionInvestorTAOBranchGIINC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOBranchGIINC)
	result.sfAccountSubscriptionInvestorTAOGIINC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOGIINC)
	result.sfAccountSubscriptionInvestorTAOCountryOfBirthC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOCountryOfBirthC)
	result.sfAccountSubscriptionInvestorTAOFATCAClassificationC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOFATCAClassificationC)
	result.sfAccountSubscriptionInvestorTAOSponsoringEntityGIINC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOSponsoringEntityGIINC)
	result.sfAccountSubscriptionInvestorTAOW9OtherEntityTypeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOW9OtherEntityTypeC)
	result.sfAccountSubscriptionInvestorTAOFirstNameC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOFirstNameC)
	result.sfAccountSubscriptionInvestorTAOLastNameC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOLastNameC)
	result.sfAccountSubscriptionInvestorTAOMiddleNameC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOMiddleNameC)
	result.sfAccountSubscriptionInvestorTAOFATCAStatusC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOFATCAStatusC)
	result.sfAccountSubscriptionInvestorTAOExemptionFromFATCAWithholdingCodC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOExemptionFromFATCAWithholdingCodC)
	result.sfAccountSubscriptionInvestorIdentificationAsASpecifiedUKPersonC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIdentificationAsASpecifiedUKPersonC)
	result.sfAccountSubscriptionInvestorCDOTEntityAccountHolderStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorCDOTEntityAccountHolderStatusC)
	result.sfAccountSubscriptionInvestorAffiliatedCorporationC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorAffiliatedCorporationC)
	result.sfAccountSubscriptionInvestorReportableUKPersonC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorReportableUKPersonC)
	result.sfAccountSubscriptionInvestorReportableGGYJEYGIBIOMPersonC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorReportableGGYJEYGIBIOMPersonC)
	result.sfAccountSubscriptionInvestorCRSClassificationC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorCRSClassificationC)
	result.sfAccountSubscriptionInvestorRelatedEntityC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorRelatedEntityC)
	result.sfAccountSubscriptionInvestorPlaceOfBirthC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorPlaceOfBirthC)
	result.sfAccountSubscriptionInvestorDateOfOrganizationFormationDateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorDateOfOrganizationFormationDateC)
	result.sfAccountSubscriptionInvestorEffectiveDateOfSelfCertificationC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorEffectiveDateOfSelfCertificationC)
	result.sfAccountSubscriptionInvestorNameOfSecuritiesMarketC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorNameOfSecuritiesMarketC)
	result.sfAccountSubscriptionInvestorStatusOfCRSReviewC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorStatusOfCRSReviewC)
	result.sfAccountSubscriptionInvestorReportableNonReportableAccountC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorReportableNonReportableAccountC)
	result.sfAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC)
	result.anduinAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC = encodeOptionalMultipleCheckboxType(f.anduinAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC)
	result.sfAccountSubscriptionInvestorReportingCountriesC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorReportingCountriesC)
	result.sfAccountSubscriptionInvestorTINUnavailableC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINUnavailableC)
	result.sfAccountSubscriptionInvestorTINCountryNo1C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINCountryNo1C)
	result.sfAccountSubscriptionInvestorTINNo1C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINNo1C)
	result.sfAccountSubscriptionInvestorTINCountryNo2C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINCountryNo2C)
	result.sfAccountSubscriptionInvestorTINNo2C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINNo2C)
	result.sfAccountSubscriptionInvestorTINCountryNo3C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINCountryNo3C)
	result.sfAccountSubscriptionInvestorTINNo3C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINNo3C)
	result.sfAccountSubscriptionInvestorTINCountryNo4C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINCountryNo4C)
	result.sfAccountSubscriptionInvestorTINNo4C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINNo4C)
	result.sfAccountSubscriptionInvestorTINCountryNo5C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINCountryNo5C)
	result.sfAccountSubscriptionInvestorTINNo5C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTINNo5C)
	result.sfAccountSubscriptionInvestorRegisteredAddress2C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorRegisteredAddress2C)
	result.sfAccountSubscriptionInvestorMailingAddress2C = encodeOptionalStringType(f.sfAccountSubscriptionInvestorMailingAddress2C)
	result.sfAccountSubscriptionInvestorAccreditedInvestorStatusEntitiesC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorAccreditedInvestorStatusEntitiesC)
	result.sfAccountSubscriptionInvestorAccreditedInvestorStatusIndividualC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorAccreditedInvestorStatusIndividualC)
	result.sfAccountSubscriptionInvestorGovernmentIssuedIDOnFileC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorGovernmentIssuedIDOnFileC)
	result.sfAccountSubscriptionInvestorGovernmentIDExpirationDateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorGovernmentIDExpirationDateC)
	result.sfAccountSubscriptionInvestorExpirationOfRestrictiveCovenantPerioC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorExpirationOfRestrictiveCovenantPerioC)
	result.sfAccountSubscriptionInvestorIsCapitalShareholderControlledC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIsCapitalShareholderControlledC)
	result.sfAccountSubscriptionInvestorIsIndivRetirementBenefitPlanC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIsIndivRetirementBenefitPlanC)
	result.sfAccountSubscriptionInvestorIsBHCC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIsBHCC)
	result.sfAccountSubscriptionInvestorIndividualRetirementAccountIRAC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIndividualRetirementAccountIRAC)
	result.sfAccountSubscriptionInvestorQualifiedPurchaserC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorQualifiedPurchaserC)
	result.sfAccountSubscriptionInvestorQualifiedInvestorStatusEntityC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorQualifiedInvestorStatusEntityC)
	result.sfAccountSubscriptionInvestorQualifiedClientStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorQualifiedClientStatusC)
	result.sfAccountSubscriptionInvestorQualifiedInvestorStatusIndividualC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorQualifiedInvestorStatusIndividualC)
	result.sfAccountSubscriptionInvestorIsJapaneseResC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIsJapaneseResC)
	result.sfAccountSubscriptionInvestorIsFIELQualifiedC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIsFIELQualifiedC)
	result.sfAccountSubscriptionInvestorIsArticle63AppliedC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIsArticle63AppliedC)
	result.sfAccountSubscriptionInvestorEUElectiveProfessionalClientC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorEUElectiveProfessionalClientC)
	result.sfAccountSubscriptionInvestorDescription = encodeOptionalStringType(f.sfAccountSubscriptionInvestorDescription)
	result.sfAccountSubscriptionInvestorUBSEscrowAccountC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorUBSEscrowAccountC)
	result.sfAccountSubscriptionInvestorMSSBIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorMSSBIDC)
	result.sfAccountSubscriptionInvestorMRORC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorMRORC)
	result.sfAccountSubscriptionInvestorIsUSTaxExemptC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIsUSTaxExemptC)
	result.sfAccountSubscriptionInvestorIsSection115Entity = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorIsSection115Entity)
	result.sfAccountSubscriptionInvestorOwnerIsUSTaxExempt = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorOwnerIsUSTaxExempt)
	result.sfAccountSubscriptionInvestorTreatedAsTaxExemptLP = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTreatedAsTaxExemptLP)
	result.sfAccountSubscriptionInvestorTaxExemptSubtypeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTaxExemptSubtypeC)
	result.sfAccountSubscriptionInvestorExemptFromStateAndLocalIncomeTaxC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorExemptFromStateAndLocalIncomeTaxC)
	result.sfAccountSubscriptionInvestorWHRateOIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWHRateOIDC)
	result.sfAccountSubscriptionInvestorWHRateECIC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWHRateECIC)
	result.sfAccountSubscriptionInvestorWHRateFATCAC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWHRateFATCAC)
	result.sfAccountSubscriptionInvestorRecordTypeId = encodeOptionalStringType(f.sfAccountSubscriptionInvestorRecordTypeId)
	result.sfAccountSubscriptionInvestorAccountStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorAccountStatusC)
	result.sfAccountSubscriptionInvestorWLCRegulatorC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWLCRegulatorC)
	result.sfAccountSubscriptionInvestorWLCExchangeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWLCExchangeC)
	result.sfAccountSubscriptionInvestorWLCTickerSymbolC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWLCTickerSymbolC)
	result.sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC)
	result.anduinAccountSubscriptionInvestorSignerFirstName = encodeOptionalStringType(f.anduinAccountSubscriptionInvestorSignerFirstName)
	result.anduinAccountSubscriptionInvestorSignerMiddleName = encodeOptionalStringType(f.anduinAccountSubscriptionInvestorSignerMiddleName)
	result.anduinAccountSubscriptionInvestorSignerLastName = encodeOptionalStringType(f.anduinAccountSubscriptionInvestorSignerLastName)
	result.sfAccountSubscriptionInvestorSignerFirstName = encodeOptionalStringType(f.sfAccountSubscriptionInvestorSignerFirstName)
	result.sfAccountSubscriptionInvestorSignerMiddleName = encodeOptionalStringType(f.sfAccountSubscriptionInvestorSignerMiddleName)
	result.sfAccountSubscriptionInvestorSignerLastName = encodeOptionalStringType(f.sfAccountSubscriptionInvestorSignerLastName)
	result.sfAgreementOnboardingNameC = encodeOptionalStringType(f.sfAgreementOnboardingNameC)
	result.sfAgreementOnboardingStatusC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingStatusC)
	result.sfAgreementOnboardingTypeC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingTypeC)
	result.sfAgreementOnboardingCommonSubscriptionEntityC = encodeOptionalStringType(f.sfAgreementOnboardingCommonSubscriptionEntityC)
	result.sfAgreementOnboardingSubscriptionInvestorApprovalStatusC = encodeOptionalStringType(f.sfAgreementOnboardingSubscriptionInvestorApprovalStatusC)
	result.sfAgreementOnboardingAccountC = encodeOptionalStringType(f.sfAgreementOnboardingAccountC)
	result.sfAgreementOnboardingRelatedCommonNameC = encodeOptionalStringType(f.sfAgreementOnboardingRelatedCommonNameC)
	result.sfAgreementOnboardingSIIndividualOrOrganizationC = encodeOptionalStringType(f.sfAgreementOnboardingSIIndividualOrOrganizationC)
	result.sfAgreementOnboardingSIInvestorForeignDomesticC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorForeignDomesticC)
	result.sfAgreementOnboardingOriginalCompletedDateC = encodeOptionalStringType(f.sfAgreementOnboardingOriginalCompletedDateC)
	result.sfAgreementOnboardingParentAgreementIdC = encodeOptionalStringType(f.sfAgreementOnboardingParentAgreementIdC)
	result.sfAgreementOnboardingCommitmentTypeC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingCommitmentTypeC)
	result.sfAgreementOnboardingInvestorFundC = encodeOptionalStringType(f.sfAgreementOnboardingInvestorFundC)
	result.sfAgreementOnboardingOpportunityC = encodeOptionalStringType(f.sfAgreementOnboardingOpportunityC)
	result.sfAgreementOnboardingFundC = encodeOptionalStringType(f.sfAgreementOnboardingFundC)
	result.sfAgreementOnboardingCurrencyC = encodeOptionalStringType(f.sfAgreementOnboardingCurrencyC)
	result.sfAgreementOnboardingFundCloseC = encodeOptionalStringType(f.sfAgreementOnboardingFundCloseC)
	result.sfAgreementOnboardingPartnershipC = encodeOptionalStringType(f.sfAgreementOnboardingPartnershipC)
	result.sfAgreementOnboardingRequestedCommitmentAmountC = encodeOptionalStringType(f.sfAgreementOnboardingRequestedCommitmentAmountC)
	result.sfAgreementOnboardingCommitmentC = encodeOptionalStringType(f.sfAgreementOnboardingCommitmentC)
	result.sfAgreementOnboardingUSDAmountC = encodeOptionalStringType(f.sfAgreementOnboardingUSDAmountC)
	result.sfAgreementOnboardingEffectiveDateC = encodeOptionalStringType(f.sfAgreementOnboardingEffectiveDateC)
	result.sfAgreementOnboardingInvestranVehicleTypeC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingInvestranVehicleTypeC)
	result.sfAgreementOnboardingRelatedAgreementsGroupC = encodeOptionalStringType(f.sfAgreementOnboardingRelatedAgreementsGroupC)
	result.sfAgreementOnboardingAssociatedLegalEntitiesC = encodeOptionalStringType(f.sfAgreementOnboardingAssociatedLegalEntitiesC)
	result.sfAgreementOnboardingAgreementLegalEntitiesExternalIdsC = encodeOptionalStringType(f.sfAgreementOnboardingAgreementLegalEntitiesExternalIdsC)
	result.sfAgreementOnboardingSIInvestorRegisteredCountryC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorRegisteredCountryC)
	result.sfAgreementOnboardingSIInvestorRegisteredStreetAddressC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorRegisteredStreetAddressC)
	result.sfAgreementOnboardingSIInvestorRegisteredCityC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorRegisteredCityC)
	result.sfAgreementOnboardingSIInvestorRegisteredStateProvinceC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorRegisteredStateProvinceC)
	result.sfAgreementOnboardingSIInvestorRegisteredPostalCodeC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorRegisteredPostalCodeC)
	result.sfAgreementOnboardingSIInvestorRegisteredAddress2C = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorRegisteredAddress2C)
	result.sfAgreementOnboardingSIInvestorMailingCountryC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorMailingCountryC)
	result.sfAgreementOnboardingSIInvestorMailingStreetC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorMailingStreetC)
	result.sfAgreementOnboardingSIInvestorMailingCityC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorMailingCityC)
	result.sfAgreementOnboardingSIInvestorMailingStateProvinceC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorMailingStateProvinceC)
	result.sfAgreementOnboardingSIInvestorMailingZipPostalCodeC = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorMailingZipPostalCodeC)
	result.sfAgreementOnboardingSIInvestorMailingAddress2C = encodeOptionalStringType(f.sfAgreementOnboardingSIInvestorMailingAddress2C)
	result.sfAgreementOnboardingSIUSTaxpayerIdentificationNumberC = encodeOptionalStringType(f.sfAgreementOnboardingSIUSTaxpayerIdentificationNumberC)
	result.sfAgreementOnboardingSIUSTINTypeC = encodeOptionalStringType(f.sfAgreementOnboardingSIUSTINTypeC)
	result.sfAgreementOnboardingSITaxStatusC = encodeOptionalStringType(f.sfAgreementOnboardingSITaxStatusC)
	result.sfAgreementOnboardingSITaxCountryJurisdictionC = encodeOptionalStringType(f.sfAgreementOnboardingSITaxCountryJurisdictionC)
	result.sfAgreementOnboardingSIFATCAClassificationC = encodeOptionalStringType(f.sfAgreementOnboardingSIFATCAClassificationC)
	result.sfAgreementOnboardingSINonUSTaxIDC = encodeOptionalStringType(f.sfAgreementOnboardingSINonUSTaxIDC)
	result.sfAgreementOnboardingSINonUSTaxIDCountryC = encodeOptionalStringType(f.sfAgreementOnboardingSINonUSTaxIDCountryC)
	result.sfAgreementOnboardingSICitizenshipCountryC = encodeOptionalStringType(f.sfAgreementOnboardingSICitizenshipCountryC)
	result.sfAgreementOnboardingSICountryOfIncorporationFormationC = encodeOptionalStringType(f.sfAgreementOnboardingSICountryOfIncorporationFormationC)
	result.sfAgreementOnboardingSICountryOfBirthC = encodeOptionalStringType(f.sfAgreementOnboardingSICountryOfBirthC)
	result.sfAgreementOnboardingSIDateOfBirthC = encodeOptionalStringType(f.sfAgreementOnboardingSIDateOfBirthC)
	result.sfAgreementOnboardingSIExemptionFromFATCAReportingCodeC = encodeOptionalStringType(f.sfAgreementOnboardingSIExemptionFromFATCAReportingCodeC)
	result.sfAgreementOnboardingSIExemptPayeeCodeC = encodeOptionalStringType(f.sfAgreementOnboardingSIExemptPayeeCodeC)
	result.sfAgreementOnboardingSIGIINC = encodeOptionalStringType(f.sfAgreementOnboardingSIGIINC)
	result.sfAgreementOnboardingSIBranchGIINC = encodeOptionalStringType(f.sfAgreementOnboardingSIBranchGIINC)
	result.sfAgreementOnboardingX892CAIC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingX892CAIC)
	result.sfAgreementOnboardingX892CAITextC = encodeOptionalStringType(f.sfAgreementOnboardingX892CAITextC)
	result.sfAgreementOnboardingTaxExemptStatusNotesC = encodeOptionalStringType(f.sfAgreementOnboardingTaxExemptStatusNotesC)
	result.sfAgreementOnboardingERISAPartnerC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingERISAPartnerC)
	result.sfAgreementOnboardingIsERISATitleIC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingIsERISATitleIC)
	result.anduinAgreementOnboardingIsERISATitleIC = encodeOptionalMultipleCheckboxType(f.anduinAgreementOnboardingIsERISATitleIC)
	result.sfAgreementOnboardingSIDisregardedGPOfGPC = encodeOptionalStringType(f.sfAgreementOnboardingSIDisregardedGPOfGPC)
	result.sfAgreementOnboardingSIQualifiedInstitutionalInvestorFIELC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingSIQualifiedInstitutionalInvestorFIELC)
	result.sfAgreementOnboardingSIFundingParentSubEntityC = encodeOptionalStringType(f.sfAgreementOnboardingSIFundingParentSubEntityC)
	result.sfAgreementOnboardingSIArticle63Paragraph1AppliesC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingSIArticle63Paragraph1AppliesC)
	result.sfAgreementOnboardingSIFundingSiloC = encodeOptionalStringType(f.sfAgreementOnboardingSIFundingSiloC)
	result.sfAgreementOnboardingNewCommitmentOrTransferC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingNewCommitmentOrTransferC)
	result.sfAgreementOnboardingConfirmationOfInvestmentOnOwnBehalfC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingConfirmationOfInvestmentOnOwnBehalfC)
	result.sfAgreementOnboardingInvestorTypeC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingInvestorTypeC)
	result.sfAgreementOnboardingLuxTaxAssessmentC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingLuxTaxAssessmentC)
	result.sfAgreementOnboardingInvestingInLuxFundsC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingInvestingInLuxFundsC)
	result.sfAgreementOnboardingLuxTaxAssessmentScoreC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingLuxTaxAssessmentScoreC)
	result.sfAgreementOnboardingSourceOfFundsC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingSourceOfFundsC)
	result.sfAgreementOnboardingEvidenceOfExistenceC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingEvidenceOfExistenceC)
	result.sfAgreementOnboardingSourceOfWealthC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingSourceOfWealthC)
	result.sfAgreementOnboardingEvidenceOfCorporateAuthorityC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingEvidenceOfCorporateAuthorityC)
	result.sfAgreementOnboardingSourceOfWealthDetailsC = encodeOptionalStringType(f.sfAgreementOnboardingSourceOfWealthDetailsC)
	result.sfAgreementOnboardingSignedStructureChartC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingSignedStructureChartC)
	result.sfAgreementOnboardingListOfLegalRepsAndDirectorsC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingListOfLegalRepsAndDirectorsC)
	result.sfAgreementOnboardingEvidenceOfEachTierOfTheStructureC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingEvidenceOfEachTierOfTheStructureC)
	result.sfAgreementOnboardingIdentificationOfAuthorizedSignatoriesC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingIdentificationOfAuthorizedSignatoriesC)
	result.sfAgreementOnboardingIdentificationOfUBOsC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingIdentificationOfUBOsC)
	result.sfAgreementOnboardingFinCENControlPersonC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingFinCENControlPersonC)
	result.sfAgreementOnboardingWorldCheckResultsC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingWorldCheckResultsC)
	result.sfAgreementOnboardingControlPersonJurisdictionC = encodeOptionalStringType(f.sfAgreementOnboardingControlPersonJurisdictionC)
	result.sfAgreementOnboardingWorldCheckDetailsC = encodeOptionalStringType(f.sfAgreementOnboardingWorldCheckDetailsC)
	result.sfAgreementOnboardingExceptionsWaiversC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingExceptionsWaiversC)
	result.sfAgreementOnboardingApprovalForHighRiskOrPEPC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingApprovalForHighRiskOrPEPC)
	result.sfAgreementOnboardingExceptionsWaiversDetailsC = encodeOptionalStringType(f.sfAgreementOnboardingExceptionsWaiversDetailsC)
	result.sfAgreementOnboardingAnalystC = encodeOptionalStringType(f.sfAgreementOnboardingAnalystC)
	result.sfAgreementOnboardingKYCSatisfactoryC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingKYCSatisfactoryC)
	result.sfAgreementOnboardingAMLReviewInitiatedC = encodeOptionalStringType(f.sfAgreementOnboardingAMLReviewInitiatedC)
	result.sfAgreementOnboardingPostCloseDetailsC = encodeOptionalStringType(f.sfAgreementOnboardingPostCloseDetailsC)
	result.sfAgreementOnboardingAMLClearanceDateC = encodeOptionalStringType(f.sfAgreementOnboardingAMLClearanceDateC)
	result.sfAgreementOnboardingPostCloseFollowUpDateC = encodeOptionalStringType(f.sfAgreementOnboardingPostCloseFollowUpDateC)
	result.sfAgreementOnboardingAMLNotesC = encodeOptionalStringType(f.sfAgreementOnboardingAMLNotesC)
	result.sfAgreementOnboardingAMLApprovalDateC = encodeOptionalStringType(f.sfAgreementOnboardingAMLApprovalDateC)
	result.sfAgreementOnboardingEligibleIntroducerLetterCertificateC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingEligibleIntroducerLetterCertificateC)
	result.sfAgreementOnboardingExternalAccountNumberC = encodeOptionalStringType(f.sfAgreementOnboardingExternalAccountNumberC)
	result.sfAgreementOnboardingCommentsC = encodeOptionalStringType(f.sfAgreementOnboardingCommentsC)
	result.sfAgreementOnboardingExternalAccountInstitutionC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingExternalAccountInstitutionC)
	result.sfAgreementOnboardingAMLDataApprovedC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingAMLDataApprovedC)
	result.sfAgreementOnboardingAMLApproverC = encodeOptionalStringType(f.sfAgreementOnboardingAMLApproverC)
	result.sfAgreementOnboardingAMLApprovedC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingAMLApprovedC)
	result.sfAgreementOnboardingFMApprovedC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingFMApprovedC)
	result.sfAgreementOnboardingSkipAMLApprovalsC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingSkipAMLApprovalsC)
	result.sfAgreementOnboardingIFStatusC = encodeOptionalStringType(f.sfAgreementOnboardingIFStatusC)
	result.sfAgreementOnboardingRecordTypeId = encodeOptionalStringType(f.sfAgreementOnboardingRecordTypeId)
	result.sfAgreementOnboardingSIInvestingAssetsOfAnyRetirementPlC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingSIInvestingAssetsOfAnyRetirementPlC)
	result.sfAgreementOnboardingIsInvestorControllingC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingIsInvestorControllingC)
	result.sfAgreementOnboardingIsERISAFOIAC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingIsERISAFOIAC)
	result.sfAgreementOnboardingSIQualifiedInvestorStatusEntityC = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingSIQualifiedInvestorStatusEntityC)
	result.anduinAgreementOnboardingSignerFirstName = encodeOptionalStringType(f.anduinAgreementOnboardingSignerFirstName)
	result.anduinAgreementOnboardingSignerMiddleName = encodeOptionalStringType(f.anduinAgreementOnboardingSignerMiddleName)
	result.anduinAgreementOnboardingSignerLastName = encodeOptionalStringType(f.anduinAgreementOnboardingSignerLastName)
	result.sfAgreementOnboardingSignerFirstName = encodeOptionalStringType(f.sfAgreementOnboardingSignerFirstName)
	result.sfAgreementOnboardingSignerMiddleName = encodeOptionalStringType(f.sfAgreementOnboardingSignerMiddleName)
	result.sfAgreementOnboardingSignerLastName = encodeOptionalStringType(f.sfAgreementOnboardingSignerLastName)
	result.sfAgreementNullTCGGlobalIdC = encodeOptionalStringType(f.sfAgreementNullTCGGlobalIdC)
	result.sfAgreementNullCommitmentC = encodeOptionalStringType(f.sfAgreementNullCommitmentC)
	result.anduinAgreementNullSignerFirstName = encodeOptionalStringType(f.anduinAgreementNullSignerFirstName)
	result.anduinAgreementNullSignerMiddleName = encodeOptionalStringType(f.anduinAgreementNullSignerMiddleName)
	result.anduinAgreementNullSignerLastName = encodeOptionalStringType(f.anduinAgreementNullSignerLastName)
	result.sfAgreementNullSignerFirstName = encodeOptionalStringType(f.sfAgreementNullSignerFirstName)
	result.sfAgreementNullSignerMiddleName = encodeOptionalStringType(f.sfAgreementNullSignerMiddleName)
	result.sfAgreementNullSignerLastName = encodeOptionalStringType(f.sfAgreementNullSignerLastName)
	result.sfAgreementNullWLCInternationalSupplementsC = encodeOptionalMultipleCheckboxType(f.sfAgreementNullWLCInternationalSupplementsC)
	result.sfAgreementNullReceiveUnappliedBalanceReductionAmtC = encodeOptionalMultipleCheckboxType(f.sfAgreementNullReceiveUnappliedBalanceReductionAmtC)
	result.sfAgreementNullIsNotIRCUSPerson = encodeOptionalMultipleCheckboxType(f.sfAgreementNullIsNotIRCUSPerson)
	result.sfAgreementNullOwnerIsNotIRCUSPerson = encodeOptionalMultipleCheckboxType(f.sfAgreementNullOwnerIsNotIRCUSPerson)
	result.sfAgreementNullTreatedAsNonUSLP = encodeOptionalMultipleCheckboxType(f.sfAgreementNullTreatedAsNonUSLP)
	result.sfAgreementNullECIC = encodeOptionalMultipleCheckboxType(f.sfAgreementNullECIC)
	result.sfAgreementNullUBTIC = encodeOptionalMultipleCheckboxType(f.sfAgreementNullUBTIC)
	result.sfAgreementNullUSRPHCC = encodeOptionalMultipleCheckboxType(f.sfAgreementNullUSRPHCC)
	result.sfAgreementNullWLC894EligibleC = encodeOptionalMultipleCheckboxType(f.sfAgreementNullWLC894EligibleC)
	result.sfFundFundPrivateEquityRealAssetName = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetName)
	result.sfFundFundPrivateEquityRealAssetProductNameC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetProductNameC)
	result.sfFundFundPrivateEquityRealAssetFundLegalNameC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFundLegalNameC)
	result.sfFundFundPrivateEquityRealAssetFundAbbreviationC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFundAbbreviationC)
	result.sfFundFundPrivateEquityRealAssetStatusC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetStatusC)
	result.sfFundFundPrivateEquityRealAssetFundStatusC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFundStatusC)
	result.sfFundFundPrivateEquityRealAssetInactiveDateC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetInactiveDateC)
	result.sfFundFundPrivateEquityRealAssetVintageYearC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetVintageYearC)
	result.sfFundFundPrivateEquityRealAssetInvestorDiscretionC = encodeOptionalMultipleCheckboxType(f.sfFundFundPrivateEquityRealAssetInvestorDiscretionC)
	result.sfFundFundPrivateEquityRealAssetFundStrategyDescriptionC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFundStrategyDescriptionC)
	result.sfFundFundPrivateEquityRealAssetPartOfProgramC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetPartOfProgramC)
	result.sfFundFundPrivateEquityRealAssetPRACoverageC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetPRACoverageC)
	result.sfFundFundPrivateEquityRealAssetAIFMDC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetAIFMDC)
	result.sfFundFundPrivateEquityRealAssetMandateBackgroundC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetMandateBackgroundC)
	result.sfFundFundPrivateEquityRealAssetCarlyleNotResponsibleForAMLKYCC = encodeOptionalMultipleCheckboxType(f.sfFundFundPrivateEquityRealAssetCarlyleNotResponsibleForAMLKYCC)
	result.sfFundFundPrivateEquityRealAssetFundTypeC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFundTypeC)
	result.sfFundFundPrivateEquityRealAssetProductLineC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetProductLineC)
	result.sfFundFundPrivateEquityRealAssetProductTypeC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetProductTypeC)
	result.sfFundFundPrivateEquityRealAssetFundFamilyC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFundFamilyC)
	result.sfFundFundPrivateEquityRealAssetFundFocusC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFundFocusC)
	result.sfFundFundPrivateEquityRealAssetRegionC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetRegionC)
	result.sfFundFundPrivateEquityRealAssetStructureC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetStructureC)
	result.sfFundFundPrivateEquityRealAssetCurrencyC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetCurrencyC)
	result.sfFundFundPrivateEquityRealAssetFundFocusAdditionalInfoC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFundFocusAdditionalInfoC)
	result.sfFundFundPrivateEquityRealAssetFundSpecificParagraphC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFundSpecificParagraphC)
	result.sfFundFundPrivateEquityRealAssetManagedAccountDirectInvestmentsC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetManagedAccountDirectInvestmentsC)
	result.sfFundFundPrivateEquityRealAssetClosingDateC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetClosingDateC)
	result.sfFundFundPrivateEquityRealAssetFinalClosingDateC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFinalClosingDateC)
	result.sfFundFundPrivateEquityRealAssetFinalClosingDatePerLPAC = encodeOptionalStringType(f.sfFundFundPrivateEquityRealAssetFinalClosingDatePerLPAC)
	result.sfFundFundCloseName = encodeOptionalStringType(f.sfFundFundCloseName)
	result.sfFundFundCloseFundC = encodeOptionalStringType(f.sfFundFundCloseFundC)
	result.sfFundFundCloseCloseDateC = encodeOptionalStringType(f.sfFundFundCloseCloseDateC)
	result.sfFundFundCloseRecordTypeId = encodeOptionalStringType(f.sfFundFundCloseRecordTypeId)
	result.sfFundNullTCGGlobalIdC = encodeOptionalStringType(f.sfFundNullTCGGlobalIdC)
	result.sfIFCNullEmailC = encodeOptionalStringType(f.sfIFCNullEmailC)
	result.sfIFCNullStatusC = encodeOptionalStringType(f.sfIFCNullStatusC)
	result.sfIFCNullCommonNameC = encodeOptionalStringType(f.sfIFCNullCommonNameC)
	result.sfIFCNullInvestorClassificationC = encodeOptionalStringType(f.sfIFCNullInvestorClassificationC)
	result.sfIFCNullBeneficialCountryC = encodeOptionalStringType(f.sfIFCNullBeneficialCountryC)
	result.sfIFCNullDateOfBirthC = encodeOptionalStringType(f.sfIFCNullDateOfBirthC)
	result.sfIFCNullIndividualOrOrganizationC = encodeOptionalStringType(f.sfIFCNullIndividualOrOrganizationC)
	result.sfIFCNullFullAddressC = encodeOptionalStringType(f.sfIFCNullFullAddressC)
	result.sfIFCNullCreatedById = encodeOptionalStringType(f.sfIFCNullCreatedById)
	result.sfIFCNullName = encodeOptionalStringType(f.sfIFCNullName)
	result.sfIFCNullLastModifiedById = encodeOptionalStringType(f.sfIFCNullLastModifiedById)
	result.sfIFCNullExternalIDC = encodeOptionalStringType(f.sfIFCNullExternalIDC)
	result.sfIFCNullRecordTypeId = encodeOptionalStringType(f.sfIFCNullRecordTypeId)
	result.sfIFCNullContactCountryC = encodeOptionalStringType(f.sfIFCNullContactCountryC)
	result.sfIFCNullContactIDC = encodeOptionalStringType(f.sfIFCNullContactIDC)
	result.sfIFCNullContactNameC = encodeOptionalStringType(f.sfIFCNullContactNameC)
	result.sfIFCNullContactRecordTypeNameC = encodeOptionalStringType(f.sfIFCNullContactRecordTypeNameC)
	result.sfIFCNullContactTCGGlobalIDC = encodeOptionalStringType(f.sfIFCNullContactTCGGlobalIDC)
	result.sfIFCNullContactSCNRegisteredCountryC = encodeOptionalStringType(f.sfIFCNullContactSCNRegisteredCountryC)
	result.sfTaxFormW9TaxAccountOwner = encodeOptionalStringType(f.sfTaxFormW9TaxAccountOwner)
	result.sfTaxFormW9DisregardedEntityName = encodeOptionalStringType(f.sfTaxFormW9DisregardedEntityName)
	result.sfTaxFormW9TAOTaxAccountOwner = encodeOptionalStringType(f.sfTaxFormW9TAOTaxAccountOwner)
	result.sfTaxFormW9TaxStatusC = encodeOptionalMultipleCheckboxType(f.sfTaxFormW9TaxStatusC)
	result.sfTaxFormW9TAOTaxStatusC = encodeOptionalMultipleCheckboxType(f.sfTaxFormW9TAOTaxStatusC)
	result.sfTaxFormW9TaxEntityTypeC = encodeOptionalStringType(f.sfTaxFormW9TaxEntityTypeC)
	result.sfTaxFormW9ExemptPayeeCodeC = encodeOptionalStringType(f.sfTaxFormW9ExemptPayeeCodeC)
	result.sfTaxFormW9ExemptionFromFATCAReportingCodeC = encodeOptionalStringType(f.sfTaxFormW9ExemptionFromFATCAReportingCodeC)
	result.sfTaxFormW9TAOExemptPayeeCodeC = encodeOptionalStringType(f.sfTaxFormW9TAOExemptPayeeCodeC)
	result.sfTaxFormW9TAOExemptionFromFATCAReportingCodeC = encodeOptionalStringType(f.sfTaxFormW9TAOExemptionFromFATCAReportingCodeC)
	result.sfTaxFormW9BillingStreet = encodeOptionalStringType(f.sfTaxFormW9BillingStreet)
	result.sfTaxFormW9BillingCity = encodeOptionalStringType(f.sfTaxFormW9BillingCity)
	result.sfTaxFormW9BillingState = encodeOptionalStringType(f.sfTaxFormW9BillingState)
	result.sfTaxFormW9BillingPostalCode = encodeOptionalStringType(f.sfTaxFormW9BillingPostalCode)
	result.sfTaxFormW9BillingCountry = encodeOptionalStringType(f.sfTaxFormW9BillingCountry)
	result.sfTaxFormW9TAOBillingStreetC = encodeOptionalStringType(f.sfTaxFormW9TAOBillingStreetC)
	result.sfTaxFormW9TAOBillingCityC = encodeOptionalStringType(f.sfTaxFormW9TAOBillingCityC)
	result.sfTaxFormW9TAOBillingStateC = encodeOptionalStringType(f.sfTaxFormW9TAOBillingStateC)
	result.sfTaxFormW9TAOBillingPostalCodeC = encodeOptionalStringType(f.sfTaxFormW9TAOBillingPostalCodeC)
	result.sfTaxFormW9TAOBillingCountryC = encodeOptionalStringType(f.sfTaxFormW9TAOBillingCountryC)
	result.sfTaxFormW9FMTaxIdC = encodeOptionalStringType(f.sfTaxFormW9FMTaxIdC)
	result.sfTaxFormW9USTINTypeC = encodeOptionalMultipleCheckboxType(f.sfTaxFormW9USTINTypeC)
	result.sfTaxFormW9TAOUSTaxIDC = encodeOptionalStringType(f.sfTaxFormW9TAOUSTaxIDC)
	result.sfTaxFormW9TAOUSTINTypeC = encodeOptionalMultipleCheckboxType(f.sfTaxFormW9TAOUSTINTypeC)
	result.sfAccountSubscriptionInvestorWHRateExpirationDateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorWHRateExpirationDateC)
	result.sfAccountSubscriptionInvestorValidationResultC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorValidationResultC)
	result.sfAccountSubscriptionInvestorEffectiveDateOfTaxFormStatusC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorEffectiveDateOfTaxFormStatusC)
	result.sfAccountSubscriptionInvestorEffectiveDateOfFATCAStatusAndRateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorEffectiveDateOfFATCAStatusAndRateC)
	result.sfAccountSubscriptionInvestorSubjectToFATCAWithholdingC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorSubjectToFATCAWithholdingC)
	result.sfAccountSubscriptionInvestorStatusOfFATCAReviewC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorStatusOfFATCAReviewC)
	result.sfAccountSubscriptionInvestorFATCAMonitoredC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorFATCAMonitoredC)
	result.sfAccountSubscriptionInvestorLimitationOfBenefitsOtherC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorLimitationOfBenefitsOtherC)
	result.sfAccountSubscriptionInvestorLimitationOfBenefitsC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorLimitationOfBenefitsC)
	result.sfAccountSubscriptionInvestorTAOGlobalIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOGlobalIDC)
	result.sfAccountSubscriptionInvestorTAOTaxIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOTaxIDC)
	result.sfAccountSubscriptionInvestorTAOWHRateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOWHRateC)
	result.sfAccountSubscriptionInvestorTAOStatusOfFATCAReviewC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOStatusOfFATCAReviewC)
	result.sfAccountSubscriptionInvestorTAOSubjectToFATCAWithholdingC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOSubjectToFATCAWithholdingC)
	result.sfAccountSubscriptionInvestorTAOTaxApprovalStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOTaxApprovalStatusC)
	result.sfAccountSubscriptionInvestorTAOTaxFormStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOTaxFormStatusC)
	result.sfAccountSubscriptionInvestorTAOTreatyCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOTreatyCountryC)
	result.sfAccountSubscriptionInvestorTAOWHRateFIRPTAIncomeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOWHRateFIRPTAIncomeC)
	result.sfAccountSubscriptionInvestorTAOWHRateInterestIncomeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOWHRateInterestIncomeC)
	result.sfAccountSubscriptionInvestorTAOWHRatePrivateDividendC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOWHRatePrivateDividendC)
	result.sfAccountSubscriptionInvestorTAOWHRatePublicDividendC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOWHRatePublicDividendC)
	result.sfAccountSubscriptionInvestorTAOGIINStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOGIINStatusC)
	result.sfAccountSubscriptionInvestorTAODemographicApprovalStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAODemographicApprovalStatusC)
	result.sfAccountSubscriptionInvestorTAOGIINStatusDateC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOGIINStatusDateC)
	result.sfAccountSubscriptionInvestorTAOEffectiveDateFATCACompletedStatusC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOEffectiveDateFATCACompletedStatusC)
	result.sfAccountSubscriptionInvestorTAOEffectiveDateOfTaxFormStatusC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOEffectiveDateOfTaxFormStatusC)
	result.sfAccountSubscriptionInvestorTAOLimitationOfBenefitsOtherC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOLimitationOfBenefitsOtherC)
	result.sfAccountSubscriptionInvestorTAOFATCAMonitoredC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOFATCAMonitoredC)
	result.sfAccountSubscriptionInvestorTAOBeneficialCountryC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOBeneficialCountryC)
	result.sfAccountSubscriptionInvestorTAOEW8StatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOEW8StatusC)
	result.sfAccountSubscriptionInvestorTAOClientIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOClientIDC)
	result.sfAccountSubscriptionInvestorTAOFATCADocumentIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorTAOFATCADocumentIDC)
	result.sfAccountSubscriptionInvestorTAOValidationResultC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOValidationResultC)
	result.sfAccountSubscriptionInvestorCRSStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorCRSStatusC)
	result.sfAccountSubscriptionInvestorCRSDocumentIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorCRSDocumentIDC)
	result.sfAccountSubscriptionInvestorCRSValidationResultC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorCRSValidationResultC)
	result.sfAccountSubscriptionInvestorFATCADocumentIDC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorFATCADocumentIDC)
	result.sfAccountSubscriptionInvestorSExemptionCodeC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorSExemptionCodeC)
	result.sfAccountSubscriptionInvestorStateExemptCertificationProvidedC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorStateExemptCertificationProvidedC)
	result.sfAccountSubscriptionInvestorDateStateExemptCertificateProvidedC = encodeOptionalStringType(f.sfAccountSubscriptionInvestorDateStateExemptCertificateProvidedC)
	result.sfAccountSubscriptionInvestorAMLRefreshStatusC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorAMLRefreshStatusC)
	result.sfIFCNullHideIFCFromContactSelfServicingC = encodeOptionalMultipleCheckboxType(f.sfIFCNullHideIFCFromContactSelfServicingC)
	result.sfAccountSubscriptionInvestorTAOLimitationOfBenefitsC = encodeOptionalMultipleCheckboxType(f.sfAccountSubscriptionInvestorTAOLimitationOfBenefitsC)
	result.sfAgreementOnboardingInitialAdditional = encodeOptionalMultipleCheckboxType(f.sfAgreementOnboardingInitialAdditional)
	return result
end

function FullTargetTable.decodeJsonFullTargetTableFieldsMap(json: {[string]: any}): FullTargetTableFieldsMap
	local sfFundSelection: {FullTargetTableSfFundSelectionType} = {}
	if json.sfFundSelection ~= nil then
		for _, item in json.sfFundSelection :: {{[string]: any}} do
			table.insert(sfFundSelection, FullTargetTable.decodeJsonFullTargetTableSfFundSelectionType(item))
		end
	end
	local sfBeneficialOwner: {FullTargetTableSfBeneficialownerType} = {}
	if json.sfBeneficialOwner ~= nil then
		for _, item in json.sfBeneficialOwner :: {{[string]: any}} do
			table.insert(sfBeneficialOwner, FullTargetTable.decodeJsonFullTargetTableSfBeneficialownerType(item))
		end
	end
	local sfControllingPersons: {FullTargetTableSfControllingpersonsType} = {}
	if json.sfControllingPersons ~= nil then
		for _, item in json.sfControllingPersons :: {{[string]: any}} do
			table.insert(sfControllingPersons, FullTargetTable.decodeJsonFullTargetTableSfControllingpersonsType(item))
		end
	end
	local sfContact: {FullTargetTableSfContactType} = {}
	if json.sfContact ~= nil then
		for _, item in json.sfContact :: {{[string]: any}} do
			table.insert(sfContact, FullTargetTable.decodeJsonFullTargetTableSfContactType(item))
		end
	end
	return {
		sfInvestorAccountNullTCGGlobalIdC = decodeOptionalStringType(json.sfInvestorAccountNullTCGGlobalIdC),
		sfFundSelection = sfFundSelection,
		sfAccountInvestorAccountTCGGlobalIdC = decodeOptionalStringType(json.sfAccountInvestorAccountTCGGlobalIdC),
		sfAccountCommonNameName = decodeOptionalStringType(json.sfAccountCommonNameName),
		sfAccountCommonNameTypeC = decodeOptionalStringType(json.sfAccountCommonNameTypeC),
		sfAccountCommonNameIndustry = decodeOptionalStringType(json.sfAccountCommonNameIndustry),
		sfAccountCommonNameBeneficialCountryFormulaC = decodeOptionalStringType(json.sfAccountCommonNameBeneficialCountryFormulaC),
		sfAccountCommonNameTCGGlobalIdC = decodeOptionalStringType(json.sfAccountCommonNameTCGGlobalIdC),
		sfAccountCommonNameAccountTeamMembersC = decodeOptionalStringType(json.sfAccountCommonNameAccountTeamMembersC),
		sfAccountCommonNameDescription = decodeOptionalStringType(json.sfAccountCommonNameDescription),
		sfAccountCommonNameBillingAddress = decodeOptionalStringType(json.sfAccountCommonNameBillingAddress),
		sfAccountCommonNameShippingAddress = decodeOptionalStringType(json.sfAccountCommonNameShippingAddress),
		sfAccountCommonNamePhone = decodeOptionalStringType(json.sfAccountCommonNamePhone),
		sfAccountCommonNameWebsite = decodeOptionalStringType(json.sfAccountCommonNameWebsite),
		sfAccountCommonNameRecordTypeId = decodeOptionalStringType(json.sfAccountCommonNameRecordTypeId),
		sfAccountSubscriptionInvestorName = decodeOptionalStringType(json.sfAccountSubscriptionInvestorName),
		sfAccountSubscriptionInvestorType = decodeOptionalStringType(json.sfAccountSubscriptionInvestorType),
		sfAccountSubscriptionInvestorWLCTradeNameC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWLCTradeNameC),
		sfAccountSubscriptionInvestorCommonNameC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorCommonNameC),
		sfAccountSubscriptionInvestorPhone = decodeOptionalStringType(json.sfAccountSubscriptionInvestorPhone),
		sfAccountSubscriptionInvestorBillingCountry = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBillingCountry),
		sfAccountSubscriptionInvestorBillingStreet = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBillingStreet),
		sfAccountSubscriptionInvestorBillingCity = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBillingCity),
		sfAccountSubscriptionInvestorBillingState = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBillingState),
		sfAccountSubscriptionInvestorBillingPostalCode = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBillingPostalCode),
		anduinAccountSubscriptionInvestorBillingFullAddress = decodeOptionalStringType(json.anduinAccountSubscriptionInvestorBillingFullAddress),
		sfAccountSubscriptionInvestorParentId = decodeOptionalStringType(json.sfAccountSubscriptionInvestorParentId),
		sfAccountSubscriptionInvestorParentTypeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorParentTypeC),
		sfAccountSubscriptionInvestorWLCOccupationC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWLCOccupationC),
		sfAccountSubscriptionInvestorWLCTitleC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWLCTitleC),
		sfAccountSubscriptionInvestorWLCEmployerNameC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWLCEmployerNameC),
		sfAccountSubscriptionInvestorWLCSubscribingAsARepresentativeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorWLCSubscribingAsARepresentativeC),
		sfAccountSubscriptionInvestorWLCSubscribingAsRepresentativeDetailsC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWLCSubscribingAsRepresentativeDetailsC),
		sfAccountSubscriptionInvestorIndustry = decodeOptionalStringType(json.sfAccountSubscriptionInvestorIndustry),
		sfAccountSubscriptionInvestorDomesticForeignC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorDomesticForeignC),
		sfAccountSubscriptionInvestorCitizenshipC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorCitizenshipC),
		sfAccountSubscriptionInvestorTCGGlobalIdC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTCGGlobalIdC),
		sfAccountSubscriptionInvestorHasCarlyleOnboardingC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorHasCarlyleOnboardingC),
		sfAccountSubscriptionInvestorHasSolutionsOnboardingC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorHasSolutionsOnboardingC),
		sfAccountSubscriptionInvestorDisregardedEntityC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorDisregardedEntityC),
		sfAccountSubscriptionInvestorIndividualOrganizationC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIndividualOrganizationC),
		sfAccountSubscriptionInvestorTaxCountryJurisdictionC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTaxCountryJurisdictionC),
		sfAccountSubscriptionInvestorStateOfTaxResidenceC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorStateOfTaxResidenceC),
		sfAccountSubscriptionInvestorAMLInvestorTypeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorAMLInvestorTypeC),
		sfAccountSubscriptionInvestorAMLAddressCityC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAMLAddressCityC),
		sfAccountSubscriptionInvestorAMLAddressStateProvinceC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAMLAddressStateProvinceC),
		sfAccountSubscriptionInvestorBeneficialOwnerTypeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBeneficialOwnerTypeC),
		sfAccountSubscriptionInvestorAMLAddressCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAMLAddressCountryC),
		sfAccountSubscriptionInvestorBeneficialCountryFormulaC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBeneficialCountryFormulaC),
		sfAccountSubscriptionInvestorRegulatedEntityC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorRegulatedEntityC),
		sfAccountSubscriptionInvestorRiskRatingC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorRiskRatingC),
		sfAccountSubscriptionInvestorBrokerDealerC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorBrokerDealerC),
		anduinAccountSubscriptionInvestorBrokerDealerC = decodeOptionalMultipleCheckboxType(json.anduinAccountSubscriptionInvestorBrokerDealerC),
		sfAccountSubscriptionInvestorRiskRating3NotesC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorRiskRating3NotesC),
		sfAccountSubscriptionInvestorBankNameC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBankNameC),
		sfAccountSubscriptionInvestorBankLocationC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBankLocationC),
		sfAccountSubscriptionInvestorRiskCommitteeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorRiskCommitteeC),
		sfAccountSubscriptionInvestorFINRARetailInvestorC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorFINRARetailInvestorC),
		sfAccountSubscriptionInvestorLuxTaxAssessmentRatingC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorLuxTaxAssessmentRatingC),
		sfAccountSubscriptionInvestorWebsite = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWebsite),
		sfAccountSubscriptionInvestorHighRiskJurisdictionC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorHighRiskJurisdictionC),
		sfAccountSubscriptionInvestorEligibleIntroducerLetterCertificateC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorEligibleIntroducerLetterCertificateC),
		sfAccountSubscriptionInvestorMediumHighRiskJurisdictionC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorMediumHighRiskJurisdictionC),
		sfAccountSubscriptionInvestorIntroducerLetterCertificateCommentsC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorIntroducerLetterCertificateCommentsC),
		sfAccountSubscriptionInvestorNomineeIntermediaryC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorNomineeIntermediaryC),
		sfAccountSubscriptionInvestorAMLPreClearanceC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorAMLPreClearanceC),
		sfAccountSubscriptionInvestorHighRiskIndustryC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorHighRiskIndustryC),
		sfAccountSubscriptionInvestorAMLPreClearanceFundsC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAMLPreClearanceFundsC),
		sfAccountSubscriptionInvestorComplexStructureC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorComplexStructureC),
		sfAccountSubscriptionInvestorTypeOfBlockC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTypeOfBlockC),
		sfAccountSubscriptionInvestorNegativeNewsC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorNegativeNewsC),
		sfAccountSubscriptionInvestorAccountBlockingC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorAccountBlockingC),
		sfAccountSubscriptionInvestorBearerSharesC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorBearerSharesC),
		sfAccountSubscriptionInvestorAccountBlockingDateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAccountBlockingDateC),
		sfAccountSubscriptionInvestorShellBankC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorShellBankC),
		sfAccountSubscriptionInvestorAccountBlockingRemovedDateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAccountBlockingRemovedDateC),
		sfAccountSubscriptionInvestorPoliticallyExposedPersonPEPC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorPoliticallyExposedPersonPEPC),
		sfAccountSubscriptionInvestorAMLReviewCycleC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAMLReviewCycleC),
		sfAccountSubscriptionInvestorPEPStatusDetailsC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorPEPStatusDetailsC),
		sfAccountSubscriptionInvestorNextAMLReviewDateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorNextAMLReviewDateC),
		sfAccountSubscriptionInvestorPEPStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorPEPStatusC),
		sfAccountSubscriptionInvestorMarketingMethodC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorMarketingMethodC),
		sfAccountSubscriptionInvestorSourceOfWealthCategoryC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorSourceOfWealthCategoryC),
		sfAccountSubscriptionInvestorMarketingDetailsC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorMarketingDetailsC),
		sfAccountSubscriptionInvestorSourceOfWealthC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorSourceOfWealthC),
		sfAccountSubscriptionInvestorMiFIDClientCategoryC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorMiFIDClientCategoryC),
		sfAccountSubscriptionInvestorSourceOfFundsCategoryC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorSourceOfFundsCategoryC),
		sfAccountSubscriptionInvestorSourceOfFundsDetailsC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorSourceOfFundsDetailsC),
		sfAccountSubscriptionInvestorSoWSoFCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorSoWSoFCountryC),
		sfAccountSubscriptionInvestorLegalStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorLegalStatusC),
		sfAccountSubscriptionInvestorHighRiskFactorsC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorHighRiskFactorsC),
		sfAccountSubscriptionInvestorAwarenessNexusC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAwarenessNexusC),
		sfAccountSubscriptionInvestorAMLNotesC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAMLNotesC),
		sfAccountSubscriptionInvestorApprovalStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorApprovalStatusC),
		sfAccountSubscriptionInvestorNameChangeApprovalStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorNameChangeApprovalStatusC),
		sfAccountSubscriptionInvestorAMLApproverC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAMLApproverC),
		sfAccountSubscriptionInvestorFMApproverC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorFMApproverC),
		sfAccountSubscriptionInvestorFormTypeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorFormTypeC),
		sfAccountSubscriptionInvestorTaxIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTaxIDC),
		sfAccountSubscriptionInvestorFMTaxIdC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorFMTaxIdC),
		sfAccountSubscriptionInvestorEquityTaxIdC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorEquityTaxIdC),
		sfAccountSubscriptionInvestorTaxEntityTypeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTaxEntityTypeC),
		sfAccountSubscriptionInvestorTaxStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTaxStatusC),
		sfAccountSubscriptionInvestorFATCAStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorFATCAStatusC),
		sfAccountSubscriptionInvestorUSTINTypeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorUSTINTypeC),
		sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberC),
		sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorForeignTaxIdentifyingNumberCountryC),
		sfAccountSubscriptionInvestorWithholdingForeignPartnershipEINC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWithholdingForeignPartnershipEINC),
		sfAccountSubscriptionInvestorTaxResidencyCertificatesC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTaxResidencyCertificatesC),
		sfAccountSubscriptionInvestorSponsoringEntityGIINC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorSponsoringEntityGIINC),
		sfAccountSubscriptionInvestorW9OtherEntityTypeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorW9OtherEntityTypeC),
		sfAccountSubscriptionInvestorAccountOpeningDateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAccountOpeningDateC),
		sfAccountSubscriptionInvestorJointAccountNameC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorJointAccountNameC),
		sfAccountSubscriptionInvestorTreatyCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTreatyCountryC),
		sfAccountSubscriptionInvestorCountryOfBirthC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorCountryOfBirthC),
		sfAccountSubscriptionInvestorCitizenshipCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorCitizenshipCountryC),
		sfAccountSubscriptionInvestorCountryOfIncorporationFormationC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorCountryOfIncorporationFormationC),
		sfAccountSubscriptionInvestorExemptionFromFATCAReportingCodeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorExemptionFromFATCAReportingCodeC),
		sfAccountSubscriptionInvestorExemptPayeeCodeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorExemptPayeeCodeC),
		sfAccountSubscriptionInvestorDateOfBirthC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorDateOfBirthC),
		sfAccountSubscriptionInvestorBranchGIINC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorBranchGIINC),
		sfAccountSubscriptionInvestorGIINStatusDateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorGIINStatusDateC),
		sfAccountSubscriptionInvestorGIINC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorGIINC),
		sfAccountSubscriptionInvestorGIINStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorGIINStatusC),
		sfAccountSubscriptionInvestorQualifiedForeignPensionFundQFPFC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorQualifiedForeignPensionFundQFPFC),
		sfAccountSubscriptionInvestorTaxReportingByAlpInvestC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTaxReportingByAlpInvestC),
		sfAccountSubscriptionInvestorTaxAccountOwnerC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTaxAccountOwnerC),
		sfAccountSubscriptionInvestorTAOBillingCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOBillingCountryC),
		sfAccountSubscriptionInvestorTAOBillingStreetC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOBillingStreetC),
		sfAccountSubscriptionInvestorTAOBillingCityC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOBillingCityC),
		sfAccountSubscriptionInvestorTAOBillingStateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOBillingStateC),
		sfAccountSubscriptionInvestorTAOBillingPostalCodeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOBillingPostalCodeC),
		sfAccountSubscriptionInvestorTAOBillingStreet2C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOBillingStreet2C),
		sfAccountSubscriptionInvestorTAOTaxStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOTaxStatusC),
		sfAccountSubscriptionInvestorTAOCitizenshipCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOCitizenshipCountryC),
		sfAccountSubscriptionInvestorTAOCountryOfIncorporationFormationC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOCountryOfIncorporationFormationC),
		sfAccountSubscriptionInvestorTAOUSTaxIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOUSTaxIDC),
		sfAccountSubscriptionInvestorTAOIndividualOrOrganizationC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOIndividualOrOrganizationC),
		sfAccountSubscriptionInvestorTAOUSTINTypeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOUSTINTypeC),
		sfAccountSubscriptionInvestorTAOInvestorForeignDomesticC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOInvestorForeignDomesticC),
		sfAccountSubscriptionInvestorTAONonUSTaxIDCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAONonUSTaxIDCountryC),
		sfAccountSubscriptionInvestorTAOForeignTaxIdC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOForeignTaxIdC),
		sfAccountSubscriptionInvestorTAOWithholdingForeignPartnershipEINC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOWithholdingForeignPartnershipEINC),
		sfAccountSubscriptionInvestorTAODateOfBirthC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAODateOfBirthC),
		sfAccountSubscriptionInvestorTAOExemptionFromFATCAReportingCodeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOExemptionFromFATCAReportingCodeC),
		sfAccountSubscriptionInvestorTAOTaxCountryJurisdictionC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOTaxCountryJurisdictionC),
		sfAccountSubscriptionInvestorTAOExemptPayeeCodeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOExemptPayeeCodeC),
		sfAccountSubscriptionInvestorTAOShippingCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOShippingCountryC),
		sfAccountSubscriptionInvestorTAOShippingStreetC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOShippingStreetC),
		sfAccountSubscriptionInvestorTAOShippingCityC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOShippingCityC),
		sfAccountSubscriptionInvestorTAOInvestorMailingStateProvinceC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOInvestorMailingStateProvinceC),
		sfAccountSubscriptionInvestorTAOShippingPostalCodeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOShippingPostalCodeC),
		sfAccountSubscriptionInvestorTAOShippingStreet2C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOShippingStreet2C),
		sfAccountSubscriptionInvestorTAOTaxFormTypeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOTaxFormTypeC),
		sfAccountSubscriptionInvestorTAOBranchGIINC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOBranchGIINC),
		sfAccountSubscriptionInvestorTAOGIINC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOGIINC),
		sfAccountSubscriptionInvestorTAOCountryOfBirthC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOCountryOfBirthC),
		sfAccountSubscriptionInvestorTAOFATCAClassificationC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOFATCAClassificationC),
		sfAccountSubscriptionInvestorTAOSponsoringEntityGIINC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOSponsoringEntityGIINC),
		sfAccountSubscriptionInvestorTAOW9OtherEntityTypeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOW9OtherEntityTypeC),
		sfAccountSubscriptionInvestorTAOFirstNameC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOFirstNameC),
		sfAccountSubscriptionInvestorTAOLastNameC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOLastNameC),
		sfAccountSubscriptionInvestorTAOMiddleNameC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOMiddleNameC),
		sfAccountSubscriptionInvestorTAOFATCAStatusC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOFATCAStatusC),
		sfAccountSubscriptionInvestorTAOExemptionFromFATCAWithholdingCodC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOExemptionFromFATCAWithholdingCodC),
		sfAccountSubscriptionInvestorIdentificationAsASpecifiedUKPersonC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIdentificationAsASpecifiedUKPersonC),
		sfAccountSubscriptionInvestorCDOTEntityAccountHolderStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorCDOTEntityAccountHolderStatusC),
		sfAccountSubscriptionInvestorAffiliatedCorporationC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorAffiliatedCorporationC),
		sfAccountSubscriptionInvestorReportableUKPersonC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorReportableUKPersonC),
		sfAccountSubscriptionInvestorReportableGGYJEYGIBIOMPersonC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorReportableGGYJEYGIBIOMPersonC),
		sfAccountSubscriptionInvestorCRSClassificationC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorCRSClassificationC),
		sfAccountSubscriptionInvestorRelatedEntityC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorRelatedEntityC),
		sfAccountSubscriptionInvestorPlaceOfBirthC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorPlaceOfBirthC),
		sfAccountSubscriptionInvestorDateOfOrganizationFormationDateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorDateOfOrganizationFormationDateC),
		sfAccountSubscriptionInvestorEffectiveDateOfSelfCertificationC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorEffectiveDateOfSelfCertificationC),
		sfAccountSubscriptionInvestorNameOfSecuritiesMarketC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorNameOfSecuritiesMarketC),
		sfAccountSubscriptionInvestorStatusOfCRSReviewC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorStatusOfCRSReviewC),
		sfAccountSubscriptionInvestorReportableNonReportableAccountC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorReportableNonReportableAccountC),
		sfAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC),
		anduinAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC = decodeOptionalMultipleCheckboxType(json.anduinAccountSubscriptionInvestorDoesTheEntityHaveControllingPersonsC),
		sfAccountSubscriptionInvestorReportingCountriesC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorReportingCountriesC),
		sfAccountSubscriptionInvestorTINUnavailableC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINUnavailableC),
		sfAccountSubscriptionInvestorTINCountryNo1C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINCountryNo1C),
		sfAccountSubscriptionInvestorTINNo1C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINNo1C),
		sfAccountSubscriptionInvestorTINCountryNo2C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINCountryNo2C),
		sfAccountSubscriptionInvestorTINNo2C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINNo2C),
		sfAccountSubscriptionInvestorTINCountryNo3C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINCountryNo3C),
		sfAccountSubscriptionInvestorTINNo3C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINNo3C),
		sfAccountSubscriptionInvestorTINCountryNo4C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINCountryNo4C),
		sfAccountSubscriptionInvestorTINNo4C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINNo4C),
		sfAccountSubscriptionInvestorTINCountryNo5C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINCountryNo5C),
		sfAccountSubscriptionInvestorTINNo5C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTINNo5C),
		sfAccountSubscriptionInvestorRegisteredAddress2C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorRegisteredAddress2C),
		sfAccountSubscriptionInvestorMailingAddress2C = decodeOptionalStringType(json.sfAccountSubscriptionInvestorMailingAddress2C),
		sfAccountSubscriptionInvestorAccreditedInvestorStatusEntitiesC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorAccreditedInvestorStatusEntitiesC),
		sfAccountSubscriptionInvestorAccreditedInvestorStatusIndividualC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorAccreditedInvestorStatusIndividualC),
		sfAccountSubscriptionInvestorGovernmentIssuedIDOnFileC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorGovernmentIssuedIDOnFileC),
		sfAccountSubscriptionInvestorGovernmentIDExpirationDateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorGovernmentIDExpirationDateC),
		sfAccountSubscriptionInvestorExpirationOfRestrictiveCovenantPerioC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorExpirationOfRestrictiveCovenantPerioC),
		sfAccountSubscriptionInvestorIsCapitalShareholderControlledC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIsCapitalShareholderControlledC),
		sfAccountSubscriptionInvestorIsIndivRetirementBenefitPlanC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIsIndivRetirementBenefitPlanC),
		sfAccountSubscriptionInvestorIsBHCC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIsBHCC),
		sfAccountSubscriptionInvestorIndividualRetirementAccountIRAC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIndividualRetirementAccountIRAC),
		sfAccountSubscriptionInvestorQualifiedPurchaserC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorQualifiedPurchaserC),
		sfAccountSubscriptionInvestorQualifiedInvestorStatusEntityC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorQualifiedInvestorStatusEntityC),
		sfAccountSubscriptionInvestorQualifiedClientStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorQualifiedClientStatusC),
		sfAccountSubscriptionInvestorQualifiedInvestorStatusIndividualC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorQualifiedInvestorStatusIndividualC),
		sfAccountSubscriptionInvestorIsJapaneseResC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIsJapaneseResC),
		sfAccountSubscriptionInvestorIsFIELQualifiedC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIsFIELQualifiedC),
		sfAccountSubscriptionInvestorIsArticle63AppliedC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIsArticle63AppliedC),
		sfAccountSubscriptionInvestorEUElectiveProfessionalClientC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorEUElectiveProfessionalClientC),
		sfAccountSubscriptionInvestorDescription = decodeOptionalStringType(json.sfAccountSubscriptionInvestorDescription),
		sfAccountSubscriptionInvestorUBSEscrowAccountC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorUBSEscrowAccountC),
		sfAccountSubscriptionInvestorMSSBIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorMSSBIDC),
		sfAccountSubscriptionInvestorMRORC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorMRORC),
		sfAccountSubscriptionInvestorIsUSTaxExemptC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIsUSTaxExemptC),
		sfAccountSubscriptionInvestorIsSection115Entity = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorIsSection115Entity),
		sfAccountSubscriptionInvestorOwnerIsUSTaxExempt = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorOwnerIsUSTaxExempt),
		sfAccountSubscriptionInvestorTreatedAsTaxExemptLP = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTreatedAsTaxExemptLP),
		sfAccountSubscriptionInvestorTaxExemptSubtypeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTaxExemptSubtypeC),
		sfAccountSubscriptionInvestorExemptFromStateAndLocalIncomeTaxC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorExemptFromStateAndLocalIncomeTaxC),
		sfAccountSubscriptionInvestorWHRateOIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWHRateOIDC),
		sfAccountSubscriptionInvestorWHRateECIC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWHRateECIC),
		sfAccountSubscriptionInvestorWHRateFATCAC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWHRateFATCAC),
		sfAccountSubscriptionInvestorRecordTypeId = decodeOptionalStringType(json.sfAccountSubscriptionInvestorRecordTypeId),
		sfAccountSubscriptionInvestorAccountStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorAccountStatusC),
		sfAccountSubscriptionInvestorWLCRegulatorC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWLCRegulatorC),
		sfAccountSubscriptionInvestorWLCExchangeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWLCExchangeC),
		sfAccountSubscriptionInvestorWLCTickerSymbolC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWLCTickerSymbolC),
		sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorWLCPubliclyListedOnAStockExchangeC),
		anduinAccountSubscriptionInvestorSignerFirstName = decodeOptionalStringType(json.anduinAccountSubscriptionInvestorSignerFirstName),
		anduinAccountSubscriptionInvestorSignerMiddleName = decodeOptionalStringType(json.anduinAccountSubscriptionInvestorSignerMiddleName),
		anduinAccountSubscriptionInvestorSignerLastName = decodeOptionalStringType(json.anduinAccountSubscriptionInvestorSignerLastName),
		sfAccountSubscriptionInvestorSignerFirstName = decodeOptionalStringType(json.sfAccountSubscriptionInvestorSignerFirstName),
		sfAccountSubscriptionInvestorSignerMiddleName = decodeOptionalStringType(json.sfAccountSubscriptionInvestorSignerMiddleName),
		sfAccountSubscriptionInvestorSignerLastName = decodeOptionalStringType(json.sfAccountSubscriptionInvestorSignerLastName),
		sfAgreementOnboardingNameC = decodeOptionalStringType(json.sfAgreementOnboardingNameC),
		sfAgreementOnboardingStatusC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingStatusC),
		sfAgreementOnboardingTypeC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingTypeC),
		sfAgreementOnboardingCommonSubscriptionEntityC = decodeOptionalStringType(json.sfAgreementOnboardingCommonSubscriptionEntityC),
		sfAgreementOnboardingSubscriptionInvestorApprovalStatusC = decodeOptionalStringType(json.sfAgreementOnboardingSubscriptionInvestorApprovalStatusC),
		sfAgreementOnboardingAccountC = decodeOptionalStringType(json.sfAgreementOnboardingAccountC),
		sfAgreementOnboardingRelatedCommonNameC = decodeOptionalStringType(json.sfAgreementOnboardingRelatedCommonNameC),
		sfAgreementOnboardingSIIndividualOrOrganizationC = decodeOptionalStringType(json.sfAgreementOnboardingSIIndividualOrOrganizationC),
		sfAgreementOnboardingSIInvestorForeignDomesticC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorForeignDomesticC),
		sfAgreementOnboardingOriginalCompletedDateC = decodeOptionalStringType(json.sfAgreementOnboardingOriginalCompletedDateC),
		sfAgreementOnboardingParentAgreementIdC = decodeOptionalStringType(json.sfAgreementOnboardingParentAgreementIdC),
		sfAgreementOnboardingCommitmentTypeC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingCommitmentTypeC),
		sfAgreementOnboardingInvestorFundC = decodeOptionalStringType(json.sfAgreementOnboardingInvestorFundC),
		sfAgreementOnboardingOpportunityC = decodeOptionalStringType(json.sfAgreementOnboardingOpportunityC),
		sfAgreementOnboardingFundC = decodeOptionalStringType(json.sfAgreementOnboardingFundC),
		sfAgreementOnboardingCurrencyC = decodeOptionalStringType(json.sfAgreementOnboardingCurrencyC),
		sfAgreementOnboardingFundCloseC = decodeOptionalStringType(json.sfAgreementOnboardingFundCloseC),
		sfAgreementOnboardingPartnershipC = decodeOptionalStringType(json.sfAgreementOnboardingPartnershipC),
		sfAgreementOnboardingRequestedCommitmentAmountC = decodeOptionalStringType(json.sfAgreementOnboardingRequestedCommitmentAmountC),
		sfAgreementOnboardingCommitmentC = decodeOptionalStringType(json.sfAgreementOnboardingCommitmentC),
		sfAgreementOnboardingUSDAmountC = decodeOptionalStringType(json.sfAgreementOnboardingUSDAmountC),
		sfAgreementOnboardingEffectiveDateC = decodeOptionalStringType(json.sfAgreementOnboardingEffectiveDateC),
		sfAgreementOnboardingInvestranVehicleTypeC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingInvestranVehicleTypeC),
		sfAgreementOnboardingRelatedAgreementsGroupC = decodeOptionalStringType(json.sfAgreementOnboardingRelatedAgreementsGroupC),
		sfAgreementOnboardingAssociatedLegalEntitiesC = decodeOptionalStringType(json.sfAgreementOnboardingAssociatedLegalEntitiesC),
		sfAgreementOnboardingAgreementLegalEntitiesExternalIdsC = decodeOptionalStringType(json.sfAgreementOnboardingAgreementLegalEntitiesExternalIdsC),
		sfAgreementOnboardingSIInvestorRegisteredCountryC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorRegisteredCountryC),
		sfAgreementOnboardingSIInvestorRegisteredStreetAddressC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorRegisteredStreetAddressC),
		sfAgreementOnboardingSIInvestorRegisteredCityC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorRegisteredCityC),
		sfAgreementOnboardingSIInvestorRegisteredStateProvinceC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorRegisteredStateProvinceC),
		sfAgreementOnboardingSIInvestorRegisteredPostalCodeC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorRegisteredPostalCodeC),
		sfAgreementOnboardingSIInvestorRegisteredAddress2C = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorRegisteredAddress2C),
		sfAgreementOnboardingSIInvestorMailingCountryC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorMailingCountryC),
		sfAgreementOnboardingSIInvestorMailingStreetC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorMailingStreetC),
		sfAgreementOnboardingSIInvestorMailingCityC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorMailingCityC),
		sfAgreementOnboardingSIInvestorMailingStateProvinceC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorMailingStateProvinceC),
		sfAgreementOnboardingSIInvestorMailingZipPostalCodeC = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorMailingZipPostalCodeC),
		sfAgreementOnboardingSIInvestorMailingAddress2C = decodeOptionalStringType(json.sfAgreementOnboardingSIInvestorMailingAddress2C),
		sfAgreementOnboardingSIUSTaxpayerIdentificationNumberC = decodeOptionalStringType(json.sfAgreementOnboardingSIUSTaxpayerIdentificationNumberC),
		sfAgreementOnboardingSIUSTINTypeC = decodeOptionalStringType(json.sfAgreementOnboardingSIUSTINTypeC),
		sfAgreementOnboardingSITaxStatusC = decodeOptionalStringType(json.sfAgreementOnboardingSITaxStatusC),
		sfAgreementOnboardingSITaxCountryJurisdictionC = decodeOptionalStringType(json.sfAgreementOnboardingSITaxCountryJurisdictionC),
		sfAgreementOnboardingSIFATCAClassificationC = decodeOptionalStringType(json.sfAgreementOnboardingSIFATCAClassificationC),
		sfAgreementOnboardingSINonUSTaxIDC = decodeOptionalStringType(json.sfAgreementOnboardingSINonUSTaxIDC),
		sfAgreementOnboardingSINonUSTaxIDCountryC = decodeOptionalStringType(json.sfAgreementOnboardingSINonUSTaxIDCountryC),
		sfAgreementOnboardingSICitizenshipCountryC = decodeOptionalStringType(json.sfAgreementOnboardingSICitizenshipCountryC),
		sfAgreementOnboardingSICountryOfIncorporationFormationC = decodeOptionalStringType(json.sfAgreementOnboardingSICountryOfIncorporationFormationC),
		sfAgreementOnboardingSICountryOfBirthC = decodeOptionalStringType(json.sfAgreementOnboardingSICountryOfBirthC),
		sfAgreementOnboardingSIDateOfBirthC = decodeOptionalStringType(json.sfAgreementOnboardingSIDateOfBirthC),
		sfAgreementOnboardingSIExemptionFromFATCAReportingCodeC = decodeOptionalStringType(json.sfAgreementOnboardingSIExemptionFromFATCAReportingCodeC),
		sfAgreementOnboardingSIExemptPayeeCodeC = decodeOptionalStringType(json.sfAgreementOnboardingSIExemptPayeeCodeC),
		sfAgreementOnboardingSIGIINC = decodeOptionalStringType(json.sfAgreementOnboardingSIGIINC),
		sfAgreementOnboardingSIBranchGIINC = decodeOptionalStringType(json.sfAgreementOnboardingSIBranchGIINC),
		sfAgreementOnboardingX892CAIC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingX892CAIC),
		sfAgreementOnboardingX892CAITextC = decodeOptionalStringType(json.sfAgreementOnboardingX892CAITextC),
		sfAgreementOnboardingTaxExemptStatusNotesC = decodeOptionalStringType(json.sfAgreementOnboardingTaxExemptStatusNotesC),
		sfAgreementOnboardingERISAPartnerC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingERISAPartnerC),
		sfAgreementOnboardingIsERISATitleIC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingIsERISATitleIC),
		anduinAgreementOnboardingIsERISATitleIC = decodeOptionalMultipleCheckboxType(json.anduinAgreementOnboardingIsERISATitleIC),
		sfAgreementOnboardingSIDisregardedGPOfGPC = decodeOptionalStringType(json.sfAgreementOnboardingSIDisregardedGPOfGPC),
		sfAgreementOnboardingSIQualifiedInstitutionalInvestorFIELC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingSIQualifiedInstitutionalInvestorFIELC),
		sfAgreementOnboardingSIFundingParentSubEntityC = decodeOptionalStringType(json.sfAgreementOnboardingSIFundingParentSubEntityC),
		sfAgreementOnboardingSIArticle63Paragraph1AppliesC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingSIArticle63Paragraph1AppliesC),
		sfAgreementOnboardingSIFundingSiloC = decodeOptionalStringType(json.sfAgreementOnboardingSIFundingSiloC),
		sfAgreementOnboardingNewCommitmentOrTransferC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingNewCommitmentOrTransferC),
		sfAgreementOnboardingConfirmationOfInvestmentOnOwnBehalfC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingConfirmationOfInvestmentOnOwnBehalfC),
		sfAgreementOnboardingInvestorTypeC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingInvestorTypeC),
		sfAgreementOnboardingLuxTaxAssessmentC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingLuxTaxAssessmentC),
		sfAgreementOnboardingInvestingInLuxFundsC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingInvestingInLuxFundsC),
		sfAgreementOnboardingLuxTaxAssessmentScoreC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingLuxTaxAssessmentScoreC),
		sfAgreementOnboardingSourceOfFundsC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingSourceOfFundsC),
		sfAgreementOnboardingEvidenceOfExistenceC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingEvidenceOfExistenceC),
		sfAgreementOnboardingSourceOfWealthC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingSourceOfWealthC),
		sfAgreementOnboardingEvidenceOfCorporateAuthorityC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingEvidenceOfCorporateAuthorityC),
		sfAgreementOnboardingSourceOfWealthDetailsC = decodeOptionalStringType(json.sfAgreementOnboardingSourceOfWealthDetailsC),
		sfAgreementOnboardingSignedStructureChartC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingSignedStructureChartC),
		sfAgreementOnboardingListOfLegalRepsAndDirectorsC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingListOfLegalRepsAndDirectorsC),
		sfAgreementOnboardingEvidenceOfEachTierOfTheStructureC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingEvidenceOfEachTierOfTheStructureC),
		sfAgreementOnboardingIdentificationOfAuthorizedSignatoriesC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingIdentificationOfAuthorizedSignatoriesC),
		sfAgreementOnboardingIdentificationOfUBOsC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingIdentificationOfUBOsC),
		sfAgreementOnboardingFinCENControlPersonC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingFinCENControlPersonC),
		sfAgreementOnboardingWorldCheckResultsC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingWorldCheckResultsC),
		sfAgreementOnboardingControlPersonJurisdictionC = decodeOptionalStringType(json.sfAgreementOnboardingControlPersonJurisdictionC),
		sfAgreementOnboardingWorldCheckDetailsC = decodeOptionalStringType(json.sfAgreementOnboardingWorldCheckDetailsC),
		sfAgreementOnboardingExceptionsWaiversC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingExceptionsWaiversC),
		sfAgreementOnboardingApprovalForHighRiskOrPEPC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingApprovalForHighRiskOrPEPC),
		sfAgreementOnboardingExceptionsWaiversDetailsC = decodeOptionalStringType(json.sfAgreementOnboardingExceptionsWaiversDetailsC),
		sfAgreementOnboardingAnalystC = decodeOptionalStringType(json.sfAgreementOnboardingAnalystC),
		sfAgreementOnboardingKYCSatisfactoryC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingKYCSatisfactoryC),
		sfAgreementOnboardingAMLReviewInitiatedC = decodeOptionalStringType(json.sfAgreementOnboardingAMLReviewInitiatedC),
		sfAgreementOnboardingPostCloseDetailsC = decodeOptionalStringType(json.sfAgreementOnboardingPostCloseDetailsC),
		sfAgreementOnboardingAMLClearanceDateC = decodeOptionalStringType(json.sfAgreementOnboardingAMLClearanceDateC),
		sfAgreementOnboardingPostCloseFollowUpDateC = decodeOptionalStringType(json.sfAgreementOnboardingPostCloseFollowUpDateC),
		sfAgreementOnboardingAMLNotesC = decodeOptionalStringType(json.sfAgreementOnboardingAMLNotesC),
		sfAgreementOnboardingAMLApprovalDateC = decodeOptionalStringType(json.sfAgreementOnboardingAMLApprovalDateC),
		sfAgreementOnboardingEligibleIntroducerLetterCertificateC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingEligibleIntroducerLetterCertificateC),
		sfAgreementOnboardingExternalAccountNumberC = decodeOptionalStringType(json.sfAgreementOnboardingExternalAccountNumberC),
		sfAgreementOnboardingCommentsC = decodeOptionalStringType(json.sfAgreementOnboardingCommentsC),
		sfAgreementOnboardingExternalAccountInstitutionC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingExternalAccountInstitutionC),
		sfAgreementOnboardingAMLDataApprovedC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingAMLDataApprovedC),
		sfAgreementOnboardingAMLApproverC = decodeOptionalStringType(json.sfAgreementOnboardingAMLApproverC),
		sfAgreementOnboardingAMLApprovedC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingAMLApprovedC),
		sfAgreementOnboardingFMApprovedC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingFMApprovedC),
		sfAgreementOnboardingSkipAMLApprovalsC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingSkipAMLApprovalsC),
		sfAgreementOnboardingIFStatusC = decodeOptionalStringType(json.sfAgreementOnboardingIFStatusC),
		sfAgreementOnboardingRecordTypeId = decodeOptionalStringType(json.sfAgreementOnboardingRecordTypeId),
		sfAgreementOnboardingSIInvestingAssetsOfAnyRetirementPlC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingSIInvestingAssetsOfAnyRetirementPlC),
		sfAgreementOnboardingIsInvestorControllingC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingIsInvestorControllingC),
		sfAgreementOnboardingIsERISAFOIAC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingIsERISAFOIAC),
		sfAgreementOnboardingSIQualifiedInvestorStatusEntityC = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingSIQualifiedInvestorStatusEntityC),
		anduinAgreementOnboardingSignerFirstName = decodeOptionalStringType(json.anduinAgreementOnboardingSignerFirstName),
		anduinAgreementOnboardingSignerMiddleName = decodeOptionalStringType(json.anduinAgreementOnboardingSignerMiddleName),
		anduinAgreementOnboardingSignerLastName = decodeOptionalStringType(json.anduinAgreementOnboardingSignerLastName),
		sfAgreementOnboardingSignerFirstName = decodeOptionalStringType(json.sfAgreementOnboardingSignerFirstName),
		sfAgreementOnboardingSignerMiddleName = decodeOptionalStringType(json.sfAgreementOnboardingSignerMiddleName),
		sfAgreementOnboardingSignerLastName = decodeOptionalStringType(json.sfAgreementOnboardingSignerLastName),
		sfAgreementNullTCGGlobalIdC = decodeOptionalStringType(json.sfAgreementNullTCGGlobalIdC),
		sfAgreementNullCommitmentC = decodeOptionalStringType(json.sfAgreementNullCommitmentC),
		anduinAgreementNullSignerFirstName = decodeOptionalStringType(json.anduinAgreementNullSignerFirstName),
		anduinAgreementNullSignerMiddleName = decodeOptionalStringType(json.anduinAgreementNullSignerMiddleName),
		anduinAgreementNullSignerLastName = decodeOptionalStringType(json.anduinAgreementNullSignerLastName),
		sfAgreementNullSignerFirstName = decodeOptionalStringType(json.sfAgreementNullSignerFirstName),
		sfAgreementNullSignerMiddleName = decodeOptionalStringType(json.sfAgreementNullSignerMiddleName),
		sfAgreementNullSignerLastName = decodeOptionalStringType(json.sfAgreementNullSignerLastName),
		sfAgreementNullWLCInternationalSupplementsC = decodeOptionalMultipleCheckboxType(json.sfAgreementNullWLCInternationalSupplementsC),
		sfAgreementNullReceiveUnappliedBalanceReductionAmtC = decodeOptionalMultipleCheckboxType(json.sfAgreementNullReceiveUnappliedBalanceReductionAmtC),
		sfAgreementNullIsNotIRCUSPerson = decodeOptionalMultipleCheckboxType(json.sfAgreementNullIsNotIRCUSPerson),
		sfAgreementNullOwnerIsNotIRCUSPerson = decodeOptionalMultipleCheckboxType(json.sfAgreementNullOwnerIsNotIRCUSPerson),
		sfAgreementNullTreatedAsNonUSLP = decodeOptionalMultipleCheckboxType(json.sfAgreementNullTreatedAsNonUSLP),
		sfAgreementNullECIC = decodeOptionalMultipleCheckboxType(json.sfAgreementNullECIC),
		sfAgreementNullUBTIC = decodeOptionalMultipleCheckboxType(json.sfAgreementNullUBTIC),
		sfAgreementNullUSRPHCC = decodeOptionalMultipleCheckboxType(json.sfAgreementNullUSRPHCC),
		sfAgreementNullWLC894EligibleC = decodeOptionalMultipleCheckboxType(json.sfAgreementNullWLC894EligibleC),
		sfFundFundPrivateEquityRealAssetName = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetName),
		sfFundFundPrivateEquityRealAssetProductNameC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetProductNameC),
		sfFundFundPrivateEquityRealAssetFundLegalNameC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFundLegalNameC),
		sfFundFundPrivateEquityRealAssetFundAbbreviationC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFundAbbreviationC),
		sfFundFundPrivateEquityRealAssetStatusC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetStatusC),
		sfFundFundPrivateEquityRealAssetFundStatusC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFundStatusC),
		sfFundFundPrivateEquityRealAssetInactiveDateC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetInactiveDateC),
		sfFundFundPrivateEquityRealAssetVintageYearC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetVintageYearC),
		sfFundFundPrivateEquityRealAssetInvestorDiscretionC = decodeOptionalMultipleCheckboxType(json.sfFundFundPrivateEquityRealAssetInvestorDiscretionC),
		sfFundFundPrivateEquityRealAssetFundStrategyDescriptionC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFundStrategyDescriptionC),
		sfFundFundPrivateEquityRealAssetPartOfProgramC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetPartOfProgramC),
		sfFundFundPrivateEquityRealAssetPRACoverageC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetPRACoverageC),
		sfFundFundPrivateEquityRealAssetAIFMDC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetAIFMDC),
		sfFundFundPrivateEquityRealAssetMandateBackgroundC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetMandateBackgroundC),
		sfFundFundPrivateEquityRealAssetCarlyleNotResponsibleForAMLKYCC = decodeOptionalMultipleCheckboxType(json.sfFundFundPrivateEquityRealAssetCarlyleNotResponsibleForAMLKYCC),
		sfFundFundPrivateEquityRealAssetFundTypeC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFundTypeC),
		sfFundFundPrivateEquityRealAssetProductLineC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetProductLineC),
		sfFundFundPrivateEquityRealAssetProductTypeC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetProductTypeC),
		sfFundFundPrivateEquityRealAssetFundFamilyC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFundFamilyC),
		sfFundFundPrivateEquityRealAssetFundFocusC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFundFocusC),
		sfFundFundPrivateEquityRealAssetRegionC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetRegionC),
		sfFundFundPrivateEquityRealAssetStructureC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetStructureC),
		sfFundFundPrivateEquityRealAssetCurrencyC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetCurrencyC),
		sfFundFundPrivateEquityRealAssetFundFocusAdditionalInfoC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFundFocusAdditionalInfoC),
		sfFundFundPrivateEquityRealAssetFundSpecificParagraphC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFundSpecificParagraphC),
		sfFundFundPrivateEquityRealAssetManagedAccountDirectInvestmentsC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetManagedAccountDirectInvestmentsC),
		sfFundFundPrivateEquityRealAssetClosingDateC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetClosingDateC),
		sfFundFundPrivateEquityRealAssetFinalClosingDateC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFinalClosingDateC),
		sfFundFundPrivateEquityRealAssetFinalClosingDatePerLPAC = decodeOptionalStringType(json.sfFundFundPrivateEquityRealAssetFinalClosingDatePerLPAC),
		sfFundFundCloseName = decodeOptionalStringType(json.sfFundFundCloseName),
		sfFundFundCloseFundC = decodeOptionalStringType(json.sfFundFundCloseFundC),
		sfFundFundCloseCloseDateC = decodeOptionalStringType(json.sfFundFundCloseCloseDateC),
		sfFundFundCloseRecordTypeId = decodeOptionalStringType(json.sfFundFundCloseRecordTypeId),
		sfFundNullTCGGlobalIdC = decodeOptionalStringType(json.sfFundNullTCGGlobalIdC),
		sfBeneficialOwner = sfBeneficialOwner,
		sfControllingPersons = sfControllingPersons,
		sfIFCNullEmailC = decodeOptionalStringType(json.sfIFCNullEmailC),
		sfIFCNullStatusC = decodeOptionalStringType(json.sfIFCNullStatusC),
		sfIFCNullCommonNameC = decodeOptionalStringType(json.sfIFCNullCommonNameC),
		sfIFCNullInvestorClassificationC = decodeOptionalStringType(json.sfIFCNullInvestorClassificationC),
		sfIFCNullBeneficialCountryC = decodeOptionalStringType(json.sfIFCNullBeneficialCountryC),
		sfIFCNullDateOfBirthC = decodeOptionalStringType(json.sfIFCNullDateOfBirthC),
		sfIFCNullIndividualOrOrganizationC = decodeOptionalStringType(json.sfIFCNullIndividualOrOrganizationC),
		sfIFCNullFullAddressC = decodeOptionalStringType(json.sfIFCNullFullAddressC),
		sfIFCNullCreatedById = decodeOptionalStringType(json.sfIFCNullCreatedById),
		sfIFCNullName = decodeOptionalStringType(json.sfIFCNullName),
		sfIFCNullLastModifiedById = decodeOptionalStringType(json.sfIFCNullLastModifiedById),
		sfIFCNullExternalIDC = decodeOptionalStringType(json.sfIFCNullExternalIDC),
		sfIFCNullRecordTypeId = decodeOptionalStringType(json.sfIFCNullRecordTypeId),
		sfIFCNullContactCountryC = decodeOptionalStringType(json.sfIFCNullContactCountryC),
		sfIFCNullContactIDC = decodeOptionalStringType(json.sfIFCNullContactIDC),
		sfIFCNullContactNameC = decodeOptionalStringType(json.sfIFCNullContactNameC),
		sfIFCNullContactRecordTypeNameC = decodeOptionalStringType(json.sfIFCNullContactRecordTypeNameC),
		sfIFCNullContactTCGGlobalIDC = decodeOptionalStringType(json.sfIFCNullContactTCGGlobalIDC),
		sfIFCNullContactSCNRegisteredCountryC = decodeOptionalStringType(json.sfIFCNullContactSCNRegisteredCountryC),
		sfContact = sfContact,
		sfTaxFormW9TaxAccountOwner = decodeOptionalStringType(json.sfTaxFormW9TaxAccountOwner),
		sfTaxFormW9DisregardedEntityName = decodeOptionalStringType(json.sfTaxFormW9DisregardedEntityName),
		sfTaxFormW9TAOTaxAccountOwner = decodeOptionalStringType(json.sfTaxFormW9TAOTaxAccountOwner),
		sfTaxFormW9TaxStatusC = decodeOptionalMultipleCheckboxType(json.sfTaxFormW9TaxStatusC),
		sfTaxFormW9TAOTaxStatusC = decodeOptionalMultipleCheckboxType(json.sfTaxFormW9TAOTaxStatusC),
		sfTaxFormW9TaxEntityTypeC = decodeOptionalStringType(json.sfTaxFormW9TaxEntityTypeC),
		sfTaxFormW9ExemptPayeeCodeC = decodeOptionalStringType(json.sfTaxFormW9ExemptPayeeCodeC),
		sfTaxFormW9ExemptionFromFATCAReportingCodeC = decodeOptionalStringType(json.sfTaxFormW9ExemptionFromFATCAReportingCodeC),
		sfTaxFormW9TAOExemptPayeeCodeC = decodeOptionalStringType(json.sfTaxFormW9TAOExemptPayeeCodeC),
		sfTaxFormW9TAOExemptionFromFATCAReportingCodeC = decodeOptionalStringType(json.sfTaxFormW9TAOExemptionFromFATCAReportingCodeC),
		sfTaxFormW9BillingStreet = decodeOptionalStringType(json.sfTaxFormW9BillingStreet),
		sfTaxFormW9BillingCity = decodeOptionalStringType(json.sfTaxFormW9BillingCity),
		sfTaxFormW9BillingState = decodeOptionalStringType(json.sfTaxFormW9BillingState),
		sfTaxFormW9BillingPostalCode = decodeOptionalStringType(json.sfTaxFormW9BillingPostalCode),
		sfTaxFormW9BillingCountry = decodeOptionalStringType(json.sfTaxFormW9BillingCountry),
		sfTaxFormW9TAOBillingStreetC = decodeOptionalStringType(json.sfTaxFormW9TAOBillingStreetC),
		sfTaxFormW9TAOBillingCityC = decodeOptionalStringType(json.sfTaxFormW9TAOBillingCityC),
		sfTaxFormW9TAOBillingStateC = decodeOptionalStringType(json.sfTaxFormW9TAOBillingStateC),
		sfTaxFormW9TAOBillingPostalCodeC = decodeOptionalStringType(json.sfTaxFormW9TAOBillingPostalCodeC),
		sfTaxFormW9TAOBillingCountryC = decodeOptionalStringType(json.sfTaxFormW9TAOBillingCountryC),
		sfTaxFormW9FMTaxIdC = decodeOptionalStringType(json.sfTaxFormW9FMTaxIdC),
		sfTaxFormW9USTINTypeC = decodeOptionalMultipleCheckboxType(json.sfTaxFormW9USTINTypeC),
		sfTaxFormW9TAOUSTaxIDC = decodeOptionalStringType(json.sfTaxFormW9TAOUSTaxIDC),
		sfTaxFormW9TAOUSTINTypeC = decodeOptionalMultipleCheckboxType(json.sfTaxFormW9TAOUSTINTypeC),
		sfAccountSubscriptionInvestorWHRateExpirationDateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorWHRateExpirationDateC),
		sfAccountSubscriptionInvestorValidationResultC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorValidationResultC),
		sfAccountSubscriptionInvestorEffectiveDateOfTaxFormStatusC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorEffectiveDateOfTaxFormStatusC),
		sfAccountSubscriptionInvestorEffectiveDateOfFATCAStatusAndRateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorEffectiveDateOfFATCAStatusAndRateC),
		sfAccountSubscriptionInvestorSubjectToFATCAWithholdingC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorSubjectToFATCAWithholdingC),
		sfAccountSubscriptionInvestorStatusOfFATCAReviewC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorStatusOfFATCAReviewC),
		sfAccountSubscriptionInvestorFATCAMonitoredC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorFATCAMonitoredC),
		sfAccountSubscriptionInvestorLimitationOfBenefitsOtherC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorLimitationOfBenefitsOtherC),
		sfAccountSubscriptionInvestorLimitationOfBenefitsC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorLimitationOfBenefitsC),
		sfAccountSubscriptionInvestorTAOGlobalIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOGlobalIDC),
		sfAccountSubscriptionInvestorTAOTaxIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOTaxIDC),
		sfAccountSubscriptionInvestorTAOWHRateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOWHRateC),
		sfAccountSubscriptionInvestorTAOStatusOfFATCAReviewC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOStatusOfFATCAReviewC),
		sfAccountSubscriptionInvestorTAOSubjectToFATCAWithholdingC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOSubjectToFATCAWithholdingC),
		sfAccountSubscriptionInvestorTAOTaxApprovalStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOTaxApprovalStatusC),
		sfAccountSubscriptionInvestorTAOTaxFormStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOTaxFormStatusC),
		sfAccountSubscriptionInvestorTAOTreatyCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOTreatyCountryC),
		sfAccountSubscriptionInvestorTAOWHRateFIRPTAIncomeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOWHRateFIRPTAIncomeC),
		sfAccountSubscriptionInvestorTAOWHRateInterestIncomeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOWHRateInterestIncomeC),
		sfAccountSubscriptionInvestorTAOWHRatePrivateDividendC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOWHRatePrivateDividendC),
		sfAccountSubscriptionInvestorTAOWHRatePublicDividendC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOWHRatePublicDividendC),
		sfAccountSubscriptionInvestorTAOGIINStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOGIINStatusC),
		sfAccountSubscriptionInvestorTAODemographicApprovalStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAODemographicApprovalStatusC),
		sfAccountSubscriptionInvestorTAOGIINStatusDateC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOGIINStatusDateC),
		sfAccountSubscriptionInvestorTAOEffectiveDateFATCACompletedStatusC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOEffectiveDateFATCACompletedStatusC),
		sfAccountSubscriptionInvestorTAOEffectiveDateOfTaxFormStatusC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOEffectiveDateOfTaxFormStatusC),
		sfAccountSubscriptionInvestorTAOLimitationOfBenefitsOtherC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOLimitationOfBenefitsOtherC),
		sfAccountSubscriptionInvestorTAOFATCAMonitoredC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOFATCAMonitoredC),
		sfAccountSubscriptionInvestorTAOBeneficialCountryC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOBeneficialCountryC),
		sfAccountSubscriptionInvestorTAOEW8StatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOEW8StatusC),
		sfAccountSubscriptionInvestorTAOClientIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOClientIDC),
		sfAccountSubscriptionInvestorTAOFATCADocumentIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorTAOFATCADocumentIDC),
		sfAccountSubscriptionInvestorTAOValidationResultC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOValidationResultC),
		sfAccountSubscriptionInvestorCRSStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorCRSStatusC),
		sfAccountSubscriptionInvestorCRSDocumentIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorCRSDocumentIDC),
		sfAccountSubscriptionInvestorCRSValidationResultC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorCRSValidationResultC),
		sfAccountSubscriptionInvestorFATCADocumentIDC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorFATCADocumentIDC),
		sfAccountSubscriptionInvestorSExemptionCodeC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorSExemptionCodeC),
		sfAccountSubscriptionInvestorStateExemptCertificationProvidedC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorStateExemptCertificationProvidedC),
		sfAccountSubscriptionInvestorDateStateExemptCertificateProvidedC = decodeOptionalStringType(json.sfAccountSubscriptionInvestorDateStateExemptCertificateProvidedC),
		sfAccountSubscriptionInvestorAMLRefreshStatusC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorAMLRefreshStatusC),
		sfIFCNullHideIFCFromContactSelfServicingC = decodeOptionalMultipleCheckboxType(json.sfIFCNullHideIFCFromContactSelfServicingC),
		sfAccountSubscriptionInvestorTAOLimitationOfBenefitsC = decodeOptionalMultipleCheckboxType(json.sfAccountSubscriptionInvestorTAOLimitationOfBenefitsC),
		sfAgreementOnboardingInitialAdditional = decodeOptionalMultipleCheckboxType(json.sfAgreementOnboardingInitialAdditional),
	}
end

function FullTargetTable.encodeJsonFullTargetTableSchema(f: FullTargetTableSchema): {[string]: any}
	local result: {[string]: any} = {
		fieldKeysInOrder = f.fieldKeysInOrder,
		label = f.label,
	}
	if f.fieldsMap ~= nil then
		result.fieldsMap = FullTargetTable.encodeJsonFullTargetTableFieldsMap(f.fieldsMap)
	end
	return result
end

function FullTargetTable.decodeJsonFullTargetTableSchema(json: {[string]: any}): FullTargetTableSchema
	return {
		fieldsMap = if json.fieldsMap then FullTargetTable.decodeJsonFullTargetTableFieldsMap(json.fieldsMap) else nil,
		fieldKeysInOrder = json.fieldKeysInOrder or {},
		label = json.label or "",
	}
end

return FullTargetTable
