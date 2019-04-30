#!/bin/bash

if [ -z "$TRAVIS_TAG" ]
then
    export TRAVIS_TAG="0.0.1";
fi

echo "Khmer Unicode Installer"
echo -e "Building package version $TRAVIS_TAG...\n"

/usr/local/bin/packagesbuild \
    --verbose \
    --package-version $TRAVIS_TAG \
    ./Packages.pkgproj
