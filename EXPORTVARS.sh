#!/bin/bash


#GENERAL
export NAME="Siddharth Chawla"
export EMAIL="siddharthchawla0410@gmail.com"
export _TRUE_="TRUE"
export _FALSE_="FALSE"

#GIT CONFIG
export GIT_KEY=/root/.ssh/id_github
export GIT_AUTHOR_NAME="${NAME}"
export GIT_AUTHOR_EMAIL="${EMAIL}"
export GIT_COMMITTER_NAME="${NAME}"
export GIT_COMMITTER_EMAIL="${EMAIL}"

#PATHS
export DATA_PATH=/mnt/Shared
export SETUP_PATH=${DATA_PATH}/LinuxSetups
export REPO_PATH=${DATA_PATH}/Projects
export WORKSPACE_PATH=/opt

#specifying versions
export GIT_VER=2.49.0
export PYTHON_VER=3.12.4
export NODEJS_VER=22.15.0
export JDK_VER=21.0.6

export GIT_LOC=${WORKSPACE_PATH}/git/$GIT_VER/bin
export PYTHON_LOC=${WORKSPACE_PATH}/python/$PYTHON_VER/bin
export NODEJS_LOC=${WORKSPACE_PATH}/nodejs/${NODEJS_VER}/node-v${NODEJS_VER}-linux-x64/bin
export JDK_LOC=${WORKSPACE_PATH}/JDK/${JDK_VER}
export VSCODE_LOC=${WORKSPACE_PATH}/VSCode/VSCode-linux-x64
export SHELLSCRIPT_LOC=${REPO_PATH}/BashScript
export GITCOMMANDS_LOC=${SHELLSCRIPT_LOC}/gitcommands

echo "Exporting GIT VER: $GIT_VER"
echo "Exporting PYTHON VER: $PYTHON_VER"
echo "Exporting NODEJS VER: $NODEJS_VER"
echo "Exporting JDK VER: $JDK_VER"


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

if [ -d "$JDK_LOC" ]; then
    random_dir=$(ls $JDK_LOC|head -n 1)
    JDK_LOC=$(realpath ${JDK_LOC}/${random_dir}/bin)
    echo "Exporting JDK PATH: $JDK_LOC"
    export PATH="$JDK_LOC:$PATH"
else
    echo "Could not export: $JDK_LOC"
fi

if [ -d "$VSCODE_LOC" ]; then
    echo "Exporting VSCODE PATH: $VSCODE_LOC"
    export PATH="$VSCODE_LOC:$PATH"
else
    echo "Could not export: $VSCODE_LOC"
fi

if [ -d "$SHELLSCRIPT_LOC" ]; then
    echo "Exporting SHELLSCRIPT PATH: $SHELLSCRIPT_LOC"
    export PATH="$SHELLSCRIPT_LOC:$PATH"
else
    echo "Could not export: $SHELLSCRIPT_LOC"
fi

if [ -d "$GITCOMMANDS_LOC" ]; then
    echo "Exporting GITCOMMANDS PATH: $GITCOMMANDS_LOC"
    export PATH="$GITCOMMANDS_LOC:$PATH"
else
    echo "Could not export: $GITCOMMANDS_LOC"
fi

echo "PATH Exported: $PATH"
cd $SHELLSCRIPT_LOC
