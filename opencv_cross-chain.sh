echo -e "\033[33m"Login the top admin account"\033[0m(\033[32m"root"\033[0m)"
su root
sudo apt-get install build-essential -y
sudo apt-get install cmake -y
sudo apt-get install git -y
sudo apt-get install g++-arm-linux-gnueabi -y
sudo apt-get install gcc-arm-linux-gnueabi -y
sudo apt-get install g++-arm-linux-gnueabihf -y
sudo apt-get install gcc-arm-linux-gnueabihf -y
sudo apt-get install cmake-curses-gui -y
sudo apt-get install libpng12-dev -y
sudo apt-get install libjpeg62-dev  -y
sudo apt-get install libtiff4-dev -y
sudo apt-get install zlib1g-dev -y
sudo apt-get install autoconf automake libtool autotools-dev -y
sudo apt-get install pkgconf -y
apt-get install -y libpng* -y
echo "export LD_LIBRARY_PATH=\"/usr/local/lib:/usr/local/arm/opencv/lib:/usr/local/arm/leptonica/lib:/usr/local/arm/tesseract-ocr/lib:\$LD_LIBRARY_PATH\"" >> /etc/bash.bashrc
cd /home/user
wget https://sourceforge.net/projects/opencvlibrary/files/opencv-unix/3.4.3/opencv-3.4.3.zip/download
mv download opencv.3.4.3.zip
unzip opencv.3.4.3.zip
cd opencv-3.4.3
mkdir build
cd build
sudo cmake -DCMAKE_INSTALL_PREFIX=/usr/local/arm/opencv -D CV__EXCEPTION_PTR=0 -DWITH_FFMPEG=ON -DWITH_JASPER=ON -DWITH_JPEG=ON -DWITH_PNG=ON -DWITH_TIFF=ON -DWITH_VFW=ON -DWITH_WEBP=ON -DWITH_TBB=ON -DWITH_V4L=ON -DWITH_OPENEXR=ON -DWITH_OPENGL=ON -DBUILD_JASPER=ON -DBUILD_JPEG=ON -DBUILD_PNG=ON -DBUILD_OPENEXR=ON -DBUILD_PACKAGE=ON -DBUILD_TIFF=ON -DBUILD_WITH_DEBUG_INFO=ON -DBUILD_WITH_STATIC_CRT=ON -DBUILD_ZLIB=ON -DBUILD_EXAMPLES=ON -DBUILD_NEW_PYTHON_SUPPORT=ON -DINSTALL_PYTHON_EXAMPLES=ON -DINSTALL_C_EXAMPLES=ON -DSOFTFT=ON -DUSE_NEON=ON -DCMAKE_TOOLCHAIN_FILE=/home/user/opencv-3.4.3/platforms/linux/arm-gnueabi.toolchain.cmake /home/user/opencv-3.4.3
make
make install
echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/arm/opencv/lib/pkgconfig" >> /etc/bash.bashrc
echo "export PKG_CONFIG_PATH" >> /etc/bash.bashrc
echo "export CXX=arm-linux-gnueabi-g++ CC=arm-linux-gnueabi-gcc" >> /etc/bash.bashrc
echo "export OpenCV_DIR=/home/user/opencv-3.4.3/build" >> /etc/bash.bashrc
sudo ldconfig
sudo echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf
echo -e "\033[33m"Check the openCV library architecture."\033[0m"
cd /usr/local/arm/opencv/lib
file *.so.* | grep ARM
