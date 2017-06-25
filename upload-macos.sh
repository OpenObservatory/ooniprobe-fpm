#!/usr/bin/env bash

set -e

VERSION=2.2.0-0

FILE_TARGET_PATH=ooniprobe-${VERSION}.dmg
UPLOAD_URL="https://api.bintray.com/content/openobservatory/macOS/ooniprobe/${VERSION}/${FILE_TARGET_PATH}?publish=1&override=1"

source priv8.sh

echo "[+] Uploading $FILE_TARGET_PATH ($UPLOAD_URL)"
curl -T dist/$FILE_TARGET_PATH \
    -u$BINTRAY_USER:$BINTRAY_API_KEY \
    $UPLOAD_URL
