#!/bin/sh
virsh list --all

sleep 0.1

virsh destroy vm_MATRIX_NSGv06
sleep 0.1
virsh destroy vm_MATRIX_NSGv07
sleep 0.1
virsh destroy vm_MATRIX_NSGv08
sleep 0.1
virsh destroy vm_MATRIX_NSGv09
sleep 0.1
virsh destroy vm_MATRIX_NSGv10
sleep 0.1

virsh undefine vm_MATRIX_NSGv06
sleep 0.1
virsh undefine vm_MATRIX_NSGv07
sleep 0.1
virsh undefine vm_MATRIX_NSGv08
sleep 0.1
virsh undefine vm_MATRIX_NSGv09
sleep 0.1
virsh undefine vm_MATRIX_NSGv10
sleep 0.1

rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv06*
rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv07*
rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv08*
rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv09*
rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv10*

exit 0