/*
FHIR Translation of CMS122: Diabetes: HemoglobinA1c Poor Control
*/
library DiabetesHemoglobinA1cHbA1cPoorControl9FHIR version '0.0.001'

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
codesystem "HCPCS": 'http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets'
codesystem "CPT": 'http://www.ama-assn.org/go/cpt'
codesystem "ObservationCategoryCodes": 'http://terminology.hl7.org/CodeSystem/observation-category'

valueset "Diabetes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.103.12.1001'
valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "HbA1c Laboratory Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1013'
valueset "Annual Wellness Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1240'
valueset "Home Healthcare Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1016'
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "Preventive Care Services - Established Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1025'
valueset "Preventive Care Services - Initial Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1023'
valueset "Nutrition Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1006'
valueset "Telephone Visits": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1080'

code "Medical nutrition therapy, reassessment and subsequent intervention(s) following second referral in same year for change in diagnosis, medical condition, or treatment regimen (including additional hours needed for renal disease), group (2 or more individuals), each 30 minutes": 'G0271' from "HCPCS" display 'Medical nutrition therapy, reassessment and subsequent intervention(s) following second referral in same year for change in diagnosis, medical condition, or treatment regimen (including additional hours needed for renal disease), group (2 or more individuals), each 30 minutes'
code "Medical nutrition therapy; group (2 or more individual(s)), each 30 minutes": '97804' from "CPT" display 'Medical nutrition therapy; group (2 or more individual(s)), each 30 minutes'
code "Medical nutrition therapy; initial assessment and intervention, individual, face-to-face with the patient, each 15 minutes": '97802' from "CPT" display 'Medical nutrition therapy; initial assessment and intervention, individual, face-to-face with the patient, each 15 minutes'
code "Medical nutrition therapy; re-assessment and intervention, individual, face-to-face with the patient, each 15 minutes": '97803' from "CPT" display 'Medical nutrition therapy; re-assessment and intervention, individual, face-to-face with the patient, each 15 minutes'
code "Medical nutrition therapy; reassessment and subsequent intervention(s) following second referral in same year for change in diagnosis, medical condition or treatment regimen (including additional hours needed for renal disease), individual, face to face with the patient, each 15 minutes": 'G0270' from "HCPCS" display 'Medical nutrition therapy; reassessment and subsequent intervention(s) following second referral in same year for change in diagnosis, medical condition or treatment regimen (including additional hours needed for renal disease), individual, face to face with the patient, each 15 minutes'
code "laboratory": 'laboratory' from "ObservationCategoryCodes" display 'laboratory'
code "Birth date": '21112-8' from "LOINC" display 'Birth date'

parameter "Measurement Period" Interval<DateTime>
  default Interval[@2024-01-01T00:00:00.0, @2025-01-01T00:00:00.0)

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
  AgeInYearsAt(end of "Measurement Period") in Interval[18, 75]
    and exists("Qualifying Encounters")
    and exists( (AC.QualifiedConditions([Condition: "Diabetes"])) Diabetes
      where FC.ToPrevalenceInterval(Diabetes) overlaps "Measurement Period" )

define "Qualifying Encounters":
  (
    [Encounter: "Office Visit"]
	    union [Encounter: "Annual Wellness Visit"]
	    union [Encounter: "Preventive Care Services - Established Office Visit, 18 and Up"]
      union [Encounter: "Preventive Care Services - Initial Office Visit, 18 and Up"]
      union [Encounter: "Home Healthcare Services"]
      union [Encounter: "Nutrition Services"]
      union [Encounter: "Medical nutrition therapy; initial assessment and intervention, individual, face-to-face with the patient, each 15 minutes"]
      union [Encounter: "Medical nutrition therapy; re-assessment and intervention, individual, face-to-face with the patient, each 15 minutes"]
      union [Encounter: "Medical nutrition therapy; group (2 or more individual(s)), each 30 minutes"]
      union [Encounter: "Medical nutrition therapy; reassessment and subsequent intervention(s) following second referral in same year for change in diagnosis, medical condition or treatment regimen (including additional hours needed for renal disease), individual, face to face with the patient, each 15 minutes"]
      union [Encounter: "Medical nutrition therapy, reassessment and subsequent intervention(s) following second referral in same year for change in diagnosis, medical condition, or treatment regimen (including additional hours needed for renal disease), group (2 or more individuals), each 30 minutes"]
      union [Encounter: "Telephone Visits"]
  ) ValidEncounters
    where ValidEncounters.period during "Measurement Period"
	  and ValidEncounters.status ~ 'finished'

define "Denominator":
  "Initial Population"

define "Denominator Exclusions":
  Hospice."Has Hospice"
    or Frailty."Is Age 66 or Older Living Long Term in a Nursing Home"
    or Frailty."Is Age 66 or Older with Advanced Illness and Frailty"
    or PalliativeCare."Palliative Care in the Measurement Period"

define "Numerator":
  "Has Most Recent HbA1c Without Result"
    or "Has Most Recent Elevated HbA1c"
    or "Has No Record Of HbA1c"

define "Has HbA1c Lab Test":
  (AC.LaboratoryObservation([Observation: "HbA1c Laboratory Test"])) HbA1cTest
    where FC.ToInterval(HbA1cTest.effective) during "Measurement Period"

define "Most Recent HbA1c Lab Test":
  AC.MostRecent("Has HbA1c Lab Test") // need help making this an FC.ToInterval 

define "Has Most Recent Elevated HbA1c":
  "Most Recent HbA1c Lab Test".value >= 9 '%'

define "Has Most Recent HbA1c Without Result":
  ("Most Recent HbA1c Lab Test" is not null)
    and ("Most Recent HbA1c Lab Test".value is null)

define "Has No Record Of HbA1c":
  not exists("Has HbA1c Lab Test")
