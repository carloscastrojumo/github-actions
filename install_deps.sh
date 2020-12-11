#!/bin/bash

set -ex -o pipefail

# Install semver
if ! [ -x "$(command -v semver)" ]; then
    echo "Installing semver"
    mkdir bin
    curl -o bin/semver -sSL "https://raw.githubusercontent.com/fsaintjacques/semver-tool/3.0.0/src/semver"
fi

