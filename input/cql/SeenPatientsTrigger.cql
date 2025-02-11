library SeenPatientsTrigger version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000'

parameter "Measurement Period" default Interval[@2025-01-01T00:00:00.0, @2026-01-01T00:00:00.0)

context Patient

define "encounter-end":
  exists([Encounter])
