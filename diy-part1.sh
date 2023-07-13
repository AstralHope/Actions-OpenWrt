#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#sed -i 's#https://git.openwrt.org/feed/telephony.git#https://github.com/openwrt/telephony#g' feeds.conf.default
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages">>feeds.conf.default
echo "src-git small https://github.com/kenzok8/small">>feeds.conf.default
#wget https://raw.githubusercontent.com/AstralHope/Actions-OpenWrt/main/banner -O package/base-files/files/etc/banner
wget https://raw.githubusercontent.com/AstralHope/lede/custom/cloud/banner_r86s -O package/base-files/files/etc/banner
sed -i 's/OpenWrt/R86S/g' package/base-files/files/bin/config_generate
#sed -i 's/UTC/CST-8/g' package/base-files/files/bin/config_generate
#sed -i '/CST-8/a\\t\tset system.@system[-1].zonename='"'"'Asia\/Shanghai'"'"'' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.86.1/g' package/base-files/files/bin/config_generate
sed -i '/brounion-r86s)/{n; d}' target/linux/x86/base-files/etc/board.d/02_network
sed -i '/brounion-r86s)/a\\tucidef_set_interfaces_lan_wan "eth1 eth2 eth3 eth4" "eth0"' target/linux/x86/base-files/etc/board.d/02_network