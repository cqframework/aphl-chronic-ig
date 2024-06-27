Instance: ChronicDSControllingBloodPressure
InstanceOf: PlanDefinition
Usage: #example
* insert PlanDefURLs(ChronicDSControllingBloodPressure)
* name = "ChronicDSControllingBloodPressure"
* title = "Chronic Disease Surveillance Reporting Specification for Controlling Blood Pressure"
* date = "2024-06-01"
* description = "Reporting specification for Chronic Disease Surveillance for Controlling Blood Pressure"
* insert PlanDefCommonDetails
* insert PlanDefEffectivePeriod(2024)
* insert PlanDefLib(ControllingBloodPressureFHIR)

* action[+]
  * insert ActionStart

* action[+]
  * insert ActionCheckReportable("http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.104.12.1011")

* action[+]
  * insert ActionEvaluateMeasure(ChronicDSControllingBloodPressure)

* action[+]
  * insert ActionReportDS
  * action[+]
    * insert ActionCreateEICR(ChronicDSControllingBloodPressure)
  * action[+]
    * insert ActionValidateEICR(ChronicDSControllingBloodPressure)
  * action[+]
    * insert ActionSubmitEICR