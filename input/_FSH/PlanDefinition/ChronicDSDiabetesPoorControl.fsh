Instance: ChronicDSDiabetesPoorControl
InstanceOf: PlanDefinition
Usage: #example
* insert PlanDefURLs(ChronicDSDiabetesPoorControl)
* name = "ChronicDSDiabetesPoorControl"
* title = "Chronic Disease Surveillance Reporting Specification for Diabetes Hemoglobin A1c Poor Control"
* date = "2024-06-01"
* description = "Reporting specification for Chronic Disease Surveillance for Diabetes Hemoglobin A1c Poor Control"
* insert PlanDefCommonDetails
* insert PlanDefEffectivePeriod(2024)
* insert PlanDefLib(DiabetesHemoglobinA1cHbA1cPoorControl9FHIR)

* action[+]
  * insert ActionStart

* action[+]
  * insert ActionCheckReportable("http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.103.12.1001")

* action[+]
  * insert ActionEvaluateMeasure(DiabetesHemoglobinA1cHbA1cPoorControl9FHIR)

* action[+]
  * insert ActionReportDS
  * action[+]
    * insert ActionCreateEICR(ChronicDSDiabetesPoorControl)
  * action[+]
    * insert ActionValidateEICR(ChronicDSDiabetesPoorControl)
  * action[+]
    * insert ActionSubmitEICR