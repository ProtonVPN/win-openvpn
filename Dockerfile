FROM ubuntu:18.04
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl zip wget git make gcc gcc-mingw-w64 man2html autoconf libtool net-tools libpam0g-dev
RUN cd /home && git clone --branch openvpn-install-2.4.8-I601 https://github.com/OpenVPN/openvpn-build.git
WORKDIR /home/openvpn-build/generic
COPY patches/openvpn-2.4.8_1.patch patches/openvpn-2.4.8_1.patch
COPY patches/openvpn-2.4.8_2.patch patches/openvpn-2.4.8_2.patch
RUN IMAGEROOT=`pwd`/image-win32 CHOST=i686-w64-mingw32 CBUILD=x86_64-pc-linux-gnu ./build
RUN IMAGEROOT=`pwd`/image-win64 CHOST=x86_64-w64-mingw32 CBUILD=x86_64-pc-linux-gnu ./build
