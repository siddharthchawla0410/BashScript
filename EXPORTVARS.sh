#!/bin/bash


# alias codebg='nohup code . --no-sandbox>/dev/null 2>&1 &'
alias codebg='setsid code . --no-sandbox </dev/null >/dev/null 2>&1'
#GENERAL
export NAME="Siddharth Chawla"
export EMAIL="siddharthchawla0410@gmail.com"
export _TRUE_="TRUE"
export _FALSE_="FALSE"

#GIT CONFIG
# export GIT_KEY=/root/.ssh/id_github
# export GIT_KEY=/home/linuxuser1/.ssh/id_github
export GIT_KEY=/mnt/Shared/Keys/KP3/.ssh/id_github
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
export JDK_VER=17.0.14
export GO_VER=1.25.1
export GRADLE_VER=8.0.2
export FLUTTER_VER=3.32.0

export GIT_LOC=${WORKSPACE_PATH}/git/$GIT_VER/bin
export PYTHON_LOC=${WORKSPACE_PATH}/python/$PYTHON_VER/bin
export NODEJS_LOC=${WORKSPACE_PATH}/nodejs/${NODEJS_VER}/node-v${NODEJS_VER}-linux-x64/bin
export JDK_LOC=${WORKSPACE_PATH}/JDK/${JDK_VER}
export GO_LOC=${WORKSPACE_PATH}/Go/${GO_VER}/go/bin
export VSCODE_LOC=${WORKSPACE_PATH}/VSCode/VSCode-linux-x64
export ANTIGRAVITYIDE_LOC=${WORKSPACE_PATH}/antigravity/AntigravityIDE/bin
export SHELLSCRIPT_LOC=${REPO_PATH}/BashScript
export UTILS_LOC=${SHELLSCRIPT_LOC}/utils
export GITCOMMANDS_LOC=${SHELLSCRIPT_LOC}/gitcommands
export PYTHONSCRIPTS_LOC=${SHELLSCRIPT_LOC}/pythonscripts
export CODEMONSCRIPTS_LOC=${SHELLSCRIPT_LOC}/codemonscripts
# export ANDROID_HOME=${WORKSPACE_PATH}/Android
export GRADLE_LOC=${WORKSPACE_PATH}/gradle/gradle-${GRADLE_VER}/bin
export FLUTTER_LOC=${WORKSPACE_PATH}/flutter/flutter332/bin
export CLAUDE_LOC=/home/linuxuser1/.local/bin
export SQLITE_LOC=/opt/SQLite/sqlite-tools-linux-x64-3510200
# sqlite 3.31.1 is compatible with glibc
export NGROK_LOC=/opt/ngrok-v3-stable-linux-amd64
export GCLOUD_LOC=/opt/GCloud/google-cloud-cli-linux-x86_64/google-cloud-sdk/bin

echo "Exporting GIT VER: $GIT_VER"
echo "Exporting PYTHON VER: $PYTHON_VER"
echo "Exporting NODEJS VER: $NODEJS_VER"
echo "Exporting JDK VER: $JDK_VER"
echo "Exporting GO VER: $GO_VER"
echo "Exporting GRADLE VER: $GRADLE_VER"


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

if [ -d "$GO_LOC" ]; then
    echo "Exporting GO PATH: $GO_LOC"
    export PATH="$GO_LOC:$PATH"
else
    echo "Could not export: $GO_LOC"
fi

if [ -d "$VSCODE_LOC" ]; then
    echo "Exporting VSCODE PATH: $VSCODE_LOC"
    export PATH="$VSCODE_LOC:$PATH"
else
    echo "Could not export: $VSCODE_LOC"
fi

if [ -d "$ANTIGRAVITYIDE_LOC" ]; then
    echo "Exporting ANTIGRAVITY PATH: $ANTIGRAVITYIDE_LOC"
    export PATH="$ANTIGRAVITYIDE_LOC:$PATH"
else
    echo "Could not export: $ANTIGRAVITYIDE_LOC"
fi

if [ -d "$SHELLSCRIPT_LOC" ]; then
    echo "Exporting SHELLSCRIPT PATH: $SHELLSCRIPT_LOC"
    export PATH="$SHELLSCRIPT_LOC:$PATH"
else
    echo "Could not export: $SHELLSCRIPT_LOC"
fi

if [ -d "$UTILS_LOC" ]; then
    echo "Exporting UTILS PATH: $UTILS_LOC"
    export PATH="$UTILS_LOC:$PATH"
else
    echo "Could not export: $UTILS_LOC"
fi

if [ -d "$GITCOMMANDS_LOC" ]; then
    echo "Exporting GITCOMMANDS PATH: $GITCOMMANDS_LOC"
    export PATH="$GITCOMMANDS_LOC:$PATH"
else
    echo "Could not export: $GITCOMMANDS_LOC"
fi

if [ -d "$PYTHONSCRIPTS_LOC" ]; then
    echo "Exporting PYTHONSCRIPTS PATH: $PYTHONSCRIPTS_LOC"
    export PATH="$PYTHONSCRIPTS_LOC:$PATH"
else
    echo "Could not export: $PYTHONSCRIPTS_LOC"
fi

if [ -d "$CODEMONSCRIPTS_LOC" ]; then
    echo "Exporting CODEMONSCRIPTS PATH: $CODEMONSCRIPTS_LOC"
    export PATH="$CODEMONSCRIPTS_LOC:$PATH"
else
    echo "Could not export: $CODEMONSCRIPTS_LOC"
fi


# if [ -d "$ANDROID_HOME" ]; then
#     echo "Exporting ANDROID PATH: $ANDROID_HOME"
#     export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/19.0/bin:$PATH
# else
#     echo "Could not export: $ANDROID_HOME"
# fi

if [ -d "$GRADLE_LOC" ]; then
    echo "Exporting GRADLE PATH: $GRADLE_LOC"
    export PATH=$GRADLE_LOC:$PATH
else
    echo "Could not export: $GRADLE_LOC"
fi

if [ -d "$FLUTTER_LOC" ]; then
    echo "Exporting FLUTTER PATH: $FLUTTER_LOC"
    export PATH=$FLUTTER_LOC:$PATH
else
    echo "Could not export: $FLUTTER_LOC"
fi

if [ -d "$CLAUDE_LOC" ]; then
    echo "Exporting CLAUDE PATH: $CLAUDE_LOC"
    export PATH="$CLAUDE_LOC:$PATH"
else
    echo "Could not export: $CLAUDE_LOC"
fi

# if [ -d "$SQLITE_LOC" ]; then
#     echo "Exporting SQLITE PATH: $SQLITE_LOC"
#     export PATH="$SQLITE_LOC:$PATH"
# else
#     echo "Could not export: $SQLITE_LOC"
# fi

if [ -d "$NGROK_LOC" ]; then
    echo "Exporting NGROK PATH: $NGROK_LOC"
    export PATH="$NGROK_LOC:$PATH"
else
    echo "Could not export: $NGROK_LOC"
fi

if [ -d "$GCLOUD_LOC" ]; then
    echo "Exporting GCLOUD PATH: $GCLOUD_LOC"
    export PATH="$GCLOUD_LOC:$PATH"
else
    echo "Could not export: $GCLOUD_LOC"
fi

echo "PATH Exported: $PATH"
#cd $SHELLSCRIPT_LOC
