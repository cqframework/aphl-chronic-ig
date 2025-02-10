#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-cli-3.6.0.jar
input_cache_path=./input-cache
bundlegen_path=$PWD/bundlegen
bloodpressure_path=$bundlegen_path/sourcefiles/bloodpressure
depression_path=$bundlegen_path/sourcefiles/depression
diabetes_path=$bundlegen_path/sourcefiles/diabetes
seenpatients_path=$bundlegen_path/sourcefiles/seenpatients

if [ -z "$1" ]; then
    echo "No bundleId argument supplied"
		bundleid=""
	else
		echo Bundle ID: $1
		bundleid=-bundleid=$1
fi

set -e
echo Checking internet connection...
wget -q --spider tx.fhir.org

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	JAVA -jar $tooling -BundleResources -ptd=$bloodpressure_path -op=$bundlegen_path -v=r4 -e=json $bundleid-bloodpressure
	JAVA -jar $tooling -BundleResources -ptd=$depression_path -op=$bundlegen_path -v=r4 -e=json $bundleid-depression
	JAVA -jar $tooling -BundleResources -ptd=$diabetes_path -op=$bundlegen_path -v=r4 -e=json $bundleid-diabetes
	JAVA -jar $tooling -BundleResources -ptd=$seenpatients_path -op=$bundlegen_path -v=r4 -e=json $bundleid-seenpatients
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		JAVA -jar $tooling -BundleResources -ptd=$bloodpressure_path -op=$bundlegen_path -v=r4 -e=json $bundleid-bloodpressure
		JAVA -jar $tooling -BundleResources -ptd=$depression_path -op=$bundlegen_path -v=r4 -e=json $bundleid-depression
		JAVA -jar $tooling -BundleResources -ptd=$diabetes_path -op=$bundlegen_path -v=r4 -e=json $bundleid-diabetes
		JAVA -jar $tooling -BundleResources -ptd=$seenpatients_path -op=$bundlegen_path -v=r4 -e=json $bundleid-seenpatients
	else
		echo CQF Tooling NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi
