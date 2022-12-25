#!/bin/bash
qemu-system-x86_64 \
-enable-kvm \
-M host \
-m 4096 -smp 4 -cpu host \
-bios /usr/share/ovmf/x64/OVMF.fd \
-drive file=disks/bliss14-k54-gapps.qcow2,if=virtio \
-cdrom images/Bliss14-k54-gapps.iso \
-usb \
-usbdevice usb-tablet \
-usbdevice usb-keyboard \
-device qemu-xhci,id=xhci \
-machine vmport=off \
-device virtio-vga-gl -display sdl,gl=on \
-net nic,model=virtio-net-pci -net user,hostfwd=tcp::4444-:5555
