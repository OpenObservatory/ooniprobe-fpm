export OONIPROBE_VERSION="2.2.0"
export PKG_VERSION="2.2.0-0"
export OONIPROBE_SRC="$HOME/code/OONI/ooni-probe"
export PKG_NAME="ooniprobe"
export PKG_MAINTAINER="Open Observatory of Network Interference <contact@openobservatory.org>"
export PKG_URL="https://ooni.torproject.org/"
export PKG_DESCRIPTION="ooniprobe: Network measurement framework aimed at detecting network interference"

copy_manpages() {
    rm -rf conf/virtualenv-extra/usr/share/man/man1/*
    cp $OONIPROBE_SRC/data/*.1 conf/debian/extra-files/usr/share/man/man1/
}
