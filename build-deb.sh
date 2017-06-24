#!/usr/bin/env bash

if ! [ -d conf/debian ];then
    echo "ERROR: this script must be run from the root of the repo"
    exit 1
fi

source build-config.sh

echo "[+] Building Effing debian package..."
fpm --input-type virtualenv \
    --output-type deb \
    --package dist/ \
    --iteration `date +%s` \
    --log info \
    --depends python \
    --depends adduser \
    --depends tor \
    --deb-recommends obfs4proxy \
    --name "$PKG_NAME" \
    --description "$PKG_DESCRIPTION" \
    --version "$VERSION" \
    --maintainer "$PKG_MAINTAINER" \
    --url "$PKG_URL" \
    --deb-systemd conf/debian/systemd/ooniprobe.service \
    --deb-upstart conf/debian/upstart/ooniprobe.conf \
    --after-install conf/debian/after-install \
    --before-install conf/debian/before-install \
    --after-upgrade conf/debian/after-upgrade \
    --after-remove conf/debian/after-remove \
    --virtualenv-install-location /usr/share/ooniprobe/venv \
    --no-deb-systemd-restart-after-upgrade \
    --virtualenv-other-files-dir conf/debian/extra-files \
    --force \
    "ooniprobe==$VERSION"
