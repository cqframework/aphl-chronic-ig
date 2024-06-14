library ControllingHighBloodPressureFHIRTrigger version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000'

valueset "EssentialHypertension": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.104.12.1011'

parameter "Measurement Period" Interval<DateTime> default Interval[@2024-01-01T00:00:00.0-06:00, @2024-12-31T23:59:59.999-06:00]

context Patient

define "encounter-end":
  exists([Encounter])

define "ckr-is-encounter-reportable":
  exists([Condition: "EssentialHypertension"])
