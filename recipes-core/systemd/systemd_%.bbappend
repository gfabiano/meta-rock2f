FILESEXTRAPATHS:prepend := "${THISDIR}/systemd:"

SRC_URI += "file://autologin.conf"

do_install:append() {
    install -d ${D}${sysconfdir}/systemd/system/getty@tty1.service.d/
    install -m 0644 ${WORKDIR}/autologin.conf \
        ${D}${sysconfdir}/systemd/system/getty@tty1.service.d/autologin.conf

    install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
    ln -sf /lib/systemd/system/getty@.service \
        ${D}${sysconfdir}/systemd/system/getty.target.wants/getty@tty1.service
}