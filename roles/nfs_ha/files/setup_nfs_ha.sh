#!/bin/bash
pcs resource create nfsshare Filesystem device=/dev/drbd0 directory=/var/nfs fstype=xfs --group nfsgrp
pcs resource create nfsd nfsserver nfs_shared_infodir=/var/nfs/nfsinfo --group nfsgrp
pcs resource create nfsip IPaddr2 ip=192.168.10.20 cidr_netmask=32 --group nfsgrp
pcs cluster start --all

