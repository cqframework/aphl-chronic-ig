library PalliativeCareFHIR version '2.0.000'

using FHIR version '4.0.1'

include MATGlobalCommonFunctionsFHIR4 version '6.0.000' called Global
include FHIRHelpers version '4.1.000' called FHIRHelpers
include AlphoraCommon called AC
include FHIRCommon version '1.1.000' called FC 

codesystem "LOINC": 'http://loinc.org'

valueset "Palliative Care Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1090' 
valueset "Palliative Care Intervention": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1135' 
valueset "Palliative Care Diagnosis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1167'

code "Functional Assessment of Chronic Illness Therapy - Palliative Care Questionnaire (FACIT-Pal)": '71007-9' from "LOINC" display 'Functional Assessment of Chronic Illness Therapy - Palliative Care Questionnaire (FACIT-Pal)'

parameter "Measurement Period" default Interval[@2024-01-01T00:00:00.0, @2025-01-01T00:00:00.0)

context Patient

define "Palliative Care in the Measurement Period":
  exists(
    (AC.QualifiedObservations([Observation: "Functional Assessment of Chronic Illness Therapy - Palliative Care Questionnaire (FACIT-Pal)"])) PalliativeObservation
      where FC.ToInterval(PalliativeObservation.effective) overlaps "Measurement Period"
  ) or exists(
    (AC.QualifiedConditions([Condition: "Palliative Care Diagnosis"])) PalliativeDiagnosis
      where FC.ToPrevalenceInterval(PalliativeDiagnosis) overlaps "Measurement Period"
  ) or exists(
    (AC.QualifiedEncounters([Encounter: "Palliative Care Encounter"])) PalliativeEncounter
      where FC.ToInterval(PalliativeEncounter.period) overlaps "Measurement Period"
  ) or exists(
    (AC.QualifiedProcedures([Procedure: "Palliative Care Intervention"])) PalliativeProcedure
      where FC.ToInterval(PalliativeProcedure.performed) overlaps "Measurement Period"
  )

