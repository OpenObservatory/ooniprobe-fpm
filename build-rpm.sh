#!/usr/bin/env bash

if ! [ -d conf/debian ];then
    echo "ERROR: this script must be run from the root of the repo"
    exit 1
fi

source build-config.sh

echo "[+] Building Effing rpm package..."
fpm --input-type virtualenv \
    --output-type rpm \
    --package dist/ \
    --iteration `date +%s` \
    --log info \
    --depends adduser \
    --depends tor \
    --name "$PKG_NAME" \
    --description "$PKG_DESCRIPTION" \
    --version "$PKG_VERSION" \
    --maintainer "$PKG_MAINTAINER" \
    --url "$PKG_URL" \
    --after-install conf/rpm/after-install \
    --before-install conf/rpm/before-install \
    --after-upgrade conf/rpm/after-upgrade \
    --after-remove conf/rpm/after-remove \
    --virtualenv-install-location /usr/share/ooniprobe/venv \
    --virtualenv-other-files-dir conf/rpm/extra-files \
    --force \
    "ooniprobe==$OONIPROBE_VERSION"
