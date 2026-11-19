#!/bin/bash
# =============================================================================
#  EXPORTVARS_PRETTY.sh  (prettified version of EXPORTVARS.sh)
#  Sets up environment variables, tool versions, PATH entries and aliases.
#
#  Usage : source EXPORTVARS_PRETTY.sh    (must be SOURCED, not run with bash)
#
#  Sections
#    1. Logging helpers
#    2. General / identity
#    3. Git config
#    4. Base paths
#    5. Tool versions
#    6. Tool locations
#    7. Aliases
#    8. PATH export
#    9. Summary
# =============================================================================


# =============================================================================
#  1. LOGGING HELPERS
#     Functions/vars are prefixed with _ev_ and removed at the end of the file,
#     so they don't leak into your shell.
# =============================================================================
if [ -t 1 ]; then
    _EV_RED=$'\e[31m'
    _EV_GREEN=$'\e[32m'
    _EV_YELLOW=$'\e[33m'
    _EV_BLUE=$'\e[34m'
    _EV_CYAN=$'\e[36m'
    _EV_BOLD=$'\e[1m'
    _EV_DIM=$'\e[2m'
    _EV_NC=$'\e[0m'      # no color (reset)
else
    # Output is not a terminal (piped / redirected) -> no color codes
    _EV_RED='' _EV_GREEN='' _EV_YELLOW='' _EV_BLUE='' _EV_CYAN=''
    _EV_BOLD='' _EV_DIM='' _EV_NC=''
fi

_EV_OK_COUNT=0
_EV_FAIL_COUNT=0
_EV_SKIP_COUNT=0

_ev_section() { printf '\n%s%s== %s ==%s\n' "$_EV_BOLD" "$_EV_BLUE" "$1" "$_EV_NC"; }
_ev_info()    { printf '  %s[INFO]%s %s\n'  "$_EV_CYAN"   "$_EV_NC" "$1"; }
_ev_ok()      { printf '  %s[ OK ]%s %s\n'  "$_EV_GREEN"  "$_EV_NC" "$1"; }
_ev_warn()    { printf '  %s[WARN]%s %s\n'  "$_EV_YELLOW" "$_EV_NC" "$1"; }
_ev_error()   { printf '  %s[FAIL]%s %s\n'  "$_EV_RED"    "$_EV_NC" "$1"; }

# Print "LABEL : value" with aligned columns
_ev_kv() { printf '  %s%-16s%s : %s\n' "$_EV_DIM" "$1" "$_EV_NC" "$2"; }

# _ev_add_path <LABEL> <DIR>
#   Prepends DIR to PATH if it exists. Skips it if it's already in PATH
#   (so sourcing this file twice doesn't duplicate entries).
_ev_add_path() {
    local label="$1" dir="$2"
    if [ ! -d "$dir" ]; then
        _ev_error "$(printf '%-15s' "$label") ${_EV_RED}Could not export: $dir${_EV_NC}"
        _EV_FAIL_COUNT=$((_EV_FAIL_COUNT + 1))
        return 1
    fi
    case ":$PATH:" in
        *":$dir:"*)
            _ev_warn "$(printf '%-15s' "$label") already in PATH: $dir"
            _EV_SKIP_COUNT=$((_EV_SKIP_COUNT + 1))
            ;;
        *)
            export PATH="$dir:$PATH"
            _ev_ok "$(printf '%-15s' "$label") $dir"
            _EV_OK_COUNT=$((_EV_OK_COUNT + 1))
            ;;
    esac
}

printf '%s%s>>> Loading EXPORTVARS_PRETTY.sh  (%s)%s\n' "$_EV_BOLD" "$_EV_CYAN" "$(date '+%Y-%m-%d %H:%M:%S')" "$_EV_NC"


# =============================================================================
#  2. GENERAL / IDENTITY
# =============================================================================
export NAME="Siddharth Chawla"
export EMAIL="siddharthchawla0410@gmail.com"
export _TRUE_="TRUE"
export _FALSE_="FALSE"

_ev_section "GENERAL"
_ev_kv "NAME"  "$NAME"
_ev_kv "EMAIL" "$EMAIL"


# =============================================================================
#  3. GIT CONFIG
# =============================================================================
# export GIT_KEY=/root/.ssh/id_github
# export GIT_KEY=/home/linuxuser1/.ssh/id_github
export GIT_KEY=/mnt/Shared/Keys/KP3/.ssh/id_github
export GIT_AUTHOR_NAME="${NAME}"
export GIT_AUTHOR_EMAIL="${EMAIL}"
export GIT_COMMITTER_NAME="${NAME}"
export GIT_COMMITTER_EMAIL="${EMAIL}"

_ev_section "GIT CONFIG"
_ev_kv "GIT_KEY"         "$GIT_KEY"
_ev_kv "AUTHOR/COMMITTER" "$GIT_AUTHOR_NAME <$GIT_AUTHOR_EMAIL>"
if [ ! -f "$GIT_KEY" ]; then
    _ev_warn "GIT_KEY file not found: $GIT_KEY"
fi


# =============================================================================
#  4. BASE PATHS
# =============================================================================
export DATA_PATH=/mnt/Shared
export SETUP_PATH=${DATA_PATH}/LinuxSetups
export REPO_PATH=${DATA_PATH}/Projects
export WORKSPACE_PATH=/opt

_ev_section "BASE PATHS"
_ev_kv "DATA_PATH"      "$DATA_PATH"
_ev_kv "SETUP_PATH"     "$SETUP_PATH"
_ev_kv "REPO_PATH"      "$REPO_PATH"
_ev_kv "WORKSPACE_PATH" "$WORKSPACE_PATH"


# =============================================================================
#  5. TOOL VERSIONS
# =============================================================================
export GIT_VER=2.49.0
export PYTHON_VER=3.12.4
export NODEJS_VER=26.12.0
export JDK_VER=17.0.14
export GO_VER=1.25.1
export GRADLE_VER=8.0.2
export FLUTTER_VER=3.32.0

_ev_section "VERSIONS"
_ev_kv "GIT"     "$GIT_VER"
_ev_kv "PYTHON"  "$PYTHON_VER"
_ev_kv "NODEJS"  "$NODEJS_VER"
_ev_kv "JDK"     "$JDK_VER"
_ev_kv "GO"      "$GO_VER"
_ev_kv "GRADLE"  "$GRADLE_VER"
_ev_kv "FLUTTER" "$FLUTTER_VER"


# =============================================================================
#  6. TOOL LOCATIONS
# =============================================================================
# --- Installed tools (under WORKSPACE_PATH) ---
export GIT_LOC=${WORKSPACE_PATH}/git/$GIT_VER/bin
export PYTHON_LOC=${WORKSPACE_PATH}/python/$PYTHON_VER/bin
export NODEJS_LOC=${WORKSPACE_PATH}/nodejs/${NODEJS_VER}/node-v${NODEJS_VER}-linux-x64/bin
export JDK_LOC=${WORKSPACE_PATH}/JDK/${JDK_VER}
export GO_LOC=${WORKSPACE_PATH}/Go/${GO_VER}/go/bin
export GRADLE_LOC=${WORKSPACE_PATH}/gradle/gradle-${GRADLE_VER}/bin
export FLUTTER_LOC=${WORKSPACE_PATH}/flutter/flutter332/bin
# export ANDROID_HOME=${WORKSPACE_PATH}/Android

# --- IDEs ---
export VSCODE_LOC=${WORKSPACE_PATH}/VSCode/VSCode-linux-x64
export ANTIGRAVITYIDE_LOC=${WORKSPACE_PATH}/antigravity/AntigravityIDE/bin

# --- Own scripts (this repo) ---
export SHELLSCRIPT_LOC=${REPO_PATH}/BashScript
export UTILS_LOC=${SHELLSCRIPT_LOC}/utils
export GITCOMMANDS_LOC=${SHELLSCRIPT_LOC}/gitcommands
export PYTHONSCRIPTS_LOC=${SHELLSCRIPT_LOC}/pythonscripts
export CODEMONSCRIPTS_LOC=${SHELLSCRIPT_LOC}/codemonscripts

# --- Other CLIs ---
export CLAUDE_LOC=/home/linuxuser1/.local/bin
# sqlite 3.31.1 is compatible with glibc
export SQLITE_LOC=/opt/SQLite/sqlite-tools-linux-x64-3540100
export NGROK_LOC=/opt/ngrok-v3-stable-linux-amd64
export GCLOUD_LOC=/opt/GCloud/google-cloud-cli-linux-x86_64/google-cloud-sdk/bin
export FIREBASECLI_LOC=/opt/firebasecli


# =============================================================================
#  7. ALIASES
#     Add new aliases here AND to the log list below.
# =============================================================================
# alias codebg='nohup code . --no-sandbox>/dev/null 2>&1 &'
alias codebg='setsid code . --no-sandbox </dev/null >/dev/null 2>&1'

_ev_section "ALIASES"
for _ev_alias in codebg; do
    if alias "$_ev_alias" >/dev/null 2>&1; then
        _ev_kv "$_ev_alias" "$(alias "$_ev_alias" | sed "s/^alias $_ev_alias=//")"
    else
        _ev_error "alias '$_ev_alias' is not defined"
    fi
done
unset _ev_alias


# =============================================================================
#  8. PATH EXPORT
#     Each entry is PREPENDED, so entries lower in this list win on conflicts.
# =============================================================================
_ev_section "PATH"

# --- Installed tools ---
_ev_add_path "GIT"     "$GIT_LOC"
_ev_add_path "PYTHON"  "$PYTHON_LOC"
_ev_add_path "NODEJS"  "$NODEJS_LOC"

# JDK: the version folder contains one extracted folder (e.g. jdk-17.0.14+7),
# so resolve its bin directory first.
if [ -d "$JDK_LOC" ]; then
    _ev_jdk_dir=$(ls "$JDK_LOC" | head -n 1)
    JDK_LOC=$(realpath "${JDK_LOC}/${_ev_jdk_dir}/bin")
    unset _ev_jdk_dir
fi
_ev_add_path "JDK"     "$JDK_LOC"

_ev_add_path "GO"      "$GO_LOC"

# --- IDEs ---
_ev_add_path "VSCODE"      "$VSCODE_LOC"
_ev_add_path "ANTIGRAVITY" "$ANTIGRAVITYIDE_LOC"

# --- Own scripts ---
_ev_add_path "SHELLSCRIPT"    "$SHELLSCRIPT_LOC"
_ev_add_path "UTILS"          "$UTILS_LOC"
_ev_add_path "GITCOMMANDS"    "$GITCOMMANDS_LOC"
_ev_add_path "PYTHONSCRIPTS"  "$PYTHONSCRIPTS_LOC"
_ev_add_path "CODEMONSCRIPTS" "$CODEMONSCRIPTS_LOC"

# --- Android (disabled) ---
# if [ -d "$ANDROID_HOME" ]; then
#     echo "Exporting ANDROID PATH: $ANDROID_HOME"
#     export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/19.0/bin:$PATH
# else
#     _ev_error "Could not export: $ANDROID_HOME"
# fi

# --- Build tools ---
_ev_add_path "GRADLE"  "$GRADLE_LOC"
_ev_add_path "FLUTTER" "$FLUTTER_LOC"

# --- Other CLIs ---
_ev_add_path "CLAUDE"      "$CLAUDE_LOC"
_ev_add_path "SQLITE"      "$SQLITE_LOC"
_ev_add_path "NGROK"       "$NGROK_LOC"
_ev_add_path "GCLOUD"      "$GCLOUD_LOC"
_ev_add_path "FIREBASECLI" "$FIREBASECLI_LOC"


# =============================================================================
#  9. SUMMARY
# =============================================================================
_ev_section "SUMMARY"
_ev_kv "Added to PATH"   "${_EV_GREEN}${_EV_OK_COUNT}${_EV_NC}"
_ev_kv "Already in PATH" "${_EV_YELLOW}${_EV_SKIP_COUNT}${_EV_NC}"
_ev_kv "Failed"          "${_EV_RED}${_EV_FAIL_COUNT}${_EV_NC}"
_ev_info "Full PATH (in lookup order):"
_ev_i=1
IFS=':' read -ra _ev_path_parts <<< "$PATH"
for _ev_p in "${_ev_path_parts[@]}"; do
    printf '    %s%2d.%s %s\n' "$_EV_DIM" "$_ev_i" "$_EV_NC" "$_ev_p"
    _ev_i=$((_ev_i + 1))
done
printf '%s%s<<< EXPORTVARS_PRETTY.sh loaded%s\n\n' "$_EV_BOLD" "$_EV_CYAN" "$_EV_NC"

#cd $SHELLSCRIPT_LOC


# --- Cleanup: remove helper functions/vars from the shell ---
unset -f _ev_section _ev_info _ev_ok _ev_warn _ev_error _ev_kv _ev_add_path
unset _EV_RED _EV_GREEN _EV_YELLOW _EV_BLUE _EV_CYAN _EV_BOLD _EV_DIM _EV_NC
unset _EV_OK_COUNT _EV_FAIL_COUNT _EV_SKIP_COUNT _ev_i _ev_p _ev_path_parts
