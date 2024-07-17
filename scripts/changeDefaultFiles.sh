#!/bin/bash
workdir=`pwd`
sudo mkdir -p -m 777 /mnt/openwrt
git clone https://github.com/immortalwrt/immortalwrt.git /mnt/openwrt/immortalwrt
ln -s /mnt/openwrt/immortalwrt ./immortalwrt
cd immortalwrt
df -h
cat << EOF >> feeds.conf.default
src-git diy1 https://github.com/xiaorouji/openwrt-passwall-packages.git;main
src-git diy2 https://github.com/xiaorouji/openwrt-passwall.git;main
src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main
EOF
rm target/linux/rockchip/files/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
cp $workdir/configs/rk3568-photonicat-usb30.dts target/linux/rockchip/files/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
