# Download centos 7 qcow2 image
  # https://cloud.centos.org/~/images/
  # Save it as test.qcow2
  wget https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1905.qcow2c -O test.qcow2
# Resize this image
  qemu-img resize CentOS-7-x86_64-GenericCloud-1905.qcow2 30G

# Install this package to generate iso from qcow2 file
 sudo apt install  -y cloud-utils

# Create file iso
  cloud-localds config.iso config.yaml

# Create virtual machine
```sh
virt-install \
  --memory 6500 \
  --vcpus 4 \
  --name tst \
  --disk ./test.qcow2,device=disk \
  --disk ./config.iso,device=cdrom \
  --os-type Linux \
  --os-variant centos7.0 \
  --virt-type kvm \
  --graphics none \
  --network default \
  --import
```
# Restart
  # virsh --connect qemu:///system start tst

