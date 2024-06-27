library HospiceFHIR4 version '2.0.000' //Should this be updated

/*This example is a work in progress and should not be considered a final specification
or recommendation for guidance. This example will help guide and direct the process
of finding conventions and usage patterns that meet the needs of the various stakeholders
in the measure development community.*/

using FHIR version '4.0.1'

include MATGlobalCommonFunctionsFHIR4 version '6.0.000' called Global
include FHIRHelpers version '4.1.000' called FHIRHelpers
include AlphoraCommon called AC
include FHIRCommon version '1.1.000' called FC 

codesystem "SNOMEDCT": 'http://snomed.info/sct' //version 'http://snomed.info/sct/version/201709'
codesystem "LOINC": 'http://loinc.org'

valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307' 
valueset "Hospice Care Ambulatory": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1108.15' 
valueset "Hospice Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1003'
valueset "Hospice Diagnosis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1165'

code "Discharge to healthcare facility for hospice care (procedure)": '428371000124100' from "SNOMEDCT" display 'Discharge to healthcare facility for hospice care (procedure)'
code "Discharge to home for hospice care (procedure)": '428361000124107' from "SNOMEDCT" display 'Discharge to home for hospice care (procedure)'
code "Hospice care [Minimum Data Set]": '45755-6' from "LOINC" display 'Hospice care [Minimum Data Set]'
code "Yes (qualifier value)": '373066001' from "SNOMEDCT" display 'Yes (qualifier value)'

parameter "Measurement Period" default Interval[@2024-01-01T00:00:00.0, @2025-01-01T00:00:00.0)

context Patient

define "Has Hospice":
  exists(
    (AC.QualifiedEncounters([Encounter: "Encounter Inpatient"])) HospiceInp
      where (HospiceInp.hospitalization.dischargeDisposition ~ "Discharge to home for hospice care (procedure)"
        or HospiceInp.hospitalization.dischargeDisposition ~ "Discharge to healthcare facility for hospice care (procedure)")
      and FC.ToInterval(HospiceInp.period) ends during "Measurement Period"
  ) or exists(
    (AC.QualifiedEncounters([Encounter: "Hospice Encounter"])) HospiceEnc
      where FC.ToInterval(HospiceEnc.period) overlaps "Measurement Period"
  ) or exists(
    (AC.QualifiedObservations([Observation: "Hospice care [Minimum Data Set]"])) HospiceObs
      where HospiceObs.value ~ ToConcept("Yes (qualifier value)")
        and FC.ToInterval(HospiceObs.effective) overlaps "Measurement Period"
  ) or exists(
    (AC.QualifiedServiceRequests([ServiceRequest: "Hospice Care Ambulatory"])) HospiceSR
      where FC.ToInterval(HospiceSR.authoredOn) during "Measurement Period"
  ) or exists(
    (AC.QualifiedProcedures([Procedure: "Hospice Care Ambulatory"])) HospiceProc
      where FC.ToInterval(HospiceProc.performed) overlaps "Measurement Period"
  ) or exists(
    (AC.QualifiedConditions([Condition: "Hospice Diagnosis"])) HospiceCareDiagnosis
      where FC.ToPrevalenceInterval(HospiceCareDiagnosis) overlaps "Measurement Period"
  )
/*

  or exists ( ["Intervention, Order": "Hospice Care Ambulatory"] HospiceOrder
      where HospiceOrder.authorDatetime during day of "Measurement Period"
  )
  or exists ( ["Intervention, Performed": "Hospice Care Ambulatory"] HospicePerformed
      where Global."NormalizeInterval" ( HospicePerformed.relevantDatetime, HospicePerformed.relevantPeriod ) overlaps day of "Measurement Period"
  )
or exists ( ["Diagnosis": "Hospice Diagnosis"] HospiceCareDiagnosis
      where HospiceCareDiagnosis.prevalencePeriod overlaps day of "Measurement Period"
  )

*/
