#!/usr/bin/env sh

set -eux

if [[ ! -v BUILD_VERSION ]]; then
    echo "BUILD_VERSION is not set"
    exit 1
fi

mkdir /build
cd /build

wget https://github.com/rafaelmardojai/blanket/archive/refs/tags/$BUILD_VERSION.tar.gz -O blanket-$BUILD_VERSION.tar.gz
tar -xzmf blanket-$BUILD_VERSION.tar.gz
cd /build/blanket-$BUILD_VERSION

dpkg-buildpackage -b -us -uc -ui

cd /build
ls -l

cp blanket_$BUILD_VERSION\_all.deb /shared/blanket_$BUILD_VERSION\_amd64.deb

cd /shared
dpkg-deb -c blanket_$BUILD_VERSION\_amd64.deb
dpkg -I blanket_$BUILD_VERSION\_amd64.deb
