
GNUPG_VER=2.2.15
LIBGPG_ERROR_VER=1.36
LIBGCRYPT_VER=1.8.4
LIBKSBA_VER=1.3.5
LIBASSUAN_VER=2.5.3
NTBTLS_VER=0.1.2
NPTH_VER=1.6
PINENTRY_VER=1.1.0
GPGME_VER=1.13.0
GPA_VER=0.10.0



URL_LIBGPG=https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-${LIBGPG_ERROR_VER}.tar.bz2
URL_LIBCRYPT=https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${LIBGCRYPT_VER}.tar.bz2
URL_LIBKSBA=https://gnupg.org/ftp/gcrypt/libksba/libksba-${LIBKSBA_VER}.tar.bz2
URL_LIBASSUAN=https://gnupg.org/ftp/gcrypt/libassuan/libassuan-${LIBASSUAN_VER}.tar.bz2
URL_NTBTLS=https://gnupg.org/ftp/gcrypt/ntbtls/ntbtls-${NTBTLS_VER}.tar.bz2
URL_NPTH=https://gnupg.org/ftp/gcrypt/npth/npth-${NPTH_VER}.tar.bz2
URL_PINENTRY=https://gnupg.org/ftp/gcrypt/pinentry/pinentry-${PINENTRY_VER}.tar.bz2
URL_GPGME=https://gnupg.org/ftp/gcrypt/gpgme/gpgme-${GPGME_VER}.tar.bz2
URL_GPA=https://gnupg.org/ftp/gcrypt/gpa/gpa-${GPA_VER}.tar.bz2
URL_GNUPG=https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${GNUPG_VER}.tar.bz2

#PYTHON_VERSION_INSTALL=3.13.0
#FILENAME=Python-${PYTHON_VERSION_INSTALL}.tgz
#DOWNLOAD_URL=https://www.python.org/ftp/python/${PYTHON_VERSION_INSTALL}/${FILENAME}
DOWNLOAD_PATH=${SETUP_PATH}/GPGDepArchives/
EXTRACT_PATH=${WORKSPACE_PATH}/GPGDepSrc/
#BUILD_PATH=${EXTRACT_PATH}
#INSTALL_PATH=${WORKSPACE_PATH}/python/${PYTHON_VERSION_INSTALL}
#PATH=$PWD:$PATH
#echo $PATH

apt update
apt install curl

echo "Download Phase"
mkdir -p $DOWNLOAD_PATH
cd $DOWNLOAD_PATH
pwd
sleep 5

print_separator() {
    printf '%*s\n' "$(tput cols 2>/dev/null || echo 80)" '' | tr ' ' '='
}

# Function to download a URL from a variable name
download_with_pause() {
    local url=$(echo "$1"|xargs)
    print_separator
    echo "Downloading from $varname: $url"
    print_separator
    sleep 2
    curl -O "$url"
    sleep 2
}

download_with_pause $URL_LIBGPG
download_with_pause $URL_LIBCRYPT
download_with_pause $URL_LIBKSBA
download_with_pause $URL_LIBASSUAN
download_with_pause $URL_NTBTLS
download_with_pause $URL_NPTH
download_with_pause $URL_PINENTRY
download_with_pause $URL_GPGME
download_with_pause $URL_GPA
download_with_pause $URL_GNUPG

echo "Extraction Phase"
mkdir -p ${EXTRACT_PATH}

for archive in ${DOWNLOAD_PATH}/*.tar*; do
    [ -e "$archive" ] || continue  # Skip if no archives match
    print_separator
    echo "Extracting: $archive"
    print_separator
    sleep 2
    tar -xf "$archive" -C ${EXTRACT_PATH}
    echo -e "\n"
done

apt update
apt install -y bzip2 make gettext texinfo gnutls-bin libgnutls28-dev build-essential \
libbz2-dev zlib1g-dev libncurses5-dev libsqlite3-dev libldap2-dev libsecret-1-dev
