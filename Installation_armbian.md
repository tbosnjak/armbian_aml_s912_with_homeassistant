# Install Armbian on Tanix T9 Pro

## Download link

[Babels150](https://users.armbian.com/balbes150/arm-64/) 

For this tutorial I used: [Bullseye current](https://users.armbian.com/balbes150/arm-64/Armbian_20.10_Arm-64_bullseye_current_5.9.0.img.xz)

## Tutorial used for the installation:

[i12bretro](https://i12bretro.github.io/tutorials/0094.html) - unforutnatelly some steps are missing and I'll add them below.

From tutorial I downloaded [Balena - Etcher](https://www.balena.io/etcher/) - protable version and followed instructions there.

### Missing steps

1. Open in File explorer on your PC the boot partition on the newly created card
2. rename u-boot-s905x-s912 to u-boot.ext
3. Edit /extlinux/extlinux.conf and use the correct DTB file. In my case it is: /dtb/amlogic/meson-gxm-q200.dtb.

the active configuration in my case is:

```txt
LABEL Armbian
LINUX /zImage
INITRD /uInitrd

# rk-3399
#FDT /dtb/rockchip/rk3399-rock-pi-4.dtb
#FDT /dtb/rockchip/rk3399-nanopc-t4.dtb
#FDT /dtb/rockchip/rk3399-roc-pc-mezzanine.dtb
#APPEND root=LABEL=ROOTFS rootflags=data=writeback rw console=uart8250,mmio32,0xff1a0000 console=tty0 no_console_suspend consoleblank=0 fsck.fix=yes fsck.repair=yes net.ifnames=0

# rk-3328
#FDT /dtb/rockchip/rk3328-roc-pc.dtb
#FDT /dtb/rockchip/rk3328-box-trn9.dtb
#FDT /dtb/rockchip/rk3328-box.dtb
#APPEND root=LABEL=ROOTFS rootflags=data=writeback rw console=uart8250,mmio32,0xff130000 console=tty0 no_console_suspend consoleblank=0 fsck.fix=yes fsck.repair=yes net.ifnames=0

# aw h6
#FDT /dtb/allwinner/sun50i-h6-tanix-tx6.dtb
#APPEND root=LABEL=ROOTFS rootflags=data=writeback rw console=ttyS0,115200 console=tty0 no_console_suspend consoleblank=0 fsck.fix=yes fsck.repair=yes net.ifnames=0 video=HDMI-A-1:e
#APPEND root=LABEL=ROOTFS rootflags=data=writeback rw console=ttyS0,115200 console=tty0 no_console_suspend consoleblank=0 fsck.fix=yes fsck.repair=yes net.ifnames=0 mem=2048M video=HDMI-A-1:e

# aml s9xxx
#FDT /dtb/amlogic/meson-gxbb-p200.dtb
#FDT /dtb/amlogic/meson-gxl-s905x-p212.dtb
FDT /dtb/amlogic/meson-gxm-q200.dtb
#FDT /dtb/amlogic/meson-g12a-x96-max.dtb
#FDT /dtb/amlogic/meson-g12b-odroid-n2.dtb
APPEND root=LABEL=ROOTFS rootflags=data=writeback rw console=ttyAML0,115200n8 console=tty0 no_console_suspend consoleblank=0 fsck.fix=yes fsck.repair=yes net.ifnames=0
```

Save everything and eject the SD card
