Alias: $identifier-type = http://hl7.org/fhir/us/cqfmeasures/CodeSystem/identifier-type
Alias: $usage-context-type = http://terminology.hl7.org/CodeSystem/usage-context-type
Alias: $loinc = http://loinc.org
Alias: $measure-scoring = http://terminology.hl7.org/CodeSystem/measure-scoring
Alias: $measure-type = http://terminology.hl7.org/CodeSystem/measure-type
Alias: $measure-improvement-notation = http://terminology.hl7.org/CodeSystem/measure-improvement-notation
Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population
Alias: $measure-data-usage = http://terminology.hl7.org/CodeSystem/measure-data-usage
Alias: $sct = http://snomed.info/sct
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-ver-status = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $library-type = http://terminology.hl7.org/CodeSystem/library-type
Alias: $measure-supplemental-data = http://terminology.hl7.org/CodeSystem/measure-supplemental-data
Alias: $caregap-data = http://content.alphora.com/fhir/dqm/CodeSystem/caregap-data
Alias: $stratifier-type = http://hl7.org/fhir/measure-stratifier-example
Alias: $cms-id = http://hl7.org/fhir/cqi/ecqm/Measure/Identifier/cms
Alias: $measure-guid = http://hl7.org/fhir/cqi/ecqm/Measure/Identifier/guid
 
RuleSet: MeasureExtensions(id, url, reference)
* extension[+]
  * id = {id}
  * url = {url}
  * valueReference.reference = {reference}

RuleSet: MeasureCommonExtensions
* meta.profile = "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/computable-measure-cqfm"
* insert MeasureExtensions("cqf-tooling", "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-softwaresystem", "Device/cqf-tooling")
* insert MeasureExtensions("effective-data-requirements", "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-effectiveDataRequirements", "effective-data-requirements")

RuleSet: MeasureCommonURLs(measureID)
* url = "http://hl7.org/fhir/us/chronic-ds/Measure/{measureID}"
* library = "http://hl7.org/fhir/us/chronic-ds/Library/{measureID}"

RuleSet: MeasureIdentifier(use, code, value)
* identifier[+]
  * use = {use}
  * value = {value}

RuleSet: MeasureIdentifierCMSDisplay(value)
* insert MeasureIdentifier(#usual, $identifier-type#short-name "Short Name", {value})

RuleSet: MeasureIdentifierCMSID(value)
* insert MeasureIdentifier(#official, $identifier-type#publisher "Publisher", {value})

RuleSet: MeasureIdentifierGUID(value)
* insert MeasureIdentifier(#official, $measure-guid, {value})

RuleSet: MeasureIdentifierID(value)
* insert MeasureIdentifier(#official, $cms-id, {value})

RuleSet: MeasureUseContext(code, version, text)
* useContext[+]
  * code = $usage-context-type{code}
  * code.version = {version}
  * valueCodeableConcept.text = {text}
 
RuleSet: MeasureCoding(code, system, display, version)
* coding[+]
  * code = {code}
  * system = {system}
  * display = {display}
  * version = {version}

RuleSet: MeasureCommonCodings
* jurisdiction
  * insert MeasureCoding(#US, "urn:iso:std:iso:3166", "United States of America", "4.0.1")
* scoring[+]
  * insert MeasureCoding(#proportion, $measure-scoring, "Proportion", "4.0.1")
* type[+]
  * insert MeasureCoding(#outcome, $measure-type, "Outcome", "3.0.0")
* improvementNotation[+]
  * insert MeasureCoding(#decrease, $measure-improvement-notation, "Lower score indicates better quality", "0.1.0")

RuleSet: MeasureEffectivePeriod(year)
* effectivePeriod[+]
  * start = {year}-01-01T00:00:00-07:00
  * end = {year}-12-31T23:59:59-07:00

RuleSet: MeasureTopic(code, display)
* topic[+]
  * coding[+]
    * code = {code}
    * system = $loinc
    * display = {display}

RuleSet: MeasureCommonTopic
* insert MeasureTopic(#57024-2, "Health Quality Measure Document")
  
RuleSet: MeasureSDE(id, code, expression)
* supplementalData[+]
  * id = {id}
  * code = {code}
  * usage = $measure-data-usage#supplemental-data
  * description = {expression}
  * criteria[+].language = #text/cql-identifier
  * criteria[=].expression = {expression}

RuleSet: MeasureSDEStandard
* insert MeasureSDE("sde-ethnicity", $measure-supplemental-data#ethnicity "SDE Ethnicity", "SDE Ethnicity")  
* insert MeasureSDE("sde-payer", $measure-supplemental-data#payer "SDE Payer", "SDE Payer")
* insert MeasureSDE("sde-race", $measure-supplemental-data#race "SDE Race", "SDE Race")
* insert MeasureSDE("sde-sex", $measure-supplemental-data#gender "SDE Sex", "SDE Sex")

RuleSet: MeasureCareGap(id, code, expression)
* supplementalData[+]
  * id = {id}
  * code = {code}
  * usage = $caregap-data#date-of-non-compliance
  * description = {expression}
  * criteria[+].language = #text/cql-identifier
  * criteria[=].expression = {expression}

RuleSet: MeasureNonCompliance
* insert MeasureCareGap("date-of-non-compliance", $caregap-data#date-of-non-compliance "SDE Date of Non-Compliance", "SDE Date of Non-Compliance")

RuleSet: MeasureDetails(version, dateTime)
* status = #active
* experimental = true
* version = {version}
* date = {dateTime}
* publisher = "National Committee for Quality Assurance"
* contact.telecom[+]
  * system = #url
  * value = "https://cms.gov"

RuleSet: MeasureGroupStrataId(id)
* group[+].id = {id}

RuleSet: MeasureGroupStrataPopulation(eMeasureUUID, description, code, expression)
* group[=]
  * population[+].id = {eMeasureUUID}
  * population[=].description = {description}
  * population[=].code = $measure-population#{code} {expression}
  * population[=].criteria.language = #text/cql-identifier
  * population[=].criteria.expression = {expression}

//eMeasureUUID's can be found here: https://github.com/CMSgov/qpp-measures-data/blob/develop/measures/2023/measures-data.json

// Not Needed for every measure 
RuleSet: MeasureStratifierAge(text, expression)
* group[=]
  * stratifier[+]
    * id = {expression}
    * code = $stratifier-type#age {text}
    * criteria.language = #text/cql-identifier
    * criteria.expression = {expression}

/*
Instance: Measure-Name
InstanceOf: Measure
Usage: #example
* insert MeasureCommonExtensions
* language = "en"

* insert MeasureIdentifierCMSDisplay(value)
* insert MeasureIdentifierCMSID(value)
* insert MeasureIdentifierGUID(value)
* insert MeasureIdentifierID(value)

* insert MeasureCommonURLs(measureID)

* name = "name"
* title = "title"
* insert MeasureDetails(version, date)

* disclaimer = "disclaimer"
* description = "description" 
* copyright = "copyright"
* guidance = "guidance"

* insert MeasureUseContext(code, version, text)

* purpose = "purpose"

* insert MeasureEffectivePeriod(year)

* insert MeasureCommonTopic

* insert MeasureCommonCodings

* rationale = "rationale"

* clinicalRecommendationStatement = "clinical reccomendation statement"

//FOR SINGLE RATE MEASURE
* group[+]
* insert MeasureGroupStrataPopulation(eMeasureUUID, code, expression)
* insert MeasureGroupStrataPopulation(eMeasureUUID, code, expression)
* insert MeasureGroupStrataPopulation(eMeasureUUID, code, expression)

//FOR MULTI RATE MEASURE
* insert MeasureGroupStrataId(id)
* insert MeasureGroupStrataPopulation(eMeasureUUID, code, expression)
* insert MeasureGroupStrataPopulation(eMeasureUUID, code, expression)
* insert MeasureGroupStrataPopulation(eMeasureUUID, code, expression)

* insert MeasureGroupStrataId(id)
* insert MeasureGroupStrataPopulation(eMeasureUUID, code, expression)
* insert MeasureGroupStrataPopulation(eMeasureUUID, code, expression)
* insert MeasureGroupStrataPopulation(eMeasureUUID, code, expression)

* insert MeasureSDEStandard 
*/