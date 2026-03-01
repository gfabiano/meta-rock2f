FILESEXTRAPATHS:prepend := "${THISDIR}/linux-rockchip:"

SRC_URI = " \
    git://codeberg.org/gfabiano/linux-rockchip.git;protocol=https;branch=rk-6.1-rkr5.1_gfabiano;depth=1; \
    file://${THISDIR}/files/cgroups.cfg \
    file://kodi-custom.cfg \
"

PATCHPATH = "${THISDIR}/${BPN}"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

KERNEL_VERSION_SANITY_SKIP = "1"
LINUX_VERSION ?= "6.1"

SRC_URI:append = " ${@bb.utils.contains('IMAGE_FSTYPES', 'ext4', \
		   'file://${THISDIR}/files/ext4.cfg', \
		   '', \
		   d)}"

EXTRA_OEMAKE += "KCFLAGS=-Wno-error"
