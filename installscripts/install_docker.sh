
DOWNLOAD_PATH=${SETUP_PATH}/DockerDebs

#ARCH=amd64


#sudo dpkg -i ./containerd.io_<version>_<arch>.deb \
#  ./docker-ce_<version>_<arch>.deb \
#  ./docker-ce-cli_<version>_<arch>.deb \
#  ./docker-buildx-plugin_<version>_<arch>.deb \
#  ./docker-compose-plugin_<version>_<arch>.deb

#containerd.io_1.6.9-1_amd64.deb


echo "Installing containerd.io"
sudo dpkg -i ${DOWNLOAD_PATH}/containerd.io_1.7.27-1_amd64.deb
read -p "Press Enter to continue..."

echo "Installing docker-ce-cli"
sudo dpkg -i ${DOWNLOAD_PATH}/docker-ce-cli_27.5.1-1~ubuntu.20.04~focal_amd64.deb
read -p "Press Enter to continue..."

echo "Installing docker-ce"
sudo dpkg -i ${DOWNLOAD_PATH}/docker-ce_27.5.1-1~ubuntu.20.04~focal_amd64.deb
read -p "Press Enter to continue..."

echo "Installing docker-buildx-plugin"
sudo dpkg -i ${DOWNLOAD_PATH}/docker-buildx-plugin_0.20.0-1~ubuntu.20.04~focal_amd64.deb
read -p "Press Enter to continue..."

echo "Installing docker-compose-plugin"
sudo dpkg -i ${DOWNLOAD_PATH}/docker-compose-plugin_2.35.1-1~ubuntu.20.04~focal_amd64.deb
read -p "Press Enter to continue..."



#sudo service docker start
#sudo docker run hello-world
