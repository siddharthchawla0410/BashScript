#!/bin/bash

#specifying versions
export GIT_VER=2.49.0
export PYTHON_VER=3.12.4
export NODEJS_VER=22.15.0

echo "Exporting GIT VER: $GIT_VER"
echo "Exporting PYTHON VER: $PYTHON_VER"
echo "Exporting NODEJS VER: $NODEJS_VER"

export GIT_LOC=/opt/git/$GIT_VER/bin
export PYTHON_LOC=/opt/python/$PYTHON_VER/bin
export NODEJS_LOC=/opt/nodejs/${NODEJS_VER}/node-v${NODEJS_VER}-linux-x64/bin
export SHELLSCRIPT_LOC=/mnt/Shared/Projects/BashScript

if [ -d "$GIT_LOC" ]; then
    echo "Exporting GIT PATH: $GIT_LOC"
    export PATH="$GIT_LOC:$PATH"
else
    echo "Could not export: $GIT_LOC"
fi

if [ -d "$PYTHON_LOC" ]; then
    echo "Exporting PYTHON PATH: $PYTHON_LOC"
    export PATH="$PYTHON_LOC:$PATH"
else
    echo "Could not export: $PYTHON_LOC"
fi

if [ -d "$NODEJS_LOC" ]; then
    echo "Exporting NODEJS PATH: $NODEJS_LOC"
    export PATH="$NODEJS_LOC:$PATH"
else
    echo "Could not export: $NODEJS_LOC"
fi

if [ -d "$SHELLSCRIPT_LOC" ]; then
    echo "Exporting SHELLSCRIPT PATH: $SHELLSCRIPT_LOC"
    export PATH="$SHELLSCRIPT_LOC:$PATH"
else
    echo "Could not export: $SHELLSCRIPT_LOC"
fi

echo "PATH Exported: $PATH"
