#!/bin/sh
virsh list --all

virsh destroy MATRIX_NSGv01
sleep 0.1
virsh destroy MATRIX_NSGv02
sleep 0.1
virsh destroy MATRIX_NSGv03
sleep 0.1
virsh destroy MATRIX_NSGv04
sleep 0.1
virsh destroy MATRIX_NSGv05
sleep 0.1

virsh undefine MATRIX_NSGv01
sleep 0.1
virsh undefine MATRIX_NSGv02
sleep 0.1
virsh undefine MATRIX_NSGv03
sleep 0.1
virsh undefine MATRIX_NSGv04
sleep 0.1
virsh undefine MATRIX_NSGv05
sleep 0.1

rm -fR /var/lib/libvirt/images/MATRIX_NSGv01
rm -fR /var/lib/libvirt/images/MATRIX_NSGv02
rm -fR /var/lib/libvirt/images/MATRIX_NSGv03
rm -fR /var/lib/libvirt/images/MATRIX_NSGv04
rm -fR /var/lib/libvirt/images/MATRIX_NSGv05

sleep 0.1
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv01*
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv02*
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv03*
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv04*
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv05*

exit 0