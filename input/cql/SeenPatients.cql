library SeenPatients version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000'
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include SurveillanceDataElementsFHIR4 version '1.0.000' called SurveillanceDataElements

parameter "Measurement Period" default Interval[@2024-01-01T00:00:00.0, @2025-01-01T00:00:00.0)

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
  exists (
    [Encounter] E
      where E.period ends during "Measurement Period"
  )
