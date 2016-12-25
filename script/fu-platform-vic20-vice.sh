#!/bin/sh

# Vic 20 w/ VICE w/ certain options

DISTFILE_URL='http://downloads.sourceforge.net/project/vice-emu/releases/vice-2.4.tar.gz'
VIRTUAL_SYSTEM_IMAGE=True

initdist() {
    dd if=/dev/zero of=${DIST_IMAGE} bs=256 count=683
    c1541 -attach ${DIST_IMAGE} -format "DIST,2A" -dir
}

start() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE}
}

setup() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE}
}

dist() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE} -iecdevice9 -9 ${DIST_IMAGE}
}

distboot() {
    xvic -config vicerc -iecdevice8 -device8 1 ${DIST_IMAGE}
}

install() {
    echo "No install step.  Installation will happen during setup."
}

CMD=$1
shift
$CMD $*