@ECHO OFF
SET tooling_jar=tooling-cli-3.6.0.jar
SET input_cache_path=input-cache

rem D:\Projects\opioid-cds\bundlegen\sourcefiles
SET bundlegen_path=%~dp0
ECHO %bundlegen_path%
SET bundlegen_path=%bundlegen_path:~0,-1%
echo %bundlegen_path%
SET sourcefiles_path=%bundlegen_path%\sourcefiles

ECHO bundleid: %1
SET bundleid=%1

ECHO Checking internet connection...
PING tx.fhir.org -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
ECHO We're offline...
SET fsoption=
GOTO igpublish

:isonline
ECHO We're online, setting publish to the Connectathon sandbox FHIR server

SET fsoption=

IF EXIST "%input_cache_path%\%tooling_jar%" (

	ECHO running: JAVA -jar "%input_cache_path%\%tooling_jar%" -BundleResources -ptd="%sourcefiles_path%" -op="%bundlegen_path%" -v=r4 -e=json -bundleid="%bundleid%"
	JAVA -jar "%input_cache_path%\%tooling_jar%" -BundleResources -ptd="%sourcefiles_path%" -op="%bundlegen_path%" -v=r4 -e=json -bundleid="%bundleid%"
) ELSE If exist "..\%tooling_jar%" (

	ECHO running: JAVA -jar "..\%tooling_jar%" -BundleResources -ptd="%sourcefiles_path%" -op="%bundlegen_path%" -v=r4 -e=json -bundleid="%bundleid%"
	JAVA -jar "..\%tooling_jar%" -BundleResources -ptd="%sourcefiles_path%" -op="%bundlegen_path%" -v=r4 -e=json -bundleid="%bundleid%"
) ELSE (

	ECHO Bundle Resources NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
)

ECHO Done with _bundle.bat
