***
    SCRIPT CREATE VM SCRIPT BASH
***

***
    File of config qemu : 
        /etc/libvirt/qemu.conf
***        


#!/bin/bash
# vm-install1.sh

# Local path to hte iso
iso=/home/seb/isos/debian-testing-amd64-DVD-1.iso
#domain type = 'kvm'
# Stop and undefined the VM
#/bin/virsh destroy $1; /bin/virsh undefine $1 -- remove-all-storage

#graphical console
#via local ISO
sudo virt-install \
--connect qemu:///system \
--virt-type kvm \
--check path_in_use=off \
--name=$1 \
--disk path=/var/lib/libvirt/images/$1.img,size=8 \
--ram=2048 \
--vcpus=2 \
--os-variant=debian12 \
--graphics vnc \
--console pty,target_type=serial \
--location=$iso 
#--cdrom $iso
#domain
