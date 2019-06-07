virsh list --all

virsh destroy vm_NSG-C_1
virsh destroy vm_NSG-C_2
virsh destroy vm_NSG-C_3
virsh destroy vm_NSG-C_4
virsh destroy vm_NSG-E_1
virsh destroy vm_NSG-E_2
virsh destroy vm_NSG-E200_1
virsh destroy vm_NSG-E200_2
virsh destroy vm_NSG-E200_3
virsh destroy vm_NSG-E200_4
virsh destroy vm_NSG-E300_1
virsh destroy vm_NSG-E300_2
virsh destroy vm_NSG-X200_1
virsh destroy vm_NSG-X200_2
virsh destroy vm_NSG-X_1
virsh destroy vm_NSG-X_2
virsh destroy vm_NSG-X_3
virsh destroy vm_NSG-X_4
virsh destroy vm_NSG-E206_1
virsh destroy vm_NSG-E206_2
virsh destroy vm_NSG-E306_1
virsh destroy vm_NSG-E306_2
virsh destroy vm_NSG-E202_1
virsh destroy vm_NSG-E202_2
virsh list --all

cd /var/lib/libvirt/images/vm_NSG-C_1
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-C_2
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-C_3
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-C_4
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E_1
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E_2
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E200_1
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E200_2
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E200_3
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E200_4
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E300_1
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E300_2
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-X200_1
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-X200_2
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-X_1
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-X_2
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-X_3
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-X_4
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E206_1
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E206_2
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E306_1
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E306_2
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E202_1
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .
cd /var/lib/libvirt/images/vm_NSG-E202_2
cp /SharedNFS/ISOs-and-Software/usefull_images/Ansible/lan-vm.qcow2 .

virsh start vm_NSG-C_1
virsh start vm_NSG-C_2
virsh start vm_NSG-C_3
virsh start vm_NSG-C_4
virsh start vm_NSG-E_1
virsh start vm_NSG-E_2
virsh start vm_NSG-E200_1
virsh start vm_NSG-E200_2
virsh start vm_NSG-E200_3
virsh start vm_NSG-E200_4
virsh start vm_NSG-E300_1
virsh start vm_NSG-E300_2
virsh start vm_NSG-X200_1
virsh start vm_NSG-X200_2
virsh start vm_NSG-X_1
virsh start vm_NSG-X_2
virsh start vm_NSG-X_3
virsh start vm_NSG-X_4
virsh start vm_NSG-E206_1
virsh start vm_NSG-E206_2
virsh start vm_NSG-E306_1
virsh start vm_NSG-E306_2
virsh start vm_NSG-E202_1
virsh start vm_NSG-E202_2

virsh list --all