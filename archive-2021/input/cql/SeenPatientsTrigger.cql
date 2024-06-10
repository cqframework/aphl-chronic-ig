library SeenPatientsTrigger version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.001'

parameter "Measurement Period" Interval<DateTime> default Interval[@2019-01-01T00:00:00.0-06:00, @2019-12-31T23:59:59.999-06:00]

context Patient

define "encounter-end":
  exists([Encounter])
