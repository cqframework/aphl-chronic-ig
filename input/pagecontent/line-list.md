# Line List Data

In order to retrive Line List data related to Patients with a Particular Chronic Disease we are leveraging the Evaluate Measure Operation. For example in the case where a Patient has been diagnosed with Diabetes we can retrieve supplemental data by ensuring the Measure defines any relative Data Elements in the supplementalData of the Measure.

Example:
![SupplementalData](images/SupplementalDataSnippet.png)

Given the Data Elements defined in the Measure, the Measure Evaluation will retrieve the Supplemental Data and generate Observations that are contained in the MeasureReport.  These Observations are then referenced by each relevant group / population in the MeasureReport.  Each Observation has a populationId extension that points to the population that is relevant for the given Supplemental Data Object.

Each Observation will contain information of the particular Supplemental Data Element.  The value will be a CodeableConcept representing the particular result of the particular Data Element.

Example:
![DataElement](images/DataElementSnippet.png)
