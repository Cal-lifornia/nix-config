#!/usr/bin/env bash
gpu="0000:03:000.0"
aud="0000:03:000.1"


function bind_vfio {
  gpu_vd="$(cat /sys/bus/pci/devices/$gpu/vendor) $(cat /sys/bus/pci/devices/$gpu/device)"
  aud_vd="$(cat /sys/bus/pci/devices/$aud/vendor) $(cat /sys/bus/pci/devices/$aud/device)"

  echo $gpu > /sys/bus/pci/drivers/amdgpu/unbind
  echo $aud > /sys/bus/pci/drivers/amdgpu/unbind

  echo 1 > "/sys/bus/pci/devices/$gpu/remove" 
  echo 1 > "/sys/bus/pci/devices/$aud/remove" 

  echo 1 > "/sys/bus/pci/rescan"

  echo $gpu > /sys/bus/pci/drivers/amdgpu/unbind
  echo $aud > /sys/bus/pci/drivers/amdgpu/unbind

  echo "$gpu_vd" > /sys/bus/pci/drivers/vfio-pci/new_id
  echo "$aud_vd" > /sys/bus/pci/drivers/vfio-pci/new_id
}

function unbind_vfio {
  echo "$gpu_vd" > /sys/bus/pci/drivers/vfio-pci/remove_id
  echo "$aud_vd" > /sys/bus/pci/drivers/vfio-pci/remove_id


  echo 1 > "/sys/bus/pci/devices/$gpu/remove" 
  echo 1 > "/sys/bus/pci/devices/$aud/remove" 

  echo 1 > "/sys/bus/pci/rescan"
}
