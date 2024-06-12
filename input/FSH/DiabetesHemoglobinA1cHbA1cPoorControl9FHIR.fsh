
Instance: DiabetesHemoglobinA1cHbA1cPoorControl9FHIR
InstanceOf: Measure
Usage: #example
* insert MeasureCommonExtensions
// * language = "en"

* insert MeasureIdentifierCMSDisplay("CMS122v11")
* insert MeasureIdentifierID("001")
* insert MeasureIdentifierGUID("f04ee808-8ece-4936-8b26-fafa462e1594") // "2c928084-83d3-1b44-0183-eb75dc8a03db"

* insert MeasureCommonURLs(DiabetesHemoglobinA1cHbA1cPoorControl9FHIR)

* name = "DiabetesHemoglobinA1cHbA1cPoorControl9FHIR"
* title = "Diabetes: Hemoglobin A1c (HbA1c) Poor Control (> 9%)FHIR"
* insert MeasureDetails("0.0.002", "2024-06-11T11:42:39-06:00")

* disclaimer = "The performance Measure is not a clinical guideline and does not establish a standard of medical care, and has not been tested for all potential applications. THE MEASURE AND SPECIFICATIONS ARE PROVIDED \"AS IS\" WITHOUT WARRANTY OF ANY KIND.\n \nDue to technical limitations, registered trademarks are indicated by (R) or [R] and unregistered trademarks are indicated by (TM) or [TM]."
* description = "Percentage of patients 18-75 years of age with diabetes who had hemoglobin A1c > 9.0% during the measurement period" 
* copyright = "This Physician Performance Measure (Measure) and related data specifications are owned and were developed by the National Committee for Quality Assurance (NCQA). NCQA is not responsible for any use of the Measure. NCQA makes no representations, warranties, or endorsement about the quality of any organization or physician that uses or reports performance measures and NCQA has no liability to anyone who relies on such measures or specifications. NCQA holds a copyright in the Measure. The Measure can be reproduced and distributed, without modification, for noncommercial purposes (e.g., use by healthcare providers in connection with their practices) without obtaining approval from NCQA. Commercial use is defined as the sale, licensing, or distribution of the Measure for commercial gain, or incorporation of the Measure into a product or service that is sold, licensed or distributed for commercial gain. All commercial uses or requests for modification must be approved by NCQA and are subject to a license at the discretion of NCQA. (C) 2012-2020 National Committee for Quality Assurance. All Rights Reserved. \n\nLimited proprietary coding is contained in the Measure specifications for user convenience. Users of proprietary code sets should obtain all necessary licenses from the owners of the code sets. NCQA disclaims all liability for use or accuracy of any third party codes contained in the specifications.\n\nCPT(R) contained in the Measure specifications is copyright 2004-2020 American Medical Association. LOINC(R) copyright 2004-2020 Regenstrief Institute, Inc. This material contains SNOMED Clinical Terms(R) (SNOMED CT[R]) copyright 2004-2020 International Health Terminology Standards Development Organisation. ICD-10 copyright 2020 World Health Organization. All Rights Reserved."
* guidance = "If the HbA1c test result is in the medical record, the test can be used to determine numerator compliance.\n\nOnly patients with a diagnosis of Type 1 or Type 2 diabetes should be included in the denominator of this measure; patients with a diagnosis of secondary diabetes due to another condition should not be included.\n\nThis eCQM is a patient-based measure.\n\nThis version of the eCQM uses QDM version 5.5. Please refer to the eCQI resource center (https://ecqi.healthit.gov/qdm) for more information on the QDM."

* purpose = "Unknown"

* insert MeasureEffectivePeriod(2024)

* insert MeasureCommonCodings

* rationale = "Diabetes is the seventh leading cause of death in the United States. In 2017, diabetes affected approximately 34 million Americans (10.5 percent of the U.S. population) and killed approximately 84,000 people (Centers for Disease Control and Prevention [CDC], 2020a). Diabetes is a long-lasting disease marked by high blood glucose levels, resulting from the body's inability to produce or use insulin properly (CDC, 2020a). People with diabetes are at increased risk of serious health complications including vision loss, heart disease, stroke, kidney damage, and amputation of feet or legs (CDC, 2018). \n\nIn 2017, diabetes cost the U.S. an estimated $327 billion: $237 billion in direct medical costs and $90 billion in reduced productivity. This is a 34 percent increase from the estimated $245 billion spent on diabetes in 2012 (American Diabetes Association [ADA], 2018).  \n\nControlling A1c blood levels helps reduce the risk of microvascular complications (eye, kidney and nerve diseases) (ADA, 2020)."

* clinicalRecommendationStatement = "American Diabetes Association (2020):\n\n- An A1C goal for many nonpregnant adults of <7% (53 mmol/mol) is appropriate. (Level of evidence: A)\n\n- On the basis of provider judgement and patient preference, achievement of lower A1C goals (such as <6.5%) may be acceptable if this can be achieved safely without significant hypoglycemia or other adverse effects of treatment. (Level of evidence: C)\n\n- Less stringent A1C goals (such as <8% [64 mmol/mol]) may be appropriate for patients with a history of severe hypoglycemia, limited life expectancy, advanced microvascular or macrovascular complications, extensive comorbid conditions, or long-standing diabetes in whom the goal is difficult to achieve despite diabetes self-management education, appropriate glucose monitoring, and effective doses of multiple glucose-lowering agents including insulin. (Level of evidence: B)"

//FOR SINGLE RATE MEASURE
* group[+]
* insert MeasureGroupStrataPopulation("F09F8D18-F787-46EA-8791-3D3EF50A4C72", "Seen patients between 18 and 75 years of age with an active diabetes diagnosis", initial-population, "Initial Population")
* insert MeasureGroupStrataPopulation("66505C6C-AAB0-4232-B0CA-15FB438090F4", "Seen patients between 18 and 75 years of age with an active diabetes diagnosis", denominator, "Denominator")
* insert MeasureGroupStrataPopulation("95BCB9D4-86A8-43C1-BE29-7440A2ECE294", "Patients whose most recent HbA1c > 9%", numerator, "Numerator")
* insert MeasureGroupStrataPopulation("6AD9B271-BBB4-4BB6-95B1-D1A7E50D812F", "Patients in hospice or long term care\, or with advanced illness or frailty", denominator-exclusion, "Denominator Exclusions")

* insert MeasureSDEStandard 
