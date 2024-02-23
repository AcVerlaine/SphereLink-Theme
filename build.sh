#!/bin/bash
set -o errexit

declare -r currentDir="$(dirname "${BASH_SOURCE[0]}")"
source "${currentDir}/build.properties"

DISTRIBUTION_NAME=spherelink-theme-$THEME_VERSION

# prepare and zip the theme content
echo "info::: Removing an existing '$DISTRIBUTION_NAME.zip' file."
rm -rf $DISTRIBUTION_NAME.zip

mkdir alfresco
echo "info::: Packaging spherelink theme as '$DISTRIBUTION_NAME.zip'"

cp -rf theme/* verlainesso/
zip -r $DISTRIBUTION_NAME.zip spherelink

echo "info::: Cleanup temp files and folders."
rm -rf spherelink
