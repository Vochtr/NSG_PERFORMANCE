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
virsh destroy vm_MATRIX_NSGv11
sleep 0.1
virsh destroy vm_MATRIX_NSGv12
sleep 0.1
virsh destroy vm_MATRIX_NSGv13
sleep 0.1
virsh destroy vm_MATRIX_NSGv14
sleep 0.1
virsh destroy vm_MATRIX_NSGv15
sleep 0.1
virsh destroy vm_MATRIX_NSGv16
sleep 0.1
virsh destroy vm_MATRIX_NSGv17
sleep 0.1
virsh destroy vm_MATRIX_NSGv18
sleep 0.1
virsh destroy vm_MATRIX_NSGv19
sleep 0.1
virsh destroy vm_MATRIX_NSGv20
sleep 0.1
virsh destroy vm_MATRIX_NSGv21
sleep 0.1
virsh destroy vm_MATRIX_NSGv22
sleep 0.1
virsh destroy vm_MATRIX_NSGv23
sleep 0.1
virsh destroy vm_MATRIX_NSGv24
sleep 0.1
virsh destroy vm_MATRIX_NSGv25
sleep 0.1
virsh destroy vm_MATRIX_NSGv26
sleep 0.1
virsh destroy vm_MATRIX_NSGv27
sleep 0.1
virsh destroy vm_MATRIX_NSGv28
sleep 0.1
virsh destroy vm_MATRIX_NSGv29
sleep 0.1
virsh destroy vm_MATRIX_NSGv30
sleep 0.1
virsh destroy vm_MATRIX_NSGv31
sleep 0.1
virsh destroy vm_MATRIX_NSGv32
sleep 0.1
virsh destroy vm_MATRIX_NSGv33
sleep 0.1
virsh destroy vm_MATRIX_NSGv34
sleep 0.1
virsh destroy vm_MATRIX_NSGv35
sleep 0.1
virsh destroy vm_MATRIX_NSGv36
sleep 0.1
virsh destroy vm_MATRIX_NSGv37
sleep 0.1
virsh destroy vm_MATRIX_NSGv38
sleep 0.1
virsh destroy vm_MATRIX_NSGv39
sleep 0.1
virsh destroy vm_MATRIX_NSGv40
sleep 0.1
virsh destroy vm_MATRIX_NSGv41
sleep 0.1
virsh destroy vm_MATRIX_NSGv42
sleep 0.1
virsh destroy vm_MATRIX_NSGv43
sleep 0.1
virsh destroy vm_MATRIX_NSGv44
sleep 0.1
virsh destroy vm_MATRIX_NSGv45
sleep 0.1
virsh destroy vm_MATRIX_NSGv46
sleep 0.1
virsh destroy vm_MATRIX_NSGv47
sleep 0.1
virsh destroy vm_MATRIX_NSGv48
sleep 0.1
virsh destroy vm_MATRIX_NSGv49
sleep 0.1
virsh destroy vm_MATRIX_NSGv50
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
virsh undefine vm_MATRIX_NSGv11
sleep 0.1
virsh undefine vm_MATRIX_NSGv12
sleep 0.1
virsh undefine vm_MATRIX_NSGv13
sleep 0.1
virsh undefine vm_MATRIX_NSGv14
sleep 0.1
virsh undefine vm_MATRIX_NSGv15
sleep 0.1
virsh undefine vm_MATRIX_NSGv16
sleep 0.1
virsh undefine vm_MATRIX_NSGv17
sleep 0.1
virsh undefine vm_MATRIX_NSGv18
sleep 0.1
virsh undefine vm_MATRIX_NSGv19
sleep 0.1
virsh undefine vm_MATRIX_NSGv20
sleep 0.1
virsh undefine vm_MATRIX_NSGv21
sleep 0.1
virsh undefine vm_MATRIX_NSGv22
sleep 0.1
virsh undefine vm_MATRIX_NSGv23
sleep 0.1
virsh undefine vm_MATRIX_NSGv24
sleep 0.1
virsh undefine vm_MATRIX_NSGv25
sleep 0.1
virsh undefine vm_MATRIX_NSGv26
sleep 0.1
virsh undefine vm_MATRIX_NSGv27
sleep 0.1
virsh undefine vm_MATRIX_NSGv28
sleep 0.1
virsh undefine vm_MATRIX_NSGv29
sleep 0.1
virsh undefine vm_MATRIX_NSGv30
sleep 0.1
virsh undefine vm_MATRIX_NSGv31
sleep 0.1
virsh undefine vm_MATRIX_NSGv32
sleep 0.1
virsh undefine vm_MATRIX_NSGv33
sleep 0.1
virsh undefine vm_MATRIX_NSGv34
sleep 0.1
virsh undefine vm_MATRIX_NSGv35
sleep 0.1
virsh undefine vm_MATRIX_NSGv36
sleep 0.1
virsh undefine vm_MATRIX_NSGv37
sleep 0.1
virsh undefine vm_MATRIX_NSGv38
sleep 0.1
virsh undefine vm_MATRIX_NSGv39
sleep 0.1
virsh undefine vm_MATRIX_NSGv40
sleep 0.1
virsh undefine vm_MATRIX_NSGv41
sleep 0.1
virsh undefine vm_MATRIX_NSGv42
sleep 0.1
virsh undefine vm_MATRIX_NSGv43
sleep 0.1
virsh undefine vm_MATRIX_NSGv44
sleep 0.1
virsh undefine vm_MATRIX_NSGv45
sleep 0.1
virsh undefine vm_MATRIX_NSGv46
sleep 0.1
virsh undefine vm_MATRIX_NSGv47
sleep 0.1
virsh undefine vm_MATRIX_NSGv48
sleep 0.1
virsh undefine vm_MATRIX_NSGv49
sleep 0.1
virsh undefine vm_MATRIX_NSGv50
sleep 0.1

rm -fR /var/lib/libvirt/images/vm_MATRIX*

exit 0