FILESEXTRAPATHS:prepend := "${THISDIR}/systemd:"

SRC_URI += "file://25-wlan.network"

do_install:append() {
    # La directory corretta per i file network di systemd-networkd
    install -d ${D}${sysconfdir}/systemd/network/
    install -m 0644 ${WORKDIR}/25-wlan.network ${D}${sysconfdir}/systemd/network/
}