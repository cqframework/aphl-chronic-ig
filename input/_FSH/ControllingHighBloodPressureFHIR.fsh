Instance: ControllingHighBloodPressureFHIR
InstanceOf: Measure
Usage: #example
* insert MeasureCommonExtensions
// * language = "en"

* insert MeasureIdentifierCMSDisplay("CMS165v12")
* insert MeasureIdentifierID("236")
* insert MeasureIdentifierGUID("abdc37cc-bac6-4156-9b91-d1be2c8b7268") // "2c928084-83d3-1b44-0183-eb75dc8a03db"

* insert MeasureCommonURLs(ControllingHighBloodPressureFHIR)

* name = "ControllingHighBloodPressureFHIR"
* title = "Controlling High Blood Pressure"
* insert MeasureDetails("0.0.002", "2024-06-25T11:42:39-06:00")

* disclaimer = """
The performance Measure is not a clinical guideline and does not establish a standard of medical care, and has not been tested for all potential applications. THE MEASURE AND SPECIFICATIONS ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND. 
Due to technical limitations, registered trademarks are indicated by (R) or [R] and unregistered trademarks are indicated by (TM) or [TM].
"""

* description = "Percentage of patients 18-85 years of age who had a diagnosis of essential hypertension starting before and continuing into, or starting during the first six months of the measurement period, and whose most recent blood pressure was adequately controlled (<140/90 mmHg) during the measurement period" 

* copyright = """
This Physician Performance Measure (Measure) and related data specifications are owned and were developed by the National Committee for Quality Assurance (NCQA). NCQA is not responsible for any use of the Measure. NCQA makes no representations, warranties, or endorsement about the quality of any organization or physician that uses or reports performance measures and NCQA has no liability to anyone who relies on such measures or specifications. NCQA holds a copyright in the Measure. The Measure can be reproduced and distributed, without modification, for noncommercial purposes (e.g., use by healthcare providers in connection with their practices) without obtaining approval from NCQA. Commercial use is defined as the sale, licensing, or distribution of the Measure for commercial gain, or incorporation of the Measure into a product or service that is sold, licensed or distributed for commercial gain. All commercial uses or requests for modification must be approved by NCQA and are subject to a license at the discretion of NCQA. (C) 2012-2022 National Committee for Quality Assurance. All Rights Reserved.
Limited proprietary coding is contained in the Measure specifications for user convenience. Users of proprietary code sets should obtain all necessary licenses from the owners of the code sets. NCQA disclaims all liability for use or accuracy of any third-party codes contained in the specifications.
CPT(R) codes, descriptions and other data are copyright 2022. American Medical Association. All rights reserved. CPT is a trademark of the American Medical Association. No fee schedules, basic units, relative values or related listings are included in CPT. The AMA assumes no liability for the data contained herein. Applicable FARS/DFARS restrictions apply to government use.
LOINC(R) copyright 2004-2022 Regenstrief Institute, Inc. 
This material contains SNOMED Clinical Terms(R) (SNOMED CT[R]) copyright 2004-2022 International Health Terminology Standards Development Organisation. 
ICD-10 copyright 2022 World Health Organization. All Rights Reserved.
"""

* guidance = """
In reference to the numerator element, only blood pressure readings performed by a clinician or an automated blood pressure monitor or device are acceptable for numerator compliance with this measure. This includes blood pressures taken in person by a clinician and blood pressures measured remotely by electronic monitoring devices capable of transmitting the blood pressure data to the clinician. Blood pressure readings taken by an automated blood pressure monitor or device and conveyed by the patient to the clinician are also acceptable. It is the clinician’s responsibility and discretion to confirm the automated blood pressure monitor or device used to obtain the blood pressure is considered acceptable and reliable and whether the blood pressure reading is considered accurate before documenting it in the patient’s medical record.
Do not include BP readings taken during an acute inpatient stay or an ED visit.
If no blood pressure is recorded during the measurement period, the patient's blood pressure is assumed 'not controlled'.
If there are multiple blood pressure readings on the same day, use the lowest systolic and the lowest diastolic reading as the most recent blood pressure reading. Ranges and thresholds do not meet criteria for this measure. A distinct numeric result for both the systolic and diastolic BP reading is required for numerator compliance.
This eCQM is a patient-based measure.
This version of the eCQM uses QDM version 5.6. Please refer to the eCQI resource center (https://ecqi.healthit.gov/qdm) for more information on the QDM.
"""

* purpose = "Unknown"

* insert MeasureEffectivePeriod(2024)

* insert MeasureCommonCodings

* rationale = """
High blood pressure (HBP), also known as hypertension, is when the pressure in blood vessels is higher than normal (Centers for Disease Control and Prevention [CDC], 2021). The causes of hypertension are multiple and multifaceted and can be based on genetic predisposition, environmental risk factors, being overweight and obese, sodium intake, potassium intake, physical activity, and alcohol use. High blood pressure is common; according to the American Heart Association, between 2013-2016, approximately 121.5 million US adults >= 20 years of age had HBP and the prevalence of hypertension among US adults 65 and older was 77.0 percent (Virani et al., 2021). In an analysis of adults with hypertension in NHANES, the estimated age-adjusted proportion with controlled BP increased from 31.8 percent in 1999 to 53.8 percent in 2014. However, that proportion declined to 43.7 percent in 2017 to 2018 (Tsao et al., 2022).
HBP, known as the “silent killer,” increases risks of heart disease and stroke which are two of the leading causes of death in the US; a person who has HBP is four times more likely to die from a stroke and three times more likely to die from heart disease (CDC, 2012). The National Center for Health Statistics reported that in 2020 there were over 670,000 deaths with HBP as a primary or contributing cause (CDC, 2022). Between 2009 and 2019 the number of deaths due to HBP rose by 65.3 percent (Tsao et al., 2022). Managing and treating HBP would reduce cardiovascular disease mortality for males and females by 30.4 percent and 38.0 percent, respectively (Patel et al., 2015). Age-adjusted death rates attributable to HBP in 2019 were more than twice as high in non-Hispanic Black males (56.7 percent) when compared to rates for non-Hispanic White males (25.7 percent) (Tsao et al., 2022).
HBP costs the U.S. approximately 131 billion dollars each year, averaged over 12 years from 2003 to 2014 (Kirkland et al., 2018). A study on cost-effectiveness on treating hypertension found that controlling HBP in patients with cardiovascular disease and systolic blood pressures (SBP) of >= 160 mmHg could be effective and cost-saving (Moran, 2015).
Many studies have shown that controlling high blood pressure reduces cardiovascular events and mortality. The Systolic Blood Pressure Intervention Trial (SPRINT) investigated the impact of obtaining a SBP goal of <120 mmHg compared to a SBP goal of <140 mmHg among patients 50 and older with established cardiovascular disease and found that the patients with the former goal had reduced cardiovascular events and mortality (SPRINT Research Group et al., 2015). 
Controlling HBP will significantly reduce the risks of cardiovascular disease mortality and lead to better health outcomes like reduction of heart attacks, stroke, and kidney disease (James et al., 2014). Thus, the relationship between the measure (control of hypertension) and the long-term clinical outcomes listed is well established.
"""

* clinicalRecommendationStatement = """
U.S. Preventive Services Task Force (USPSTF) (2021):
- The USPSTF recommends screening for hypertension in adults 18 years or older with office blood pressure measurement (OBPM). The USPSTF recommends obtaining blood pressure measurements outside of the clinical setting for diagnostic confirmation before starting treatment. This is a grade A recommendation.  

American College of Cardiology/American Heart Association (2017):
- For adults with confirmed hypertension and known CVD or 10-year ASCVD event risk of 10 percent or higher, a blood pressure target of less than 130/80 mmHg is recommended (Level of evidence: B-R (for systolic blood pressures), Level of evidence: C-EO (for diastolic blood pressure)) 
- For adults with confirmed hypertension, without additional markers of increased CVD risk, a blood pressure target of less than 130/80 mmHg may be reasonable (Note: clinical trial evidence is strongest for a target blood pressure of 140/90 mmHg in this population. However, observational studies suggest that these individuals often have a high lifetime risk and would benefit from blood pressure control earlier in life) (Level of evidence: B-NR (for systolic blood pressure), Level of evidence: C-EO (for diastolic blood pressure)).

American College of Physicians and the American Academy of Family Physicians (2017):   
- Initiate or intensify pharmacologic treatment in some adults aged 60 years or older at high cardiovascular risk, based on individualized assessment, to achieve a target systolic blood pressure of less than 140 mmHg (Grade: weak recommendation, Quality of evidence: low) 
- Initiate or intensify pharmacologic treatment in adults aged 60 years or older with a history of stroke or transient ischemic attack to achieve a target systolic blood pressure of less than 140 mmHg to reduce the risk of recurrent stroke (Grade: weak recommendation, Quality of evidence: moderate) 

American Diabetes Association (2021): 
- For individuals with diabetes and hypertension at higher cardiovascular risk (existing atherosclerotic cardiovascular disease or 10-year atherosclerotic cardiovascular disease risk >=15 percent), a blood pressure target of <130/80 mmHg may be appropriate, if it can be safely attained (Level of evidence: C)
- For individuals with diabetes and hypertension at lower risk for cardiovascular disease (10-year atherosclerotic cardiovascular disease risk <15 percent), treat to a blood pressure target of <140/90 mmHg (Level of evidence: A)
"""

//FOR SINGLE RATE MEASURE
* group[+]
* insert MeasureGroupStrataPopulation("F348D767-1BDE-41AB-884D-5F0E19093980", "Patients 18-85 years of age who had a visit during the measurement period and diagnosis of essential hypertension", initial-population, "Initial Population")
* insert MeasureGroupStrataPopulation("3E0D40B3-64FC-4998-B371-34978D033116", "Patients 18-85 years of age who had a visit during the measurement period and diagnosis of essential hypertension", denominator, "Denominator")
* insert MeasureGroupStrataPopulation("24803F44-C643-45C7-A2A5-4C58BD540579", "Patients whose most recent blood pressure is adequately controlled (systolic blood pressure < 140 mmHg and diastolic blood pressure < 90 mmHg\) during the measurement period", numerator, "Numerator")
* insert MeasureGroupStrataPopulation("95E1480E-8B61-4777-865D-B2A1D6525E1A", "Patients with ESRD or dialysis or renal transplant or pregnancy or in hospice or 66+ in nursing care or 66-80 with frailty and advanced illness or 81+ with frailty or receiving palliative care", denominator-exclusion, "Denominator Exclusions")

* insert MeasureCommonStratifiers

* insert MeasureSDEStandard 