library AdultOutpatientEncountersFHIR4 version '2.0.000' //should this be updated??

/*This example is a work in progress and should not be considered a final specification
or recommendation for guidance. This example will help guide and direct the process
of finding conventions and usage patterns that meet the needs of the various stakeholders
in the measure development community.

@update: @@BTR 2020-03-31 ->
Incremented version to 2.0.000
Updated FHIR version to 4.0.1
@@@*/

using FHIR version '4.0.1'

include FHIRHelpers version '4.1.000' called FHIRHelpers
include FHIRCommon version '1.1.000' called FC 

codesystem "HCPCS": 'http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets'
codesystem "CPT": 'http://www.ama-assn.org/go/cpt'

valueset "Annual Wellness Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1240'
valueset "Home Healthcare Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1016'
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "Preventive Care Services - Established Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1025'
valueset "Preventive Care Services - Initial Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1023'
valueset "Nutrition Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1006'
valueset "Telephone Visits": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1080'
valueset "Online Assessments": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1089'

parameter "Measurement Period" Interval<DateTime>

context Patient


define "Qualifying Encounters":
  (
	[Encounter: "Office Visit"]
      union [Encounter: "Annual Wellness Visit"]
      union [Encounter: "Preventive Care Services - Established Office Visit, 18 and Up"]
      union [Encounter: "Preventive Care Services - Initial Office Visit, 18 and Up"]
      union [Encounter: "Home Healthcare Services"]
      union [Encounter: "Online Assessments"]
      union [Encounter: "Telephone Visits"]
  ) ValidEncounters
    where FC.ToInterval(ValidEncounters.actualPeriod) during "Measurement Period"
	  and ValidEncounters.status ~ 'finished' or ValidEncounters.status ~ 'in-progress'