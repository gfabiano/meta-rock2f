FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://wpa_supplicant-wlan0.conf.in"

# Abilitiamo il servizio di sistema per wlan0
inherit systemd
SYSTEMD_SERVICE:${PN}:append = " wpa_supplicant@wlan0.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

do_compile:append() {
    # Sostituzione testuale dei segnaposto con le variabili Yocto
    sed -e "s/@SSID@/${WIFI_SSID}/g" \
        -e "s/@PASSWORD@/${WIFI_PASSWORD}/g" \
        ${WORKDIR}/wpa_supplicant-wlan0.conf.in > ${WORKDIR}/wpa_supplicant-wlan0.conf
}

do_install:append() {
    # Creiamo la cartella di destinazione se non esiste
    install -d ${D}${sysconfdir}/wpa_supplicant
    
    # Installiamo il file con permessi 0600 (solo root può leggere)
    install -m 0600 ${WORKDIR}/wpa_supplicant-wlan0.conf ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf
}