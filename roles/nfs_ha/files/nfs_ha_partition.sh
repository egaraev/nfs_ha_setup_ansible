#!/bin/bash
pvcreate /dev/sda3
vgcreate nfsvg  /dev/sda3
lvcreate -l 100%FREE -n nfslv nfsvg

