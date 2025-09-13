# path_utils.sh

is_valid_path_format() {
    local path=$(echo "$1"|xargs)
    echo "The path to be checked is: $path"
    echo "$path" | od -An -tx1

    if [ -z "$path" ]; then
        echo "Invalid: Path is empty"
        return 1
    fi

#    if [[ "$path" == *$'\0'* ]]; then
#        echo "Invalid: Path contains null byte"
#        return 1
#    fi

    if [ "${#path}" -ge 4096 ]; then
        echo "Invalid: Path is too long"
        return 1
    fi

    if [[ "$path" =~ [[:cntrl:]] ]]; then
        echo "Invalid: Path contains control characters"
        return 1
    fi

    if [[ "$path" != /* ]]; then
        echo "Invalid: Path is not absolute"
        return 1
    fi

    echo "Valid path format"
    return 0
}
