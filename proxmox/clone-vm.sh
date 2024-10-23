#! /usr/bin/env bash

set -exuo pipefail

TEMPLATE_ID="${1}"
VM_ID="${2}"
VM_NAME="${3}"
VM_DISK_SIZE="${4:-10G}"
VM_CORES="${5:-2}"
VM_RAM="${6:-2048}"

# Clone VM from template
qm clone ${TEMPLATE_ID} ${VM_ID} --name ${VM_NAME} -full -storage local

# Resize VM disk
qemu-img resize -f raw /var/lib/vz/images/${VM_ID}/vm-${VM_ID}-disk-0.raw ${VM_DISK_SIZE}

# Rescan disk size
qm disk rescan --vmid ${VM_ID}

# Set Memory and Cores
qm set ${VM_ID} --core 2 --memory 2048
