#!/bin/sh

echo "Package: mle \n\
Version: ${VERSION} \n\
Maintainer: Piotr \n\
Architecture: all \n\
Description: mle package \n\
Depends: uthash-dev, liblua5.3-dev, libpcre3-dev" > mle/DEBIAN/control

cp /publish/mle mle/usr/bin/mle
dpkg-deb --build mle
cp mle.deb /publish
mv /publish/mle.deb /publish/mle_"${VERSION}".deb