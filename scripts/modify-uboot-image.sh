# 复制 rk3568-6.x-uboot.img 文件到编译的工作目录
# cp -f $GITHUB_WORKSPACE/configfiles/rk3568-6.x-uboot.img rk3568-6.x-uboot.img
# mnt/workdir/openwrt/bin/targets/rockchip/armv8/


# 彼度云g18 pro
gzip -d openwrt-rockchip-armv8-alark35_3500-squashfs-sysupgrade.img.gz
ls

dd if=$GITHUB_WORKSPACE/configfiles/rk3568-6.x-uboot.img of=openwrt-rockchip-armv8-alark35_3500-squashfs-sysupgrade.img bs=512 seek=64 conv=notrunc

gzip openwrt-rockchip-armv8-alark35_3500-squashfs-sysupgrade.img


rm -f sha256sums
find * -maxdepth 1 -type f ! -path "packages/*" -exec sha256sum {} + > sha256sums

echo "修改镜像成功"

ls
