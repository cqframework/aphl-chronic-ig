library DepressionScreeningandFollowUpTrigger

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000'

codesystem "LOINC": 'http://loinc.org'

code "Adolescent Depression Screening Assessment": '73831-0' from "LOINC" display 'Adolescent Depression Screening Assessment'
code "Adult Depression Screening Assessment": '73832-8' from "LOINC" display 'Adult Depression Screening Assessment'

parameter "Measurement Period" Interval<DateTime> default Interval[@2024-01-01T00:00:00.0-06:00, @2024-12-31T23:59:59.999-06:00]

context Patient

define "encounter-end":
  exists([Encounter])

//TODO: Need to get more info from APHL to verify this
define "ckr-is-encounter-reportable":
  exists([Observation: "Adolescent Depression Screening Assessment"])
    or exists([Observation: "Adult Depression Screening Assessment"])