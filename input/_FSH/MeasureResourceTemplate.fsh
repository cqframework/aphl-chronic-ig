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
Alias: $coverage-class = http://terminology.hl7.org/CodeSystem/coverage-class
 
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

RuleSet: MeasureIdentifier(use, system, value)
* identifier[+]
  * use = {use}
  * system = {system}
  * value = {value}

RuleSet: MeasureIdentifierCMSDisplay(value)
* insert MeasureIdentifier(#usual, $identifier-type#short-name "Short Name", {value})

RuleSet: MeasureIdentifierID(value)
* insert MeasureIdentifier(#official, $identifier-type#publisher "Publisher", {value})

RuleSet: MeasureIdentifierGUID(value)
* insert MeasureIdentifier(#official, $measure-guid, {value})

RuleSet: MeasureUseContext(code, version, text)
* useContext[+]
  * code = $usage-context-type{code}
  * code.version = {version}
  * valueCodeableConcept.text = {text}
 
RuleSet: MeasureCoding(code, system, display)
* coding[+]
  * code = {code}
  * system = {system}
  * display = {display}
//   * version = {version}

RuleSet: MeasureCommonCodings
// * jurisdiction
//   * insert MeasureCoding(#US, "urn:iso:std:iso:3166", "United States of America", "4.0.1")
* scoring[+]
  * insert MeasureCoding(#proportion, $measure-scoring, "Proportion")
* type[+]
  * insert MeasureCoding(#outcome, $measure-type, "intermediateOutcome")
* improvementNotation[+]
  * insert MeasureCoding(#decrease, $measure-improvement-notation, "Lower score indicates better quality")

RuleSet: MeasureEffectivePeriod(year)
* effectivePeriod[+]
  * start = {year}-01-01
  * end = {year}-12-31

RuleSet: MeasureTopic(code, display)
* topic[+]
  * coding[+]
    * code = {code}
    * system = $loinc
    * display = {display}

RuleSet: MeasureCommonTopic
* insert MeasureTopic(#57024-2, "Health Quality Measure Document")
  
RuleSet: MeasureSDE(id, code, description, expression)
* supplementalData[+]
  * id = {id}
  * code = {code}
  * usage = $measure-data-usage#supplemental-data
  * description = {description}
  * criteria[+].language = #text/cql-identifier
  * criteria[=].expression = {expression}

RuleSet: MeasureSDEStandard
* insert MeasureSDE("sde-ethnicity", $loinc#54133-4 "Ethnicity", "Ethnicity (CDC Value Set\)", "SDE Ethnicity")  
* insert MeasureSDE("sde-payer", $coverage-class#plan "SDE Payer", "Payer", "SDE Payer")
* insert MeasureSDE("sde-race", $loinc#32624-9 "SDE Race", "Race (CDC Value Set\)", "SDE Race")
* insert MeasureSDE("sde-sex", $loinc#72143-1 "Sex [HL7.v3]", "Administrative sex", "SDE Sex")
* insert MeasureSDE("sde-age", $loinc#30525-0 "Age", "Age", "SDE Age")
* insert MeasureSDE("sde-state-of-residence", $loinc#52830-7 "State\, district or territory federal abbreviation", "State of residence", "SDE State of Residence")
* insert MeasureSDE("sde-postal-code-of-residence", $loinc#45401-7 "Postal code", "Postal code of residence", "SDE Postal Code of Residence")
* insert MeasureSDE("sde-food-insecurity-risk-status", $loinc#88124-3 "Food insecurity risk [HVS]", "Food insecurity risk status", "SDE Food Insecurity Risk Status")

RuleSet: MeasureCareGap(id, code, expression)
* supplementalData[+]
  * id = {id}
  * code = {code}
  * code[=].coding[=].text = {id}
  * usage = $caregap-data#date-of-non-compliance
  * description = {expression}
  * criteria[+].language = #text/cql-identifier
  * criteria[=].expression = {expression}

RuleSet: MeasureNonCompliance
* insert MeasureCareGap("date-of-non-compliance", $caregap-data#date-of-non-compliance "SDE Date of Non-Compliance", "SDE Date of Non-Compliance")

RuleSet: MeasureDetails(version, dateTime)
* status = #draft
* experimental = false
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
RuleSet: MeasureStratifier(id, code, description, expression)
* group[=]
  * stratifier[+]
    * id = {id}
    * description = {description}
    * code = {code}
    * criteria.language = #text/cql-identifier
    * criteria.expression = {expression}

RuleSet: MeasureCommonStratifiers
* insert MeasureStratifier("stratifier-ethnicity", $loinc#54133-4 "Ethnicity", "Ethnicity (CDC Value Set\)", "SDE Ethnicity")  
* insert MeasureStratifier("stratifier-payer", $coverage-class#plan "SDE Payer", "Payer", "SDE Payer")
* insert MeasureStratifier("stratifier-race", $loinc#32624-9 "SDE Race", "Race (CDC Value Set\)", "SDE Race")
* insert MeasureStratifier("stratifier-sex", $loinc#72143-1 "Sex [HL7.v3]", "Administrative sex", "SDE Sex")
* insert MeasureStratifier("stratifier-age", $loinc#30525-0 "Age", "Age", "SDE Age")
* insert MeasureStratifier("stratifier-state-of-residence", $loinc#52830-7 "State\, district or territory federal abbreviation", "State of residence", "SDE State of Residence")
* insert MeasureStratifier("stratifier-postal-code-of-residence", $loinc#45401-7 "Postal code", "Postal code of residence", "SDE Postal Code of Residence")
* insert MeasureStratifier("stratifier-food-insecurity-risk-status", $loinc#88124-3 "Food insecurity risk [HVS]", "Food insecurity risk status", "SDE Food Insecurity Risk Status")
