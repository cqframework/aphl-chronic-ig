library AlphoraCommon

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000' called FHIRHelpers
include FHIRCommon called FC

codesystem "ObservationCategoryCodes": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "ConditionClinicalStatusCodes": 'http://terminology.hl7.org/CodeSystem/condition-clinical'

code "laboratory": 'laboratory' from "ObservationCategoryCodes" display 'laboratory'
code "exam": 'exam' from "ObservationCategoryCodes" display 'exam'
code "survey": 'survey' from "ObservationCategoryCodes" display 'survey'
code "vital-signs": 'vital-signs' from "ObservationCategoryCodes" display 'vital-signs'
code "active": 'active' from "ConditionClinicalStatusCodes"

context Patient

define function Official(identifiers List<Identifier>):
  singleton from (identifiers I where I.use = 'official')

define function Official(names List<HumanName>):
  singleton from (names N where N.use = 'official')

define function Only(observations List<Observation>):
  singleton from observations

define function Earliest(observations List<Observation>):
  First(
    observations O
      sort by issued
  )

define function Latest(observations List<Observation>):
  Last(
    observations O
      sort by issued
  )

define function MostRecent(observations List<Observation>):
  Last(
    observations O
      sort by issued
  )

define function MostRecent(encounters List<Encounter>):
  Last(
    encounters O
      sort by start of period
  )

define function MostRecent(servicerequest List<ServiceRequest>):
  Last(
    servicerequest O
      sort by authoredOn
  )

define function MostRecent(procedures List<Procedure>):
  Last(
    procedures O
      sort by (performed as FHIR.dateTime)
  )

define function Lowest(observations List<Observation>):
  First(
    observations O
      sort by (value as FHIR.Quantity)
  )

define function Highest(observations List<Observation>):
  Last(
    observations O
      sort by (value as FHIR.Quantity)
  )

define function MaxDates(assessmentsDates List<Interval<DateTime>>)
returns Interval<DateTime>:
  First((
    (assessmentsDates) AssessmentDates
      return Tuple{ AssessmentDate: AssessmentDates}
    ) StartDate
      sort by start of AssessmentDate descending
  ).AssessmentDate

define function MaxDates(assessmentsDates List<Interval<Date>>)
returns Interval<Date>:
  First((
    (assessmentsDates) AssessmentDates
      return Tuple{ AssessmentDate: AssessmentDates}
    ) StartDate
      sort by start of AssessmentDate descending
  ).AssessmentDate

define function MinDates(assessmentsDates List<Interval<DateTime>>)
returns Interval<DateTime>:
  First((
    (assessmentsDates) AssessmentDates
      where not(start of AssessmentDates is null)
      return Tuple{ AssessmentDate: AssessmentDates}
    ) StartDate
      sort by start of AssessmentDate ascending
  ).AssessmentDate

define function GetId(uri String):
	Last(Split(uri, '/'))

/*define function GetId(uri List<String>):
  uri uri
	 return GetId(uri)
*/
define function GetIdList(list List<String>):
  list uri
	 return Last(Split(uri, '/'))

 /*
@description: verifies that quantity types have the given unit.
@comment: NOTE: This function evaluates correctly in the cql-language plugin as of 2.10.1 but not in the cql-tooling traslator as of 9/20/21
*/
/* define function WithUnit(value FHIR.Quantity, unit String):
   (
     value quantity
     where (
       quantity.code.value ~ unit
       or quantity.unit.value ~ unit
     )
   ) is not null
*/

/*
@description: Returns any Alphora extensions defined on the given resource with the specified id.
@comment: NOTE: Extensions are not the preferred approach, but are used as a way to access
content that is defined by extensions but not yet surfaced in the
CQL model info.
*/
define function Extensions(domainResource DomainResource, id String):
  domainResource.extension E
	  where E.url = ('http://content.alphora.com/fhir/dqm' + id)
		return E

/*
@description: Returns the single Alphora extension (if present) on the given resource with the specified id.
@comment: This function uses singleton from to ensure that a run-time exception is thrown if there
is more than one extension on the given resource with the specified id.
*/
define function Extension(domainResource DomainResource, id String):
  singleton from "Extensions"(domainResource, id)

/*
@description: Returns any Alphora extensions defined on the given element with the specified id.
@comment: NOTE: Extensions are not the preferred approach, but are used as a way to access
content that is defined by extensions but not yet surfaced in the CQL model info.
*/
define function Extensions(element Element, id String):
  element.extension E
	  where E.url = ('http://content.alphora.com/fhir/dqm' + id)
		return E

/*
@description: Returns the single Alphora extension (if present) on the given element with the specified id.
@comment: This function uses singleton from to ensure that a run-time exception is thrown if there
is more than one extension on the given resource with the specified url.
*/
define function Extension(element Element, id String):
  singleton from Extensions(element, id)

/*
@description: Returns any Alphora modifier extensions defined on the given resource with the specified id.
@comment: NOTE: Extensions are not the preferred approach, but are used as a way to access
content that is defined by extensions but not yet surfaced in the
CQL model info.
*/
define function ModifierExtensions(domainResource DomainResource, id String):
  domainResource.modifierExtension E
	  where E.url = ('http://content.alphora.com/fhir/dqm' + id)
		return E

/*
@description: Returns the single Alphora modifier extension (if present) on the given resource with the specified id.
@comment: This function uses singleton from to ensure that a run-time exception is thrown if there
is more than one extension on the given resource with the specified url.
*/
define function ModifierExtension(domainResource DomainResource, id String):
  singleton from ModifierExtensions(domainResource, id)

/*
@description: Returns any Alphora modifier extensions defined on the given element with the specified id.
@comment: NOTE: Extensions are not the preferred approach, but are used as a way to access
content that is defined by extensions but not yet surfaced in the CQL model info.
*/
define function ModifierExtensions(element BackboneElement, id String):
  element.modifierExtension E
	  where E.url = ('http://content.alphora.com/fhir/dqm' + id)
		return E

/*
@description: Returns the single Alphora modifier extension (if present) on the given element with the specified id.
@comment: This function uses singleton from to ensure that a run-time exception is thrown if there
is more than one extension on the given resource with the specified url.
*/
define function ModifierExtension(element BackboneElement, id String):
  singleton from ModifierExtensions(element, id)


/* QI-CORE Extensions */

/*
NOTE: Extensions are not the preferred approach, but are used as a way to access
content that is defined by extensions but not yet surfaced in the
CQL model info.
*/
define function QICoreModifierExtensions(domainResource DomainResource, url String):
  domainResource.modifierExtension E
    where E.url = ('http://hl7.org/fhir/us/qicore/StructureDefinition/' + url)
    return E

define function QICoreModifierExtension(domainResource DomainResource, url String):
  singleton from QICoreModifierExtensions(domainResource, url)

define function QICoreExtensions(domainResource DomainResource, url String):
  domainResource.extension E
    where E.url = ('http://hl7.org/fhir/us/qicore/StructureDefinition/' + url)
    return E

define function QICoreExtension(domainResource DomainResource, url String):
  singleton from QICoreExtensions(domainResource, url)

define function GetBaseModifierExtensions(domainResource DomainResource, url String):
  domainResource.modifierExtension E
	  where E.url = ('http://hl7.org/fhir/StructureDefinition/' + url)
		return E

define function GetBaseModifierExtension(domainResource DomainResource, url String):
  singleton from GetBaseModifierExtensions(domainResource, url)

define function GetBaseExtensions(domainResource DomainResource, url String):
  domainResource.extension E
	  where E.url = ('http://hl7.org/fhir/StructureDefinition/' + url)
		return E

define function GetBaseExtension(domainResource DomainResource, url String):
  singleton from GetBaseExtensions(domainResource, url)

define function GetUSModifierExtensions(domainResource DomainResource, url String):
  domainResource.modifierExtension E
	  where E.url = ('http://hl7.org/fhir/us/core/StructureDefinition/' + url)
		return E

define function GetUSModifierExtension(domainResource DomainResource, url String):
  singleton from GetUSModifierExtensions(domainResource, url)

define function GetUSExtensions(domainResource DomainResource, url String):
  domainResource.extension E
	  where E.url = ('http://hl7.org/fhir/us/core/StructureDefinition/' + url)
		return E

define function GetUSExtension(domainResource DomainResource, url String):
  singleton from GetUSExtensions(domainResource, url)

define function GetExtensionValue(extension Extension):
  extension.value.value

define function ResourceNotDone(notDone DomainResource):
  QICoreModifierExtension(notDone, 'qicore-notDone')

define function ResourceNotDoneReason(notDoneReason DomainResource):
  QICoreExtension(notDoneReason, 'qicore-notDoneReason')

define function ResourceNotDoneReason(choice Choice<FHIR.Communication, FHIR.Immunization, FHIR.MedicationAdministration, FHIR.MedicationDispense, FHIR.MedicationRequest, FHIR.Observation, FHIR.Procedure, FHIR.ServiceRequest>):
  case
    when choice is FHIR.Observation then
      ResourceNotDoneReason(choice as FHIR.Observation)
    when choice is FHIR.ServiceRequest then
      ResourceDoNotPerformReason(choice as FHIR.ServiceRequest)
    else null
  end

define function ResourceDoNotPerformReason(doNotPerformReason DomainResource):
  QICoreExtension(doNotPerformReason, 'qicore-doNotPerformReason')

define function ResourceNotDoneRecorded(recorded DomainResource):
  QICoreExtension(recorded, 'qicore-recorded')

define function ResourceNotDoneRecorded(choice Choice<FHIR.Communication, FHIR.Immunization, FHIR.MedicationAdministration, FHIR.MedicationDispense, FHIR.MedicationRequest, FHIR.Observation, FHIR.Procedure, FHIR.ServiceRequest>):
  case
    when choice is FHIR.Communication then
      QICoreExtension(choice as FHIR.Communication, 'qicore-recorded')
    when choice is FHIR.MedicationAdministration then
      QICoreExtension(choice as FHIR.MedicationAdministration, 'qicore-recorded')
    when choice is FHIR.MedicationDispense then
      QICoreExtension(choice as FHIR.MedicationDispense, 'qicore-recorded')
    when choice is FHIR.Procedure then
      QICoreExtension(choice as FHIR.Procedure, 'qicore-recorded')
    else null
  end

define function NotDoneValueSet(choice Choice<FHIR.Communication, FHIR.DeviceRequest, FHIR.Immunization, FHIR.MedicationAdministration, FHIR.MedicationDispense, FHIR.MedicationRequest,
   FHIR.Observation, FHIR.Procedure, FHIR.ServiceRequest>):
  case
    when choice is FHIR.Communication then
      GetExtensionValue(
        singleton from (choice.reasonCode.coding.extension E
          where E.url = ('http://hl7.org/fhir/StructureDefinition/valueset-reference')
      ))
    when choice is FHIR.DeviceRequest then
      GetExtensionValue(
        singleton from (choice.code.coding.extension E
          where E.url = ('http://hl7.org/fhir/StructureDefinition/valueset-reference')
      ))
    when choice is FHIR.Immunization then
      GetExtensionValue(
        singleton from (choice.vaccineCode.coding.extension E
          where E.url = ('http://hl7.org/fhir/StructureDefinition/valueset-reference')
      ))
    when choice is FHIR.MedicationAdministration then
      GetExtensionValue(
        singleton from (choice.medication.coding.extension E
          where E.url = ('http://hl7.org/fhir/StructureDefinition/valueset-reference')
      ))
    when choice is FHIR.MedicationDispense then
      GetExtensionValue(
        singleton from (choice.medication.coding.extension E
          where E.url = ('http://hl7.org/fhir/StructureDefinition/valueset-reference')
      ))
    when choice is FHIR.MedicationRequest then
      GetExtensionValue(
        singleton from (choice.medication.coding.extension E
          where E.url = ('http://hl7.org/fhir/StructureDefinition/valueset-reference')
      ))
    when choice is FHIR.Observation then
      GetExtensionValue(
        singleton from (choice.code.coding.extension E
          where E.url = ('http://hl7.org/fhir/StructureDefinition/valueset-reference')
      ))
    when choice is FHIR.Procedure then
      GetExtensionValue(
        singleton from (choice.code.coding.extension E
          where E.url = ('http://hl7.org/fhir/StructureDefinition/valueset-reference')
      ))
    when choice is FHIR.ServiceRequest then
      GetExtensionValue(
        singleton from (choice.code.coding.extension E
          where E.url = ('http://hl7.org/fhir/StructureDefinition/valueset-reference')
      ))
    else null
  end


/* Common Resource Qualifications and Negations */
define function QualifiedEncounters(value List<FHIR.Encounter>):
  value Encounter
    where (
      //planned | arrived | triaged | in-progress | onleave | finished | cancelled | entered-in-error | unknown
      Encounter.status ~ 'arrived'
      or Encounter.status ~ 'in-progress'
      or Encounter.status ~ 'finished'
      or Encounter.status ~ 'onleave'
      or Encounter.status ~ 'triaged'
    )

define function QualifiedConditions(value List<FHIR.Condition>):
  value Condition
    where (
      FHIRHelpers.ToConcept(Condition.clinicalStatus) ~ FC."active"
    )
    and (
      FHIRHelpers.ToConcept(Condition.verificationStatus) ~ FC."confirmed"
    )

define function QualifiedProcedures(value List<FHIR.Procedure>):
  value Procedure
    where (
      //preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown
      Procedure.status ~ 'completed'
    )

define function QualifiedDeviceRequests(value List<FHIR.DeviceRequest>):
  value DeviceRequest
    where (
      //draft | active | on-hold | revoked | completed | entered-in-error | unknown
      DeviceRequest.status ~ 'completed'
      or DeviceRequest.status ~ 'active'
      and DeviceRequest.intent ~ 'order'
    )

define function QualifiedObservations(value List<FHIR.Observation>):
  value Observation
		where (
      //registered | preliminary | final | amended | corrected | cancelled | entered-in-error | unknown
      Observation.status ~ 'final'
			or Observation.status ~ 'amended'
			or Observation.status ~ 'corrected'
		)

define function FinalSurveyObservations(value List<FHIR.Observation>):
  value Observation
  		where (
      //registered | preliminary | final | amended | corrected | cancelled | entered-in-error | unknown
      Observation.status ~ 'final'
			or Observation.status ~ 'amended'
			or Observation.status ~ 'corrected'
      and exists(Observation.category ObservationCategory
        where ( ObservationCategory ) ~ "survey")
		)

define function LaboratoryObservation(value List<FHIR.Observation>):
  value Observation
  		where (
      //registered | preliminary | final | amended | corrected | cancelled | entered-in-error | unknown
      Observation.status ~ 'final'
			or Observation.status ~ 'amended'
			or Observation.status ~ 'corrected'
      and exists(Observation.category ObservationCategory
        where ( ObservationCategory ) ~ "laboratory")
		)
    

define function QualifiedMedicationRequests(value List<FHIR.MedicationRequest>):
  value MedicationRequest
    where (
      //active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown
      (MedicationRequest.status ~ 'active'
        or MedicationRequest.status ~ 'completed'
      )
        and (
          MedicationRequest.doNotPerform is null
          or MedicationRequest.doNotPerform = false
        )
        and MedicationRequest.intent ~ 'order'
    )

define function QualifiedMedicationStatements(value List<FHIR.MedicationStatement>):
  value MedicationStatement
    where (
      // active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken
      MedicationStatement.status ~ 'active'
      or MedicationStatement.status ~ 'completed'
    )

define function QualifiedMedicationDispenses(value List<FHIR.MedicationDispense>):
  value MedicationDispense
    // preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | declined | unknown
    where (
      MedicationDispense.status ~ 'on-hold'
      or MedicationDispense.status ~ 'in-progress'
      or MedicationDispense.status ~ 'completed'
    )

define function QualifiedServiceRequests(value List<FHIR.ServiceRequest>):
  value ServiceRequest
    where (
      //draft | active | on-hold | revoked | completed | entered-in-error | unknown
      ServiceRequest.status ~ 'active'
      or ServiceRequest.status ~ 'completed'
      and ServiceRequest.intent ~ 'order'
    )
    and (
      ServiceRequest.doNotPerform is null
      or ServiceRequest.doNotPerform = false
    )

define function QualifiedAllergyIntolerances(value List<FHIR.AllergyIntolerance>):
  value AllergyIntolerance
    where (
      //active | inactive | resolved
      FHIRHelpers.ToConcept(AllergyIntolerance.clinicalStatus) ~ FC."allergy-active"
    )
    and (
      //unconfirmed | confirmed | refuted | entered-in-error
      FHIRHelpers.ToConcept(AllergyIntolerance.verificationStatus) ~ FC."allergy-confirmed"
    )

define function QualifiedImmunizations(value List<FHIR.Immunization>):
  value Immunization
    where (
      //completed | entered-in-error | not-done
      Immunization.status ~ 'completed'
    )

define function QualifiedCommunications(value List<FHIR.Communication>):
  value Communication
    where (
      //preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown
      Communication.status ~ 'completed'
    )

define function QualifiedMedications(value List<FHIR.Medication>):
  value Medication
    where (
      //active | inactive | entered-in-error
      Medication.status ~ 'active'
    )

define function QualifiedMedicationAdministrations(value List<FHIR.MedicationAdministration>):
  value MedicationAdministration
    where (
      //in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown
      MedicationAdministration.status ~ 'completed'
    )

define function QualifiedLocations(value List<FHIR.Location>):
  value Location
    where (
      //active | suspended | inactive
      Location.status ~ 'active'
    )

define function NotDoneObservations(value List<FHIR.Observation>):
  value Observation
    where (
      //registered | preliminary | final | amended | corrected | cancelled | entered-in-error | unknown
      Observation.status ~ 'final'
    )
    and (
      ResourceNotDone(Observation).value as FHIR.boolean = true
    )

define function NotRequestedServiceRequests(value List<FHIR.ServiceRequest>):
  value ServiceRequest
    where (
      //draft | active | on-hold | revoked | completed | entered-in-error | unknown
      ServiceRequest.status ~ 'completed'
    )
    and (
      ServiceRequest.doNotPerform = true
    )

define function NotRequestedMedicationRequests(value List<FHIR.MedicationRequest>):
  value MedicationRequest
    where (
      //active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown
      MedicationRequest.status ~ 'completed'
      and MedicationRequest.doNotPerform = true
    )

define function NotDoneProcedures(value List<FHIR.Procedure>):
  value Procedure
    where (
      //preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown
      Procedure.status ~ 'not-done'
    )

define function NotDoneMedicationAdministrations(value List<FHIR.MedicationAdministration>):
  value MedicationAdministration
    where (
      //in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown
      MedicationAdministration.status ~ 'not-done'
    )
