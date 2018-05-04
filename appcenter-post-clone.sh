#!/bin/bash

set -e -x

cd "$AGENT_HOMEDIRECTORY"

curl -L -o "appcenter-build-assets-latest.zip" "https://appcenterbuildassetsint.blob.core.windows.net/buildscripts/appcenter-build-assets-latest.zip"

rm -rf "scripts"
mkdir -p "scripts"
unzip -q -o -d "scripts" "appcenter-build-assets-latest.zip"

ls -l -a "scripts"

cd scripts
sed -i.bak 's/\(tr -d .*\)/\1 \&\& echo \"##vso[task.setvariable variable=APPLE_PROV_PROFILE_UUID]$UUID\"/g' determine-signing-style-and-pods-update.sh
cat determine-signing-style-and-pods-update.sh

cd lib-build-xcproject-analyzer
npm i yargs
npm i lodash