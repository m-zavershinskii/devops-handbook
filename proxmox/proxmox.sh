#! /usr/bin/env bash

# export CUSTOM_USER_NAME=ubuntu
# export CUSTOM_USER_PASSWORD=password

# qm create 107 --name "ubuntu-2404-cloudinit-template" \
#     --ostype l26 \
#     --memory 1024 \
#     --agent 1 \
#     --balloon 0 \
#     --bios seabios \
#     --net0 virtio,bridge=vmbr2 \
#     --cpu host \
#     --socket 1 \
#     --cores 1

# qm disk import 107 noble-server-cloudimg-amd64.img local

# qm set 107 --scsihw "virtio-scsi-single" --scsi0 "local:107/vm-107-disk-0.raw" --boot "order=scsi0;net0" --ide2 "local:cloudinit"

# qm set 107 --cicustom "vendor=local:snippets/vendor.yml" \
#     --tags "ubuntu-template,24.04,cloudinit" \
#     --ciuser $CUSTOM_USER_NAME --ciupgrade 1 \
#     --cipassword $(openssl passwd -6 $CUSTOM_USER_PASSWORD) \
#     --sshkeys ~/.ssh/authorized_keys \
#     --ipconfig0 ip=dhcp

# qm cloudinit update 107

# qm template 107

# qm clone 107 108 --name ubuntu-2404-test -full -storage local
# qm set 108 --core 2 --memory 2048
# qm start 108
