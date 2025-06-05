#!/bin/bash

OPTIONS=$(getopt -o a:e:c:m:d: --long author:,email:,commiter:,mail:,describe: -- "$@")
eval set -- "$OPTIONS"
echo $OPTIONS
# Default values
AUTHOR_NAME=""
AUTHOR_EMAIL=""
COMMITTER_NAME=""
COMMITTER_MAIL=""
COMMIT_MSG=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        -a|--author)
            AUTHOR_NAME="$2"
            shift 2
            ;;
        -e|--email)
            AUTHOR_EMAIL="$2"
            shift 2
            ;;
        -c|--committer)
            COMMITTER_NAME="$2"
            shift 2
            ;;
        -m|--mail)
            COMMITTER_MAIL="$2"
            shift 2
            ;;
        -d|--describe)
            COMMIT_MSG="$2"
            shift 2
            ;;
        --)
                shift
                break
                ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

if [ -z "$AUTHOR_NAME" ] || [ -z "$AUTHOR_EMAIL" ] || \
   [ -z "$COMMITTER_NAME" ] || [ -z "$COMMITTER_MAIL" ] || \
   [ -z "$COMMIT_MSG" ]; then
  echo "Missing required arguments." >&2
  echo "Usage: $0 -a author -e author_email -c committer_name -m committer_email -s 'commit message'" >&2
  exit 1
fi

git add .
GIT_AUTHOR_NAME="$AUTHOR_NAME" GIT_AUTHOR_EMAIL="$AUTHOR_EMAIL" \
GIT_COMMITTER_NAME="$COMMITTER_NAME" GIT_COMMITTER_EMAIL="$COMMITTER_MAIL" \
git commit -m "$COMMIT_MSG"
