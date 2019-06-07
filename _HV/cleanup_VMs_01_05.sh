#!/bin/sh
virsh list --all

sleep 0.1

virsh destroy vm_MATRIX_NSGv01
sleep 0.1
virsh destroy vm_MATRIX_NSGv02
sleep 0.1
virsh destroy vm_MATRIX_NSGv03
sleep 0.1
virsh destroy vm_MATRIX_NSGv04
sleep 0.1
virsh destroy vm_MATRIX_NSGv05
sleep 0.1

virsh undefine vm_MATRIX_NSGv01
sleep 0.1
virsh undefine vm_MATRIX_NSGv02
sleep 0.1
virsh undefine vm_MATRIX_NSGv03
sleep 0.1
virsh undefine vm_MATRIX_NSGv04
sleep 0.1
virsh undefine vm_MATRIX_NSGv05
sleep 0.1

rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv01*
rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv02*
rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv03*
rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv04*
rm -fR /var/lib/libvirt/images/vm_MATRIX_NSGv05*

exit 0