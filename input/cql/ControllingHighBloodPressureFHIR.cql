/*
FHIR Translation of CMS165v9: Controlling High Blood Pressure (CBP)
*/
library ControllingHighBloodPressureFHIR version '9.0.000'

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000' called FHIRHelpers
include FHIRCommon called FC
include MATGlobalCommonFunctionsFHIR4 version '6.0.000' called Common
include AdultOutpatientEncountersFHIR4 version '2.0.000' called AdultOutpatientEncounters
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include AdvancedIllnessandFrailtyExclusionECQMFHIR4 version '5.12.000' called FrailtyLTI
include HospiceFHIR4 version '2.0.000' called Hospice
include SurveillanceDataElementsFHIR4 version '1.0.000' called SurveillanceDataElements
include PalliativeCareFHIR called PalliativeCare

codesystem "LOINC": 'http://loinc.org'

valueset "Chronic Kidney Disease, Stage 5": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1002'
valueset "Dialysis Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.109.12.1013'
valueset "ED": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1085'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "End Stage Renal Disease": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.353'
valueset "ESRD Monthly Outpatient Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.109.12.1014'
valueset "Essential Hypertension": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.104.12.1011'
valueset "Ethnicity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.837'
valueset "Kidney Transplant": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.109.12.1012'
valueset "Kidney Transplant Recipient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.109.12.1029'
valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'
valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591'
valueset "Pregnancy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.378'
valueset "Race": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.836'
valueset "Vascular Access for Dialysis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.109.12.1011'
valueset "Emergency Department Evaluation and Management Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1010'

code "Birth date": '21112-8' from "LOINC" display 'Birth date'
code "Blood pressure": '85354-9' from "LOINC" display 'blood pressure'
code "Diastolic blood pressure": '8462-4' from "LOINC" display 'Diastolic blood pressure'
code "Systolic blood pressure": '8480-6' from "LOINC" display 'Systolic blood pressure'

parameter "Measurement Period" Interval<DateTime> default Interval[@2025-01-01T00:00:00.0-06:00, @2025-12-31T23:59:59.999-06:00]

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

define "Has Diastolic Blood Pressure Less Than 90":
    "Lowest Diastolic Reading on Most Recent Blood Pressure Day" < 90 'mm[Hg]'

define "Has Systolic Blood Pressure Less Than 140":
	"Lowest Systolic Reading on Most Recent Blood Pressure Day" < 140 'mm[Hg]'

define "Lowest Diastolic Reading on Most Recent Blood Pressure Day":
	First(
        "Qualifying Diastolic Blood Pressure Reading" DBPReading
		    where Common.Earliest(DBPReading.effective) same day as "Most Recent Blood Pressure Day"
        return singleton from (
            DBPReading.component C
                where C.code ~ "Diastolic blood pressure"
                return C.value as FHIR.Quantity
        ) sort ascending
	)

define "Lowest Systolic Reading on Most Recent Blood Pressure Day":
	First(
        "Qualifying Systolic Blood Pressure Reading" SBPReading
		    where Common.Latest(SBPReading.effective) same day as "Most Recent Blood Pressure Day"
        return singleton from (
            SBPReading.component C
                where C.code ~ "Systolic blood pressure"
                return C.value as FHIR.Quantity
        ) sort ascending
    )

define "Blood Pressure Days":
	("Qualifying Diastolic Blood Pressure Reading" DBPExam 
        return Common.Latest(DBPExam.effective)
    ) 
        intersect ("Qualifying Systolic Blood Pressure Reading" SBPExam 
            return Common.Latest(SBPExam.effective)
        )

define "Most Recent Blood Pressure Day":
	Max("Blood Pressure Days")

define "Qualifying Diastolic Blood Pressure Reading":
	[Observation: "Blood pressure"] BloodPressure
    without ([Encounter: "Encounter Inpatient"]
      union [Encounter: "Emergency Department Evaluation and Management Visit"]) DisqualifyingEncounter
      such that Common.Latest(BloodPressure.effective) during day of DisqualifyingEncounter.period
    where BloodPressure.status in {'final', 'amended'}
      and Common.Latest(BloodPressure.effective) during "Measurement Period"
      and exists (
        BloodPressure.component DiastolicBP
          where DiastolicBP.code ~ "Diastolic blood pressure"
            and (DiastolicBP.value as Quantity).code.value = 'mm[Hg]'
      )

define "Qualifying Systolic Blood Pressure Reading":
	[Observation: "Blood pressure"] BloodPressure
    without ([Encounter: "Encounter Inpatient"]
      union [Encounter: "Emergency Department Evaluation and Management Visit"]) DisqualifyingEncounter
      such that Common.Latest(BloodPressure.effective) during day of DisqualifyingEncounter.period
    where BloodPressure.status in {'final', 'amended'}
      and Common.Latest(BloodPressure.effective) during "Measurement Period"
      and exists (
        BloodPressure.component SystolicBP
          where SystolicBP.code ~ "Systolic blood pressure"
            and (SystolicBP.value as Quantity).code.value = 'mm[Hg]'
      )

define "Numerator":
	"Has Diastolic Blood Pressure Less Than 90"
	    and "Has Systolic Blood Pressure Less Than 140"

define "Initial Population":
  AgeInYearsAt(date from end of "Measurement Period") in Interval[18, 85]
		and exists "Essential Hypertension Diagnosis"
		and exists AdultOutpatientEncounters."Qualifying Encounters"

define "Pregnancy Or Renal Diagnosis":
	( [Condition: "Pregnancy"]
		union [Condition: "End Stage Renal Disease"]
		union [Condition: "Kidney Transplant Recipient"]
		union [Condition: "Chronic Kidney Disease, Stage 5"] ) PregnancyESRDDiagnosis
      where PregnancyESRDDiagnosis.verificationStatus ~ Common."confirmed"
        and PregnancyESRDDiagnosis.recordedDate during "Measurement Period"

define "Denominator":
	"Initial Population"

define "End Stage Renal Disease Encounter":
	[Encounter: "ESRD Monthly Outpatient Services"] ESRDEncounter
		where ESRDEncounter.status in { 'arrived', 'triaged', 'in-progress', 'onleave', 'finished' }
		  and ESRDEncounter.period starts on or before end of "Measurement Period"

define "End Stage Renal Disease Procedures":
	([Procedure: "Kidney Transplant"]
		union [Procedure: "Dialysis Services"]) ESRDProcedure
		    where ESRDProcedure.status = 'completed'
                and end of Common."Normalize Interval"(ESRDProcedure.performed) on or before end of "Measurement Period"

define "Essential Hypertension Diagnosis":
	[Condition: "Essential Hypertension"] Hypertension
    where Hypertension.verificationStatus ~ Common."confirmed"
      and Common."Prevalence Period"(Hypertension) overlaps Interval[start of "Measurement Period", start of "Measurement Period" + 6 months]

define "Denominator Exclusion":
  Hospice."Has Hospice"
    or exists ("Pregnancy Or Renal Diagnosis")
    or exists ("End Stage Renal Disease Procedures")
    or exists ("End Stage Renal Disease Encounter")
    or FrailtyLTI."Is Age 66 to 80 with Advanced Illness and Frailty or Is Age 81 or Older with Frailty"
    or FrailtyLTI."Is Age 66 or Older Living Long Term in a Nursing Home"
    or PalliativeCare."Palliative Care in the Measurement Period"