#!/bin/bash
rm bundlegen/kars-transaction-bundle.json
rm bundlegen/kars-collection-bundle.json
rm bundlegen/sourcefiles/*

mkdir -p bundlegen/sourcefiles

# 1) Run _refresh
# 2) Copy the libraries from `input/resources/libraries` to `bundles\kars\kars-files`
# 3) Prefix library file names with `library-`
cp input/resources/library/ControllingHighBloodPressureFHIR.json bundlegen/sourcefiles/bloodpressure/library-ControllingHighBloodPressureFHIR.json
cp input/resources/library/DepressionScreeningandFollowUp.json bundlegen/sourcefiles/depression/library-DepressionScreeningandFollowUp.json
cp input/resources/library/DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.json bundlegen/sourcefiles/diabetes/library-DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.json
cp input/resources/library/SeenPatients.json bundlegen/sourcefiles/seenpatients/library-SeenPatients.json

cp input/resources/library/AdultOutpatientEncountersFHIR4.json bundlegen/sourcefiles/bloodpressure/library-AdultOutpatientEncountersFHIR4.json
cp input/resources/library/AdultOutpatientEncountersFHIR4.json bundlegen/sourcefiles/depression/library-AdultOutpatientEncountersFHIR4.json
cp input/resources/library/AdultOutpatientEncountersFHIR4.json bundlegen/sourcefiles/diabetes/library-AdultOutpatientEncountersFHIR4.json
cp input/resources/library/AdultOutpatientEncountersFHIR4.json bundlegen/sourcefiles/seenpatients/library-AdultOutpatientEncountersFHIR4.json
cp input/resources/library/AdvancedIllnessandFrailtyExclusionECQMFHIR4.json bundlegen/sourcefiles/bloodpressure/library-AdvancedIllnessandFrailtyExclusionECQMFHIR4.json
cp input/resources/library/AdvancedIllnessandFrailtyExclusionECQMFHIR4.json bundlegen/sourcefiles/depression/library-AdvancedIllnessandFrailtyExclusionECQMFHIR4.json
cp input/resources/library/AdvancedIllnessandFrailtyExclusionECQMFHIR4.json bundlegen/sourcefiles/diabetes/library-AdvancedIllnessandFrailtyExclusionECQMFHIR4.json
cp input/resources/library/AdvancedIllnessandFrailtyExclusionECQMFHIR4.json bundlegen/sourcefiles/seenpatients/library-AdvancedIllnessandFrailtyExclusionECQMFHIR4.json
cp input/resources/library/AlphoraCommon.json bundlegen/sourcefiles/bloodpressure/library-AlphoraCommon.json
cp input/resources/library/AlphoraCommon.json bundlegen/sourcefiles/depression/library-AlphoraCommon.json
cp input/resources/library/AlphoraCommon.json bundlegen/sourcefiles/diabetes/library-AlphoraCommon.json
cp input/resources/library/AlphoraCommon.json bundlegen/sourcefiles/seenpatients/library-AlphoraCommon.json
cp input/resources/library/FHIR-ModelInfo.json bundlegen/sourcefiles/bloodpressure/library-FHIR-ModelInfo.json
cp input/resources/library/FHIR-ModelInfo.json bundlegen/sourcefiles/depression/library-FHIR-ModelInfo.json
cp input/resources/library/FHIR-ModelInfo.json bundlegen/sourcefiles/diabetes/library-FHIR-ModelInfo.json
cp input/resources/library/FHIR-ModelInfo.json bundlegen/sourcefiles/seenpatients/library-FHIR-ModelInfo.json
cp input/resources/library/FHIRCommon.json bundlegen/sourcefiles/bloodpressure/library-FHIRCommon.json
cp input/resources/library/FHIRCommon.json bundlegen/sourcefiles/depression/library-FHIRCommon.json
cp input/resources/library/FHIRCommon.json bundlegen/sourcefiles/diabetes/library-FHIRCommon.json
cp input/resources/library/FHIRCommon.json bundlegen/sourcefiles/seenpatients/library-FHIRCommon.json
cp input/resources/library/FHIRHelpers.json bundlegen/sourcefiles/bloodpressure/library-FHIRHelpers.json
cp input/resources/library/FHIRHelpers.json bundlegen/sourcefiles/depression/library-FHIRHelpers.json
cp input/resources/library/FHIRHelpers.json bundlegen/sourcefiles/diabetes/library-FHIRHelpers.json
cp input/resources/library/FHIRHelpers.json bundlegen/sourcefiles/seenpatients/library-FHIRHelpers.json
cp input/resources/library/HospiceFHIR4.json bundlegen/sourcefiles/bloodpressure/library-HospiceFHIR4.json
cp input/resources/library/HospiceFHIR4.json bundlegen/sourcefiles/depression/library-HospiceFHIR4.json
cp input/resources/library/HospiceFHIR4.json bundlegen/sourcefiles/diabetes/library-HospiceFHIR4.json
cp input/resources/library/HospiceFHIR4.json bundlegen/sourcefiles/seenpatients/library-HospiceFHIR4.json
cp input/resources/library/MATGlobalCommonFunctionsFHIR4.json bundlegen/sourcefiles/bloodpressure/library-MATGlobalCommonFunctionsFHIR4.json
cp input/resources/library/MATGlobalCommonFunctionsFHIR4.json bundlegen/sourcefiles/depression/library-MATGlobalCommonFunctionsFHIR4.json
cp input/resources/library/MATGlobalCommonFunctionsFHIR4.json bundlegen/sourcefiles/diabetes/library-MATGlobalCommonFunctionsFHIR4.json
cp input/resources/library/MATGlobalCommonFunctionsFHIR4.json bundlegen/sourcefiles/seenpatients/library-MATGlobalCommonFunctionsFHIR4.json
cp input/resources/library/SupplementalDataElementsFHIR4.json bundlegen/sourcefiles/bloodpressure/library-SupplementalDataElementsFHIR4.json
cp input/resources/library/SupplementalDataElementsFHIR4.json bundlegen/sourcefiles/depression/library-SupplementalDataElementsFHIR4.json
cp input/resources/library/SupplementalDataElementsFHIR4.json bundlegen/sourcefiles/diabetes/library-SupplementalDataElementsFHIR4.json
cp input/resources/library/SupplementalDataElementsFHIR4.json bundlegen/sourcefiles/seenpatients/library-SupplementalDataElementsFHIR4.json
cp input/resources/library/SurveillanceDataElementsFHIR4.json bundlegen/sourcefiles/bloodpressure/library-SurveillanceDataElementsFHIR4.json
cp input/resources/library/SurveillanceDataElementsFHIR4.json bundlegen/sourcefiles/depression/library-SurveillanceDataElementsFHIR4.json
cp input/resources/library/SurveillanceDataElementsFHIR4.json bundlegen/sourcefiles/diabetes/library-SurveillanceDataElementsFHIR4.json
cp input/resources/library/SurveillanceDataElementsFHIR4.json bundlegen/sourcefiles/seenpatients/library-SurveillanceDataElementsFHIR4.json

# 4) Copy the measures from `input/resources/measures` to `bundles\kars\kars-files`
# 5) Prefix the measure file names with `measure-`
cp input/resources/measure/ControllingHighBloodPressureFHIR.json bundlegen/sourcefiles/bloodpressure/measure-ControllingHighBloodPressureFHIR.json
cp input/resources/measure/DepressionScreeningandFollowUp.json bundlegen/sourcefiles/depression/measure-DepressionScreeningandFollowUp.json
cp input/resources/measure/DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.json bundlegen/sourcefiles/diabetes/measure-DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.json
cp input/resources/measure/SeenPatients.json bundlegen/sourcefiles/seenpatients/measure-SeenPatients.json

# 6) Copy the plandefinitions from `input/resources/plandefinitions` to `bundles\kars\kars-files`
# 7) Prefix the plandefinition file names with `plandefinition-`
cp input/resources/plandefinition/ChronicDSControllingHighBloodPressure.xml bundlegen/sourcefiles/bloodpressure/plandefinition-ChronicDSControllingHighBloodPressure.xml
cp input/resources/plandefinition/DepressionScreeningandFollowUp.xml bundlegen/sourcefiles/depression/plandefinition-DepressionScreeningandFollowUp.xml
cp input/resources/plandefinition/ChronicDSDiabetesPoorControl.xml bundlegen/sourcefiles/diabetes/plandefinition-ChronicDSDiabetesPoorControl.xml
cp input/resources/plandefinition/ChronicDSSeenPatients.xml bundlegen/sourcefiles/seenpatients/plandefinition-ChronicDSSeenPatients.xml

#8) Copy the valuesets from `input/vocabulary/valuesets/external` to `bundles\kars\kars-files`
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113762.1.4.1.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1108.15.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113762.1.4.1108.15.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1111.143.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113762.1.4.1111.143.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.67.1.101.1.128.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.67.1.101.1.128.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.207.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.117.1.7.1.207.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.209.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.117.1.7.1.209.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.292.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.117.1.7.1.292.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1010.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1010.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.jso
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1080.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1080.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1089.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1089.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1090.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.101.12.1090.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.198.12.1135.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.198.12.1135.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1003.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.1003.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1006.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.1006.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1165.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.1165.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1167.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.464.1003.1167.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.353.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.353.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.378.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.378.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.398.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.398.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1002.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1002.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1007.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1007.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1022.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1022.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1240.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1240.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1566.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1566.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1567.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1567.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1568.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1568.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1569.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1569.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1570.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1570.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1571.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1571.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1584.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.526.3.1584.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.600.1916.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.600.1916.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.666.5.307.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.113883.3.666.5.307.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.836.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.114222.4.11.836.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.837.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.114222.4.11.837.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.3591.json bundlegen/sourcefiles/bloodpressure/valueset-2.16.840.1.114222.4.11.3591.json


cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113762.1.4.1.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1108.15.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113762.1.4.1108.15.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1111.143.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113762.1.4.1111.143.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.67.1.101.1.128.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.67.1.101.1.128.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.207.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.117.1.7.1.207.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.209.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.117.1.7.1.209.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.292.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.117.1.7.1.292.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1010.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1010.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.jso
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1080.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1080.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1089.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1089.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1090.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.101.12.1090.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.198.12.1135.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.198.12.1135.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1003.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.1003.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1006.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.1006.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1165.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.1165.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1167.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.464.1003.1167.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.353.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.353.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.378.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.378.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.398.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.398.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1002.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1002.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1007.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1007.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1022.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1022.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1240.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1240.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1566.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1566.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1567.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1567.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1568.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1568.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1569.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1569.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1570.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1570.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1571.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1571.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1584.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.526.3.1584.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.600.1916.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.600.1916.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.666.5.307.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.113883.3.666.5.307.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.836.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.114222.4.11.836.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.837.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.114222.4.11.837.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.3591.json bundlegen/sourcefiles/depression/valueset-2.16.840.1.114222.4.11.3591.json


cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113762.1.4.1.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1108.15.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113762.1.4.1108.15.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1111.143.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113762.1.4.1111.143.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.67.1.101.1.128.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.67.1.101.1.128.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.207.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.117.1.7.1.207.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.209.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.117.1.7.1.209.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.292.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.117.1.7.1.292.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1010.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1010.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.jso
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1080.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1080.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1089.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1089.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1090.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.101.12.1090.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.198.12.1135.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.198.12.1135.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1003.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.1003.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1006.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.1006.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1165.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.1165.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1167.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.464.1003.1167.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.353.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.353.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.378.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.378.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.398.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.398.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1002.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1002.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1007.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1007.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1022.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1022.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1240.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1240.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1566.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1566.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1567.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1567.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1568.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1568.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1569.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1569.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1570.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1570.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1571.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1571.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1584.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.526.3.1584.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.600.1916.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.600.1916.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.666.5.307.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.113883.3.666.5.307.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.836.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.114222.4.11.836.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.837.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.114222.4.11.837.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.3591.json bundlegen/sourcefiles/diabetes/valueset-2.16.840.1.114222.4.11.3591.json


cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113762.1.4.1.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1108.15.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113762.1.4.1108.15.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113762.1.4.1111.143.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113762.1.4.1111.143.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.67.1.101.1.128.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.67.1.101.1.128.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.207.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.117.1.7.1.207.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.209.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.117.1.7.1.209.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.292.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.117.1.7.1.292.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1010.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1010.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.jso
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1080.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1080.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1089.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1089.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1090.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.101.12.1090.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.198.12.1135.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.198.12.1135.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1003.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.1003.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1006.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.1006.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1165.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.1165.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.464.1003.1167.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.464.1003.1167.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.353.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.353.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.378.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.378.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.398.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.398.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1002.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1002.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1007.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1007.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1022.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1022.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1240.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1240.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1566.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1566.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1567.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1567.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1568.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1568.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1569.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1569.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1570.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1570.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1571.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1571.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.526.3.1584.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.526.3.1584.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.600.1916.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.600.1916.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.113883.3.666.5.307.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.113883.3.666.5.307.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.836.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.114222.4.11.836.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.837.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.114222.4.11.837.json
cp input/vocabulary/ValueSet/external/valueset-2.16.840.1.114222.4.11.3591.json bundlegen/sourcefiles/seenpatients/valueset-2.16.840.1.114222.4.11.3591.json

#9) Run BundleResources: -BundleResources -ptd="C:\Users\Bryn\Documents\Src\APHL\aphl-chronic-disease-surveillance-ig\bundles\kars\kars-files" -op="C:\Users\Bryn\Documents\Src\APHL\aphl-chronic-disease-surveillance-ig\bundles\kars" -v=r4 -e=json
# Bundle all resources from bundlegen/sourcefiles
sh bundlegen/_bundle.sh "kars-transaction"
sh bundlegen/_bundle.sh "kars-collection"

#10) Copy the resulting output file and rename it `kars-transaction-bundle`
#rm bundles/kars-transaction-bundle.json
#cp bundlegen/kars-transaction-bundle.json bundles/kars/kars-transaction-bundle.json
#echo 'Copied generated bundle to bundles/kars-transaction-bundle.json'
#rm bundles/kars-collection-bundle.json
#cp bundlegen/kars-collection-bundle.json bundles/kars/kars-collection-bundle.json
#echo 'Copied generated bundle to bundles/kars-collection-bundle.json'

#11) Update the bundle type to collection in `kars-collection-bundle`
#!!!Must be done manually!!!

echo 'Cleaning up bundlegen/sourcefiles...'
#rm bundlegen/kars-transaction-bundle.json
#rm bundlegen/kars-collection-bundle.json
#rm bundlegen/sourcefiles/bloodpressure/*
#rm bundlegen/sourcefiles/depression/*
#rm bundlegen/sourcefiles/diabetes/*
#rm bundlegen/sourcefiles/seenpatients/*

echo 'kars bundle refresh complete.'
