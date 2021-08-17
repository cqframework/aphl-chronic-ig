@ECHO OFF

DEL /F /Q bundlegen/kars-transaction-bundle.json
DEL /F /Q bundlegen/kars-collection-bundle.json
DEL /F /Q bundlegen\sourcefiles\*

if not exist bundlegen\sourcefiles mkdir bundlegen\sourcefiles

echo refreshing kars bundle...
rem  1) Run _refresh
rem  2) Copy the libraries from `input/resources/libraries` to `bundles\kars\kars-files`
rem  3) Prefix library file names with `library-`
COPY input/resources/library/AdultOutpatientEncountersFHIR4.json bundlegen/sourcefiles/library-AdultOutpatientEncountersFHIR4.json
COPY input/resources/library/AdvancedIllnessandFrailtyExclusionECQMFHIR4.json bundlegen/sourcefiles/library-AdvancedIllnessandFrailtyExclusionECQMFHIR4.json
COPY input/resources/library/ControllingBloodPressureFHIR.json bundlegen/sourcefiles/library-ControllingBloodPressureFHIR.json
COPY input/resources/library/DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.json bundlegen/sourcefiles/library-DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.json
COPY input/resources/library/FHIR-ModelInfo.json bundlegen/sourcefiles/library-FHIR-ModelInfo.json
COPY input/resources/library/FHIRHelpers.json bundlegen/sourcefiles/library-FHIRHelpers.json
COPY input/resources/library/HospiceFHIR4.json bundlegen/sourcefiles/library-HospiceFHIR4.json
COPY input/resources/library/MATGlobalCommonFunctionsFHIR4.json bundlegen/sourcefiles/library-MATGlobalCommonFunctionsFHIR4.json
COPY input/resources/library/SeenPatients.json bundlegen/sourcefiles/library-SeenPatients.json
COPY input/resources/library/SupplementalDataElementsFHIR4.json bundlegen/sourcefiles/library-SupplementalDataElementsFHIR4.json
COPY input/resources/library/SurveillanceDataElementsFHIR4.json bundlegen/sourcefiles/library-SurveillanceDataElementsFHIR4.json

rem  4) Copy the measures from `input/resources/measures` to `bundles\kars\kars-files`
rem  5) Prefix the measure file names with `measure-`
COPY input/resources/measure/ControllingBloodPressureFHIR.json bundlegen/sourcefiles/measure-ControllingBloodPressureFHIR.json
COPY input/resources/measure/DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.json bundlegen/sourcefiles/measure-DiabetesHemoglobinA1cHbA1cPoorControl9FHIR.json
COPY input/resources/measure/SeenPatients.json bundlegen/sourcefiles/measure-SeenPatients.json

rem  6) Copy the plandefinitions from `input/resources/plandefinitions` to `bundles\kars\kars-files`
rem  7) Prefix the plandefinition file names with `plandefinition-`
COPY input/resources/plandefinition/ChronicDSControllingBloodPressure.xml bundlegen/sourcefiles/plandefinition-ChronicDSControllingBloodPressure.xml
COPY input/resources/plandefinition/ChronicDSDiabetesPoorControl.xml bundlegen/sourcefiles/plandefinition-ChronicDSDiabetesPoorControl.xml
COPY input/resources/plandefinition/ChronicDSSeenPatients.xml bundlegen/sourcefiles/plandefinition-ChronicDSSeenPatients.xml

rem 8) Copy the valuesets from `input/vocabulary/valuesets/external` to `bundles\kars\kars-files`
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113762.1.4.1.json bundlegen/sourcefiles/valueset-2.16.840.1.113762.1.4.1.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113762.1.4.1108.15.json bundlegen/sourcefiles/valueset-2.16.840.1.113762.1.4.1108.15.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113762.1.4.1111.143.json bundlegen/sourcefiles/valueset-2.16.840.1.113762.1.4.1111.143.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.207.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.117.1.7.1.207.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.209.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.117.1.7.1.209.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.117.1.7.1.292.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.117.1.7.1.292.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1001.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1012.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1014.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1016.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1023.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1025.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1082.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1083.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1084.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1085.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1086.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1087.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.101.12.1088.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.103.12.1001.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.104.12.1011.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.109.12.1011.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.109.12.1012.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.109.12.1013.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.109.12.1014.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.109.12.1029.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.110.12.1082.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.113.12.1074.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.113.12.1075.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.118.12.1300.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.196.12.1510.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.464.1003.198.12.1013.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.526.3.353.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.526.3.353.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.526.3.378.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.526.3.378.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.526.3.398.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.526.3.398.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.526.3.1002.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.526.3.1002.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.526.3.1240.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.526.3.1240.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.113883.3.666.5.307.json bundlegen/sourcefiles/valueset-2.16.840.1.113883.3.666.5.307.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.114222.4.11.836.json bundlegen/sourcefiles/valueset-2.16.840.1.114222.4.11.836.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.114222.4.11.837.json bundlegen/sourcefiles/valueset-2.16.840.1.114222.4.11.837.json
COPY input/vocabulary/valueSet/external/valueset-2.16.840.1.114222.4.11.3591.json bundlegen/sourcefiles/valueset-2.16.840.1.114222.4.11.3591.json

rem 9) Run BundleResources: -BundleResources -ptd="C:\Users\Bryn\Documents\Src\APHL\aphl-chronic-disease-surveillance-ig\bundles\kars\kars-files" -op="C:\Users\Bryn\Documents\Src\APHL\aphl-chronic-disease-surveillance-ig\bundles\kars" -v=r4 -e=json
rem  Bundle all resources from bundlegen/sourcefiles
cmd /c bundlegen/_bundle.sh "kars-transaction"
cmd /c bundlegen/_bundle.sh "kars-collection"

rem 10) Copy the resulting output file and rename it `kars-transaction-bundle`, `kars-collection-bundle`
DEL /F /Q bundles/kars-transaction-bundle.json
COPY bundlegen/kars-transaction-bundle.json bundles/kars/kars-transaction-bundle.json
echo 'Copied generated bundle to bundles/kars-transaction-bundle.json'

DEL /F /Q bundles/kars-collection-bundle.json
COPY bundlegen/kars-collection-bundle.json bundles/kars/kars-collection-bundle.json
echo 'Copied generated bundle to bundles/kars-collection-bundle.json'

rem 11) Update the bundle type to collection in `kars-collection-bundle`
rem !!!Must be done manually!!!

echo 'Cleaning up bundlegen/sourcefiles...'
DEL /F /Q  bundlegen/kars-transaction-bundle.json
DEL /F /Q  bundlegen/kars-collection-bundle.json
DEL /F /Q  bundlegen/sourcefiles/*

echo 'kars bundle refresh complete.'
