library AdvancedIllnessandFrailtyExclusionECQMFHIR4 version '5.12.000'

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000' called FHIRHelpers
include MATGlobalCommonFunctionsFHIR4 version '6.0.000' called Global
include FHIRCommon called FC
include AlphoraCommon called AC

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMEDCT": 'http://snomed.info/sct' 

valueset "Acute Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1083' 
valueset "Advanced Illness": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1082' 
valueset "Care Services in Long-Term Residential Facility": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1014' 
valueset "Dementia Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1510' 
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1010' 
valueset "Frailty Device": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.118.12.1300' 
valueset "Frailty Diagnosis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1074' 
valueset "Frailty Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1088' 
valueset "Frailty Symptom": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1075' 
valueset "Nonacute Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1084' 
valueset "Nursing Facility Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1012' 
valueset "Observation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1086' 
valueset "Outpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1087' 

code "Housing Status": '71802-3' from "LOINC" display 'Housing status'
code "Lives In A Nursing Home (finding)": '160734000' from "SNOMEDCT" display 'Lives in a nursing home (finding)'
code "Medical Equipment Used": '98181-1' from "LOINC" display 'Medical equipment used'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Up To One Year Prior Including Measurement Period":
  Interval[start of "Measurement Period" - 1 year, end of "Measurement Period"]

define "Is Age 66 or Older with Advanced Illness and Frailty":
  AgeInYearsAt(date from end of "Measurement Period") >= 66
    and "Has Criteria Indicating Frailty"
    and (
      exists("Has Two Outpatient Encounters With Advanced Illness")
      or exists("Has Inpatient Encounter With Advanced Illness")
      or exists("Has Dementia In Year Before or During Measurement Period")
    )

define "Is Age 66 to 80 with Advanced Illness and Frailty or Is Age 81 or Older with Frailty":
  (
    AgeInYearsAt(date from end of "Measurement Period") in Interval[66, 80]
    and "Has Criteria Indicating Frailty"
    and (
      exists("Has Two Outpatient Encounters With Advanced Illness")
      or exists("Has Inpatient Encounter With Advanced Illness")
      or exists("Has Dementia In Year Before or During Measurement Period")
    )
  ) or (
      AgeInYearsAt(date from end of "Measurement Period") >= 81
        and "Has Criteria Indicating Frailty"
  )

define "Is Age 66 or Older Living Long Term in a Nursing Home":
  AgeInYearsAt(date from end of "Measurement Period") >= 66
    and "Lives In A Nursing Home"
    

define "Has Criteria Indicating Frailty":
  exists(
    (AC.QualifiedDeviceRequests([DeviceRequest: "Frailty Device"])) FrailtyDeviceOrder
      where FrailtyDeviceOrder.authoredOn during day of "Measurement Period"
    )
    or exists(
        (AC.QualifiedObservations([Observation: "Medical Equipment Used"])) EquipmentUsed
          where EquipmentUsed.value in "Frailty Device"
            and FC.ToInterval(EquipmentUsed.effective) ends during day of "Measurement Period"
    )
    or exists(
      (AC.QualifiedConditions([Condition: "Frailty Diagnosis"])) FrailtyDiagnosis
        where FC.ToPrevalenceInterval(FrailtyDiagnosis) overlaps "Measurement Period"
    )
    or exists(
      (AC.QualifiedEncounters([Encounter: "Frailty Encounter"])) FrailtyEnc
        where FC.ToInterval(FrailtyEnc.period) overlaps "Measurement Period"
    )
    or exists(
      (AC.QualifiedObservations([Observation: "Frailty Symptom"])) FrailtySymptom
        where FC.ToInterval(FrailtySymptom.effective) overlaps "Measurement Period"
    )

define "Has Inpatient Encounter With Advanced Illness":  
  (AC.QualifiedEncounters([Encounter: "Acute Inpatient"])) InpatientEnc
    with (AC.QualifiedConditions([Condition: "Advanced Illness"])) AdvanIll
      such that FC.ToPrevalenceInterval(AdvanIll) overlaps InpatientEnc.period
        and FC.ToInterval(InpatientEnc.period) overlaps "Up To One Year Prior Including Measurement Period"

define "Outpatient Encounters With Advanced Illness":
  ((AC.QualifiedEncounters([Encounter: "Outpatient"]))
    union (AC.QualifiedEncounters([Encounter: "Observation"]))
    union (AC.QualifiedEncounters([Encounter: "Emergency Department Visit"]))
    union (AC.QualifiedEncounters([Encounter: "Nonacute Inpatient"]))) OutpatientEnc
      with (AC.QualifiedConditions([Condition: "Advanced Illness"])) AdvanIll
        such that FC.ToPrevalenceInterval(AdvanIll) overlaps "Measurement Period"
      and FC.ToInterval(OutpatientEnc.period) overlaps "Up To One Year Prior Including Measurement Period" 

define "Has Two Outpatient Encounters With Advanced Illness":
  from
    "Outpatient Encounters With Advanced Illness" OutpatientEncounter1,
    "Outpatient Encounters With Advanced Illness" OutpatientEncounter2
  where OutpatientEncounter2.period ends 1 day or more after day of end of OutpatientEncounter1.period
  return OutpatientEncounter1    

define "Has Dementia In Year Before or During Measurement Period":
  (AC.QualifiedMedicationRequests([MedicationRequest: "Dementia Medications"])) DementiaMed
    where exists(
      DementiaMed.dosageInstruction dosage
      where exists(
        FC.ToTimingInterval(dosage.timing)) timing
        where timing overlaps "Up To One Year Prior Including Measurement Period")

define "Lives In A Nursing Home":
  Last(
    (AC.QualifiedObservations([Observation: "Housing Status"])) HousingStatus
      where FC.ToInterval(HousingStatus.effective) ends on or before end of "Measurement Period"
        and HousingStatus.value ~ ToConcept("Lives In A Nursing Home (finding)")
    sort by issued ascending
  ) is not null


