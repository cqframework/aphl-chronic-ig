library DepressionScreeningandFollowUp 

// CMS2v13: Preventive Care and Screening: Screening for Depression and Follow-Up Plan

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.0.000' called Global
include AdultOutpatientEncountersFHIR4 version '2.0.000' called AdultOutpatientEncounters
include HospiceFHIR4 version '2.0.000' called Hospice
include AdvancedIllnessandFrailtyExclusionECQMFHIR4 version '5.12.000' called Frailty
include SurveillanceDataElementsFHIR4 version '1.0.000' called SurveillanceDataElements
include AlphoraCommon called AC
include PalliativeCareFHIR called PalliativeCare
include FHIRCommon version '1.1.000' called FC 

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMEDCT": 'http://snomed.info/sct' 

valueset "Encounter to Screen for Depression": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.600.1916'
valueset "Physical Therapy Evaluation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1022'
valueset "Telephone Visits": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1080'
valueset "Bipolar Disorder": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.67.1.101.1.128'
valueset "Medical Reason": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1007'

//adolescent
valueset "Adolescent Depression Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1567'
valueset "Referral for Adolescent Depression": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1570'
valueset "Follow Up for Adolescent Depression": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1569'

//adult
valueset "Adult Depression Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1566'
valueset "Referral for Adult Depression": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1571'
valueset "Follow Up for Adult Depression": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1568'

code "Depression Screening Declined": '720834000' from "SNOMEDCT" display 'Depression Screening Declined (situation)'
code "Adolescent Depression Screening Assessment": '73831-0' from "LOINC" display 'Adolescent Depression Screening Assessment'
code "Adult Depression Screening Assessment": '73832-8' from "LOINC" display 'Adult Depression Screening Assessment'
code "Depression Screening Negative": '428171000124102' from "SNOMEDCT" display 'Depression Screening Negative (finding)'
code "Depression Screening Positive": '428181000124104' from "SNOMEDCT" display 'Depression Screening Positive (finding)'

parameter "Measurement Period" default Interval[@2024-01-01T00:00:00.000, @2025-01-01T00:00:00.000)

context Patient

define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
  SDE."SDE Payer"

define "SDE Race":
  SDE."SDE Race"

define "SDE Sex":
  SDE."SDE Sex"

define "SDE Age":
  SurveillanceDataElements."Age"

define "SDE Age Group":
  SurveillanceDataElements."Age Group"

define "SDE State of Residence":
  SurveillanceDataElements."State of Residence"

define "SDE Postal Code of Residence":
  SurveillanceDataElements."Postal Code of Residence"

define "SDE Food Insecurity Risk Status":
  SurveillanceDataElements."Food Insecurity Risk Status"



define "Initial Population":
  AgeInYearsAt(start of "Measurement Period") >= 12
    and exists(
      "Qualifying Encounters During Measurement Period" E 
        where FC.ToInterval(E.period) during "Measurement Period"
    )

define "Denominator":
  "Initial Population"

define "Denominator Exclusion":
  exists("History of Bipolar Diagnosis Before Qualifying Encounter")

define "Denominator Exception":
  (exists("Medical or Patient Reason for Not Screening Adolescent for Depression")
    and not exists("Has Adolescent Depression Screening"))
  or (exists("Medical or Patient Reason for Not Screening Adult for Depression")
    and not exists("Has Adult Depression Screening"))

define "Numerator":
  ( "Patient Age 12 to 16 Years at Start of Measurement Period"
      and ( "Most Recent Adolescent Screening Negative"
        or "Most Recent Adolescent Depression Screening Positive and Follow Up Provided" )
)
  or ( "Patient Age 17 Years at Start of Measurement Period"
    and ( "Most Recent Adolescent Screening Negative"
      or "Most Recent Adolescent Depression Screening Positive and Follow Up Provided"
      or "Most Recent Adult Screening Negative"
      or  "Most Recent Adult Depression Screening Positive and Follow Up Provided") 
  )
  or ( "Patient Age 18 Years or Older at Start of Measurement Period"
    and ( "Most Recent Adult Screening Negative"
      or "Most Recent Adult Depression Screening Positive and Follow Up Provided" ) )


define "Qualifying Encounters During Measurement Period":
  (AC.QualifiedEncounters([Encounter: "Encounter to Screen for Depression"])
    union AC.QualifiedEncounters([Encounter: "Physical Therapy Evaluation"])
    union AC.QualifiedEncounters([Encounter: "Telephone Visits"])) QualifyingEnc 
    where FC.ToInterval(QualifyingEnc.period) during "Measurement Period"


define function "Screening Within 14 Days of Encounter"(observation FHIR.Observation, encounter FHIR.Encounter)
returns System.Boolean:
  Coalesce(end of FC.ToInterval(observation.effective), observation.issued) 14 days or less before day of start of encounter.period
    and observation.value is not null

//Denominator Exclusion 
define "History of Bipolar Diagnosis Before Qualifying Encounter": 
  (AC.QualifiedConditions([Condition: "Bipolar Disorder"])) BipolarDiagnosis 
  with "Qualifying Encounters During Measurement Period" QualifyingEnc
    such that FC.ToPrevalenceInterval(BipolarDiagnosis) starts before QualifyingEnc.period


//Denominator Exception
define "Medical or Patient Reason for Not Screening Adolescent for Depression":
  (AC.NotDoneObservations([Observation: "Adolescent Depression Screening Assessment"])) NoReason
    with "Qualifying Encounters During Measurement Period" QualifyingEnc
      such that Coalesce(end of FC.ToInterval(NoReason.effective), end of FC.ToInterval(NoReason.issued)) same day as end of QualifyingEnc.period
    where AC.ResourceNotDoneReason(NoReason).value as CodeableConcept in "Medical Reason"
      or AC.ResourceNotDoneReason(NoReason).value as CodeableConcept ~ "Depression Screening Declined"


define "Has Adolescent Depression Screening":
  ((AC.QualifiedObservations([Observation: "Adolescent Depression Screening Assessment"])) AdolescentScreening
    with "Qualifying Encounters During Measurement Period" QualifyingEnc
      such that "Screening Within 14 Days of Encounter"(AdolescentScreening, QualifyingEnc))


define "Medical or Patient Reason for Not Screening Adult for Depression":
  (AC.NotDoneObservations([Observation: "Adult Depression Screening Assessment"])) NoReason
    with "Qualifying Encounters During Measurement Period" QualifyingEnc
      such that Coalesce(end of FC.ToInterval(NoReason.effective), end of FC.ToInterval(NoReason.issued)) same day as end of QualifyingEnc.period
    where AC.ResourceNotDoneReason(NoReason).value as CodeableConcept in "Medical Reason"
      or AC.ResourceNotDoneReason(NoReason).value as CodeableConcept ~ "Depression Screening Declined"

define "Has Adult Depression Screening":
  ((AC.QualifiedObservations([Observation: "Adult Depression Screening Assessment"])) AdolescentScreening
    with "Qualifying Encounters During Measurement Period" QualifyingEnc
      such that "Screening Within 14 Days of Encounter"(AdolescentScreening, QualifyingEnc))


//Numerator
define "Patient Age 12 to 16 Years at Start of Measurement Period":
  AgeInYearsAt(start of "Measurement Period") in Interval[12, 16]

define "Patient Age 17 Years at Start of Measurement Period":
  AgeInYearsAt(start of "Measurement Period") = 17

define "Patient Age 18 Years or Older at Start of Measurement Period":
  AgeInYearsAt(start of "Measurement Period") >= 18


//Adolescent Numerator
define "Most Recent Adolescent Depression Screening":
  AC.MostRecent(("Has Adolescent Depression Screening"))

define "Most Recent Adolescent Screening Negative":
  ("Most Recent Adolescent Depression Screening" AdolescentScreening
    where AdolescentScreening.value ~ ToConcept("Depression Screening Negative")) is not null

define "Most Recent Adolescent Positive Depression Screening":
  "Most Recent Adolescent Depression Screening" RecentScreening
    where RecentScreening.value ~ ToConcept("Depression Screening Positive")

define "Follow Up Interventions For Positive Adolescent Depression Screening":
  (AC.QualifiedMedicationRequests([MedicationRequest: "Adolescent Depression Medications"])
    union AC.QualifiedServiceRequests([ServiceRequest: "Referral for Adolescent Depression"])
    union AC.QualifiedProcedures([Procedure: "Follow Up for Adolescent Depression"])) FollowUpInterventions
    let "Intervention Day": Coalesce(FC.ToInterval(FollowUpInterventions.authoredOn), FC.ToInterval(FollowUpInterventions.performed))
    with "Qualifying Encounters During Measurement Period" QualifyingEnc
      such that "Intervention Day" same day as QualifyingEnc.period
      or "Intervention Day" 2 days or less after day of end of FC.ToInterval(QualifyingEnc.period) 
 
define "Most Recent Adolescent Depression Screening Positive and Follow Up Provided":
  ("Most Recent Adolescent Positive Depression Screening" RecentScreening
  let "Screening Day": Coalesce(FC.ToInterval(RecentScreening.effective), FC.ToInterval(RecentScreening.issued))
  with "Follow Up Interventions For Positive Adolescent Depression Screening" FollowUpInterventions
    such that "Screening Day" 14 days or less before start of Coalesce(FC.ToInterval(FollowUpInterventions.authoredOn), FC.ToInterval(FollowUpInterventions.performed))
  ) is not null 

//Adult Numerator
define "Most Recent Adult Depression Screening":
  AC.MostRecent(("Has Adult Depression Screening"))

define "Most Recent Adult Screening Negative":
  ("Most Recent Adult Depression Screening" AdultScreening
    where AdultScreening.value ~ ToConcept("Depression Screening Negative")) is not null

define "Most Recent Adult Positive Depression Screening":
  "Most Recent Adult Depression Screening" RecentScreening
    where RecentScreening.value ~ ToConcept("Depression Screening Positive")

define "Follow Up Interventions For Positive Adult Depression Screening":
  ((AC.QualifiedMedicationRequests([MedicationRequest: "Adult Depression Medications"])
    union AC.QualifiedServiceRequests([ServiceRequest: "Referral for Adult Depression"])
    union AC.QualifiedProcedures([Procedure: "Follow Up for Adult Depression"]))) FollowUpInterventions
    let "Intervention Day": Coalesce(FC.ToInterval(FollowUpInterventions.authoredOn), FC.ToInterval(FollowUpInterventions.performed))
    with "Qualifying Encounters During Measurement Period" QualifyingEnc
      such that "Intervention Day" same day as QualifyingEnc.period
      or "Intervention Day" 2 days or less after day of end of FC.ToInterval(QualifyingEnc.period) 

define "Most Recent Adult Depression Screening Positive and Follow Up Provided":
  ("Most Recent Adult Positive Depression Screening" RecentScreening
  let "Screening Day": Coalesce(FC.ToInterval(RecentScreening.effective), FC.ToInterval(RecentScreening.issued))
  with "Follow Up Interventions For Positive Adult Depression Screening" FollowUpInterventions
    such that "Screening Day" 14 days or less before start of Coalesce(FC.ToInterval(FollowUpInterventions.authoredOn), FC.ToInterval(FollowUpInterventions.performed))
  ) is not null 

