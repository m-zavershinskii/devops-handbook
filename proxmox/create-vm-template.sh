#! /usr/bin/env bash

# First of all download cloudinit image. For example,
# wget -q https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img

set -exuo pipefail

VM_CLOUD_IMAGE="${1}"
VM_ID="${2}"
VM_NAME="${3}"
VM_TAGS="${4}"
VM_CI_CONFIG="vendor=local:snippets/${5}"
VM_CI_USER="${6}"
VM_SCSI_DISK="local:${VM_ID}/vm-${VM_ID}-disk-0.raw"

# Create VM
qm create ${VM_ID} --name "${VM_NAME}" \
    --ostype l26 \
    --memory 1024 \
    --agent 1 \
    --balloon 0 \
    --bios seabios \
    --net0 virtio,bridge=vmbr2 \
    --cpu host \
    --socket 1 --cores 1

# Import disk into VM
qm disk import ${VM_ID} ${VM_CLOUD_IMAGE} local

# Attach SCSI disk to VM
qm set ${VM_ID} --scsihw "virtio-scsi-single" \
    --boot "order=scsi0;net0" \
    --ide2 "local:cloudinit" \
    --scsi0 "${VM_SCSI_DISK}"

# Set cloud init parameters
qm set ${VM_ID} --tags "${VM_TAGS}" \
    --cicustom "${VM_CI_CONFIG}" \
    --ciuser "${VM_CI_USER}" --ciupgrade 1 \
    --cipassword $(openssl passwd -6 "${VM_CI_USER}") \
    --sshkeys ~/.ssh/authorized_keys \
    --ipconfig0 ip=dhcp

# Update cloud init
qm cloudinit update ${VM_ID}

# Template VM
qm template ${VM_ID}
