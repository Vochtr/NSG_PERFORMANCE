#!/bin/sh
virsh list --all

virsh destroy MATRIX_NSGv06
sleep 0.1
virsh destroy MATRIX_NSGv07
sleep 0.1
virsh destroy MATRIX_NSGv08
sleep 0.1
virsh destroy MATRIX_NSGv09
sleep 0.1
virsh destroy MATRIX_NSGv10
sleep 0.1

virsh undefine MATRIX_NSGv06
sleep 0.1
virsh undefine MATRIX_NSGv07
sleep 0.1
virsh undefine MATRIX_NSGv08
sleep 0.1
virsh undefine MATRIX_NSGv09
sleep 0.1
virsh undefine MATRIX_NSGv10
sleep 0.1

rm -fR /var/lib/libvirt/images/MATRIX_NSGv06
rm -fR /var/lib/libvirt/images/MATRIX_NSGv07
rm -fR /var/lib/libvirt/images/MATRIX_NSGv08
rm -fR /var/lib/libvirt/images/MATRIX_NSGv09
rm -fR /var/lib/libvirt/images/MATRIX_NSGv10
sleep 0.1
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv06*
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv07*
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv08*
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv09*
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX_ORG_MATRIX_NSGv10*

exit 0