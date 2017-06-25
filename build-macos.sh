#!/bin/sh
set -e

source build-config.sh

echo "[+] Building Effing macos package..."
fpm --input-type virtualenv \
    --output-type osxpkg \
    --package dist/ \
    --iteration `date +%s` \
    --log info \
    --name "$PKG_NAME" \
    --description "$PKG_DESCRIPTION" \
    --version "$PKG_VERSION" \
    --maintainer "$PKG_MAINTAINER" \
    --url "$PKG_URL" \
    --osxpkg-identifier-prefix org.openobservatory.pyooniprobe \
    --virtualenv-install-location /Library/Application\ Support/ooniprobe/venv \
    --after-install conf/macos/after-install.sh \
    --before-remove conf/macos/before-remove.sh \
    --virtualenv-other-files-dir conf/macos/extra-files \
    --force \
    "ooniprobe==$OONIPROBE_VERSION"

echo -n "[+] "
touch -f dist/ooniprobe-$PKG_VERSION-macos && rm -rf dist/ooniprobe-$PKG_VERSION-macos
mkdir dist/ooniprobe-$PKG_VERSION-macos
cp dist/ooniprobe-$PKG_VERSION.pkg dist/ooniprobe-$PKG_VERSION-macos/Install\ ooniprobe.pkg

cd create-dmg && ./create-dmg --window-size 500 320 --background ../conf/macos/installer-background.png --icon-size 96 --icon "Install ooniprobe.pkg" 260 130 --hide-extension "Install ooniprobe.pkg" --volname "Install ooniprobe" ../dist/ooniprobe-$PKG_VERSION.dmg ../dist/ooniprobe-$PKG_VERSION-macos
rm -rf dist/ooniprobe-$PKG_VERSION-macos
