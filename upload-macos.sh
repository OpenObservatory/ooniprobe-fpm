#!/usr/bin/env bash

set -e

VERSION=2.2.0-0

FILE_TARGET_PATH=ooniprobe-${VERSION}.pkg
DEB_DISTRIBUTIONS="wheezy,jessie,stretch,sid,xenial,trusty"
DEB_COMPONENT="main"
DEB_ARCHITECTURE="$ARCH"
UPLOAD_URL="https://api.bintray.com/content/openobservatory/macOS/ooniprobe/${VERSION}/${FILE_TARGET_PATH}?publish=1&override=1"

source priv8.sh

echo "[+] Uploading $FILE_TARGET_PATH ($UPLOAD_URL)"
curl -T dist/$FILE_TARGET_PATH \
    -u$BINTRAY_USER:$BINTRAY_API_KEY \
    $UPLOAD_URL
