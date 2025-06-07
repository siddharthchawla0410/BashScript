#!/bin/bash

OPTIONS=$(getopt -o a:e:c:m: --long author:,email:,commiter:,mail: -- "$@")
eval set -- "$OPTIONS"
echo $OPTIONS
# Default values
AUTHOR_NAME=""
AUTHOR_EMAIL=""
COMMITTER_NAME=""
COMMITTER_MAIL=""

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
   [ -z "$COMMITTER_NAME" ] || [ -z "$COMMITTER_MAIL" ] ; then
  echo "Missing required arguments." >&2
  echo "Usage: $0 -a author -e author_email -c committer_name -m committer_email" >&2
  exit 1
fi

export GIT_AUTHOR_NAME="$AUTHOR_NAME"
export GIT_AUTHOR_EMAIL="$AUTHOR_EMAIL"
export GIT_COMMITTER_NAME="$COMMITTER_NAME"
export GIT_COMMITTER_EMAIL="$COMMITTER_MAIL"
