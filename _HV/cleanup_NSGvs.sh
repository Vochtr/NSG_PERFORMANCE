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
virsh destroy MATRIX_NSGv11
sleep 0.1
virsh destroy MATRIX_NSGv12
sleep 0.1
virsh destroy MATRIX_NSGv13
sleep 0.1
virsh destroy MATRIX_NSGv14
sleep 0.1
virsh destroy MATRIX_NSGv15
sleep 0.1
virsh destroy MATRIX_NSGv16
sleep 0.1
virsh destroy MATRIX_NSGv17
sleep 0.1
virsh destroy MATRIX_NSGv18
sleep 0.1
virsh destroy MATRIX_NSGv19
sleep 0.1
virsh destroy MATRIX_NSGv20
sleep 0.1
virsh destroy MATRIX_NSGv21
sleep 0.1
virsh destroy MATRIX_NSGv22
sleep 0.1
virsh destroy MATRIX_NSGv23
sleep 0.1
virsh destroy MATRIX_NSGv24
sleep 0.1
virsh destroy MATRIX_NSGv25
sleep 0.1
virsh destroy MATRIX_NSGv26
sleep 0.1
virsh destroy MATRIX_NSGv27
sleep 0.1
virsh destroy MATRIX_NSGv28
sleep 0.1
virsh destroy MATRIX_NSGv29
sleep 0.1
virsh destroy MATRIX_NSGv30
sleep 0.1
virsh destroy MATRIX_NSGv31
sleep 0.1
virsh destroy MATRIX_NSGv32
sleep 0.1
virsh destroy MATRIX_NSGv33
sleep 0.1
virsh destroy MATRIX_NSGv34
sleep 0.1
virsh destroy MATRIX_NSGv35
sleep 0.1
virsh destroy MATRIX_NSGv36
sleep 0.1
virsh destroy MATRIX_NSGv37
sleep 0.1
virsh destroy MATRIX_NSGv38
sleep 0.1
virsh destroy MATRIX_NSGv39
sleep 0.1
virsh destroy MATRIX_NSGv40
sleep 0.1
virsh destroy MATRIX_NSGv41
sleep 0.1
virsh destroy MATRIX_NSGv42
sleep 0.1
virsh destroy MATRIX_NSGv43
sleep 0.1
virsh destroy MATRIX_NSGv44
sleep 0.1
virsh destroy MATRIX_NSGv45
sleep 0.1
virsh destroy MATRIX_NSGv46
sleep 0.1
virsh destroy MATRIX_NSGv47
sleep 0.1
virsh destroy MATRIX_NSGv48
sleep 0.1
virsh destroy MATRIX_NSGv49
sleep 0.1
virsh destroy MATRIX_NSGv50
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
virsh undefine MATRIX_NSGv11
sleep 0.1
virsh undefine MATRIX_NSGv12
sleep 0.1
virsh undefine MATRIX_NSGv13
sleep 0.1
virsh undefine MATRIX_NSGv14
sleep 0.1
virsh undefine MATRIX_NSGv15
sleep 0.1
virsh undefine MATRIX_NSGv16
sleep 0.1
virsh undefine MATRIX_NSGv17
sleep 0.1
virsh undefine MATRIX_NSGv18
sleep 0.1
virsh undefine MATRIX_NSGv19
sleep 0.1
virsh undefine MATRIX_NSGv20
sleep 0.1
virsh undefine MATRIX_NSGv21
sleep 0.1
virsh undefine MATRIX_NSGv22
sleep 0.1
virsh undefine MATRIX_NSGv23
sleep 0.1
virsh undefine MATRIX_NSGv24
sleep 0.1
virsh undefine MATRIX_NSGv25
sleep 0.1
virsh undefine MATRIX_NSGv26
sleep 0.1
virsh undefine MATRIX_NSGv27
sleep 0.1
virsh undefine MATRIX_NSGv28
sleep 0.1
virsh undefine MATRIX_NSGv29
sleep 0.1
virsh undefine MATRIX_NSGv30
sleep 0.1
virsh undefine MATRIX_NSGv31
sleep 0.1
virsh undefine MATRIX_NSGv32
sleep 0.1
virsh undefine MATRIX_NSGv33
sleep 0.1
virsh undefine MATRIX_NSGv34
sleep 0.1
virsh undefine MATRIX_NSGv35
sleep 0.1
virsh undefine MATRIX_NSGv36
sleep 0.1
virsh undefine MATRIX_NSGv37
sleep 0.1
virsh undefine MATRIX_NSGv38
sleep 0.1
virsh undefine MATRIX_NSGv39
sleep 0.1
virsh undefine MATRIX_NSGv40
sleep 0.1
virsh undefine MATRIX_NSGv41
sleep 0.1
virsh undefine MATRIX_NSGv42
sleep 0.1
virsh undefine MATRIX_NSGv43
sleep 0.1
virsh undefine MATRIX_NSGv44
sleep 0.1
virsh undefine MATRIX_NSGv45
sleep 0.1
virsh undefine MATRIX_NSGv46
sleep 0.1
virsh undefine MATRIX_NSGv47
sleep 0.1
virsh undefine MATRIX_NSGv48
sleep 0.1
virsh undefine MATRIX_NSGv49
sleep 0.1
virsh undefine MATRIX_NSGv50
sleep 0.1

rm -fR /var/lib/libvirt/images/MATRIX*
sleep 0.1
rm -fR /var/lib/libvirt/images/zfbisos/MATRIX*

exit 0