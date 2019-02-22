#!/bin/bash
systemctl enable drbd
#systemctl start drbd
drbdadm create-md nfsdrbd && modprobe drbd && drbdadm up nfsdrbd > /tmp/drbd.log
