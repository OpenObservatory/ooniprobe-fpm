#!/usr/bin/env bash

set -e

VERSION=2.2.0-0
ARCH=i386

FILE_TARGET_PATH=ooniprobe_${VERSION}_$ARCH.deb
DEB_DISTRIBUTIONS="wheezy,jessie,stretch,sid,xenial,trusty"
DEB_COMPONENT="main"
DEB_ARCHITECTURE="$ARCH"
UPLOAD_URL="https://api.bintray.com/content/openobservatory/deb/ooniprobe/${VERSION}/${FILE_TARGET_PATH};deb_distribution=$DEB_DISTRIBUTIONS;deb_component=main;deb_architecture=$DEB_ARCHITECTURE?publish=1"

source priv8.sh

echo "[+] Uploading $FILE_TARGET_PATH ($UPLOAD_URL)"
curl -T dist/$FILE_TARGET_PATH \
    -u$BINTRAY_USER:$BINTRAY_API_KEY \
    $UPLOAD_URL
