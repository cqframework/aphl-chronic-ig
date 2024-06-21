Instance: DepressionScreeningandFollowUp
InstanceOf: PlanDefinition
Usage: #example
* insert PlanDefURLs(DepressionScreeningandFollowUp)
* name = "DepressionScreeningandFollowUp"
* title = "Preventive Care and Screening: Screening for Depression and Follow-Up Plan"
* date = "2024-06-01"
* description = "Percentage of patients aged 12 years and older screened for depression on the date of the encounter or up to 14 days prior to the date of the encounter using an age-appropriate standardized depression screening tool AND if positive, a follow-up plan is documented on the date of or up to two days after the date of the qualifying encounter"
* insert PlanDefCommonDetails
* insert PlanDefEffectivePeriod(2024)
* insert PlanDefLib(DepressionScreeningandFollowUp)

* action[+]
  * insert ActionStart

* action[+]
  * insert ActionCheckReportableCode($loinc#73831-0 "Adolescent Depression Screening Assessment", $loinc#73832-8 "Adult Depression Screening Assessment")

* action[+]
  * insert ActionEvaluateMeasure(DepressionScreeningandFollowUp)

* action[+]
  * insert ActionReportDS
  * action[+]
    * insert ActionCreateEICR(DepressionScreeningandFollowUp)
  * action[+]
    * insert ActionValidateEICR(DepressionScreeningandFollowUp)
  * action[+]
    * insert ActionSubmitEICR