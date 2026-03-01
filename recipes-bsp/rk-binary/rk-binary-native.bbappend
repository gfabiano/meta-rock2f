# Copyright (C) 2019, Fuzhou Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

inherit local-git deploy native

DESCRIPTION = "Rockchip binary tools"

SRC_URI = " \
	git://github.com/rockchip-linux/rkbin.git;protocol=https;nobranch=1;branch=master;name=rkbin;depth=1 \
	git://github.com/LubanCat/tools.git;protocol=https;branch=master;name=tools;destsuffix=git/extra;depth=1 \
"

SRCREV_rkbin = "c41b714cacd249e3ef69b2bbe774da5095eefd72"
SRCREV_tools = "1a32bc776af52494144fcef6641a73850cee628a"
