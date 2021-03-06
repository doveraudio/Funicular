# Vic 20 w/ VICE w/ certain options

DISTFILE_URL='http://downloads.sourceforge.net/project/vice-emu/releases/vice-2.4.tar.gz'

platform_initsys() {
    mkdir -p "$SYSTEM_IMAGE"
}

platform_initsetup() {
    echo "Not creating setup image.  No setup image required."
}

platform_initdist() {
    dd if=/dev/zero of="$1" bs=256 count=683
    c1541 -attach "$1" -format "DIST,2A" -dir
}

platform_start() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 "${SYSTEM_IMAGE}"
}

platform_setup() {
    echo "Not starting emulator.  No setup image required."
    #xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE}
}

platform_dist() {
    echo "Not starting emulator.  No in-architecture dist steps required."
    #xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE} -iecdevice9 -9 ${DIST_IMAGE}
}

platform_distboot() {
    xvic -config vicerc -iecdevice8 -device8 1 "${DIST_IMAGE}"
}

platform_install() {
    echo "No install step.  Installation will happen during setup."
}
