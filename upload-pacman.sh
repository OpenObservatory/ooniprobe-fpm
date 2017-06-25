#!/usr/bin/env bash

set -e

VERSION=2.2.0-0
ARCH=x86_64
FILE_TARGET_PATH=ooniprobe-${VERSION}-${ARCH}.pkg.tar.xz
UPLOAD_URL="https://api.bintray.com/content/openobservatory/archlinux/ooniprobe/${VERSION}/${FILE_TARGET_PATH}?publish=1&override=1"

source priv8.sh

echo "[+] Uploading $FILE_TARGET_PATH ($UPLOAD_URL)"
curl -T dist/$FILE_TARGET_PATH \
    -u$BINTRAY_USER:$BINTRAY_API_KEY \
    $UPLOAD_URL
