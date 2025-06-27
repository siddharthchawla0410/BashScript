
EXTRACT_PATH="/opt/GPGDepSrc/*"
for dir in ${EXTRACT_PATH}; do
    echo "Current directory: ${dir}"
    if [ -d "$dir" ];then
    echo $(basename $dir)
    fi
done
