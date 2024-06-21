Alias: $plan-definition-type = http://terminology.hl7.org/CodeSystem/plan-definition-type
Alias: $us-ph-plandefinition-actions = http://hl7.org/fhir/us/medmorph/CodeSystem/us-ph-plandefinition-actions

RuleSet: MeasureCoding(code, system, display, text)
* coding[+]
  * code = {code}
  * system = {system}
  * display = {display}
* text = {text}

RuleSet: PlanDefCommonDetails
* status = #active
* experimental = true
* publisher = "HL7 Public Health Work Group"
* type[+]
  * insert MeasureCoding(#workflow-definition, $plan-definition-type, "Workflow Definition", "Workflow Definition")
* jurisdiction[+]
  * insert MeasureCoding(#US, "urn:iso:std:iso:3166", "United States of America", "United States of America")

RuleSet: PlanDefEffectivePeriod(year)
* effectivePeriod[+]
  * start = {year}-01-01
//   * end = {year}-12-31

RuleSet: PlanDefURLs(ID)
* url = "http://hl7.org/fhir/us/chronic-ds/PlanDefinition/{ID}"

RuleSet: PlanDefLib(ID)
* library = "http://hl7.org/fhir/us/chronic-ds/Library/{ID}"

RuleSet: ActionCommonDetails(id, description, text, code)
* id = {id}
* description = {description}
* textEquivalent = {text}
* code = $us-ph-plandefinition-actions#{code}

RuleSet: ActionTrigger(id, type, name)
* trigger
  * id = {id} 
  * type = #{type}
  * name = {name}

RuleSet: ActionRelated(id)
* relatedAction
  * actionId = {id}
  * relationship = #before-start

RuleSet: ActionRelatedWithOffset(id)
* relatedAction
  * actionId = {id}
  * relationship = #before-start
  * offsetDuration = 24 'h'

RuleSet: ActionConditional(expression)
* condition
  * kind = #applicability
  * expression
    * language = #text/fhirpath
    * expression = {expression}
    
RuleSet: ActionInput(id, type, path, valueset)
* input[+]
  * id = {id}
  * type = #{type}
  * codeFilter
    * path = {path}
    * valueSet = {valueset}

RuleSet: ActionProfile(id, type, profile)
* id = {id}
* type = #{type}
* profile = {profile}

RuleSet: ActionInputUSCoreProfile
* input[+]
  * id = "patient"
  * type = #Patient
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
* input[+]
  * id = "conditions"
  * type = #Condition
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition"
* input[+]
  * id = "encounter"
  * type = #Encounter
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
* input[+]
  * id = "mr"
  * type = #MedicationRequest
  * profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
* input[+]
  * id = "obs"
  * type = #Observation
  * profile = "http://hl7.org/fhir/StructureDefinition/vitalsigns" //"http://hl7.org/fhir/us/core/StructureDefinition/us-core-simple-observation"

RuleSet: ActionMeasureReportProfile
* id = "measurereport"
* type = #MeasureReport
* profile = "http://hl7.org/fhir/MeasureReport"

RuleSet: ActionStart
* insert ActionCommonDetails("start", "This action represents the start of the reporting workflow in response to the encounter-end event", "Start the reporting workflow in response to an encounter-end event", initiate-reporting-workflow)
* insert ActionTrigger("encounter-end", named-event, "encounter-end")
* insert ActionRelatedWithOffset("check-reportable")

RuleSet: ActionCheckReportableValueSet(valueset)
* insert ActionCommonDetails("check-reportable", "This action represents the check for reportability of the surveillance event.", "Check Reportable", execute-reporting-workflow)
* action[+]
  * insert ActionCommonDetails("ckr-is-encounter-reportable", "This action represents the check for reportability to create the patients eICR.", "Check Trigger Codes based on RCTC Value sets.", check-trigger-codes)
  * insert ActionConditional("%observation.exists(\)")
  * insert ActionInput("observation", Observation, "code", {valueset})
  * insert ActionRelated("evaluate-measure")

RuleSet: ActionCheckReportableCode(code1, code2)
* insert ActionCommonDetails("check-reportable", "This action represents the check for reportability of the surveillance event.", "Check Reportable", execute-reporting-workflow)
* action[+]
  * insert ActionCommonDetails("ckr-is-encounter-reportable", "This action represents the check for reportability to create the patients eICR.", "Check Trigger Codes based on RCTC Value sets.", check-trigger-codes)
  * insert ActionConditional("%observation.exists(\)")
  * input[+]
    * id = "observation"
    * type = #Observation
    * codeFilter
      * path = "code"
      * code = {code1}
  * input[+]
    * id = "observation"
    * type = #Observation
    * codeFilter
      * path = "code"
      * code = {code2}
  * insert ActionRelated("evaluate-measure")

RuleSet: ActionEvaluateMeasure(measureID)
* insert ActionCommonDetails("evaluate-measure", "This action represents the evaluation of the measure.", "Evaluate measure", evaluate-measure)
* insert ActionInputUSCoreProfile
* output[+]
  * insert ActionMeasureReportProfile
* insert ActionRelated("report-ds")
* definitionCanonical = "http://hl7.org/fhir/us/chronic-ds/Measure/{measureID}"

RuleSet: ActionReportDS
* insert ActionCommonDetails("report-ds", "This action represents the reporting of the Chronic Disease Surveillance event.", "Report Chronic Disease Surveillance", execute-reporting-workflow)
* insert ActionConditional("%measurereport.exists(\) and %measurereport.group.select(population\).where(code.coding.code = 'denominator' and count > 0\).exists(\)")

RuleSet: ActionCreateEICR(id)
* action[+]
  * insert ActionCommonDetails("create-eicr", "This action invokes the creation of the eICR report.", "Create eICR", create-report)
  * insert ActionInputUSCoreProfile
  * input[+]
    * insert ActionMeasureReportProfile
  * output[+]
    * insert ActionProfile("eicr-report-{id}", Bundle, "http://hl7.org/fhir/us/ecr/StructureDefinition/eicr-measurereport-bundle")
  * insert ActionRelated("validate-eicr")

RuleSet: ActionValidateEICR(id)
* insert ActionCommonDetails("validate-eicr", "This action represents the validation of the eICR.", "Validate eICR", validate-report)
* input[+]
  * insert ActionProfile("eicr-report-{id}", Bundle, "http://hl7.org/fhir/us/ecr/StructureDefinition/eicr-document-bundle")
* output[+]
  * insert ActionProfile("validated-eicr-report", Bundle, "http://hl7.org/fhir/us/ecr/StructureDefinition/eicr-document-bundle")
* insert ActionRelated("submit-eicr")

RuleSet: ActionSubmitEICR
* insert ActionCommonDetails("submit-eicr", "This action represents the validation of the eICR.", "Submit eICR", submit-report)
* input[+]
  * insert ActionProfile("validated-eicr-report", Bundle, "http://hl7.org/fhir/us/ecr/StructureDefinition/eicr-document-bundle")
* output[+]
  * insert ActionProfile("eicr-report-submitted", Bundle, "http://hl7.org/fhir/us/ecr/StructureDefinition/eicr-document-bundle")

