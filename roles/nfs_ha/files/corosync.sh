#!/bin/bash
file="/etc/corosync/corosync.conf"
if [ -f "$file" ]
then
	echo y | cp /tmp/corosync.conf /etc/corosync/
	echo y | crontab -r
	systemctl restart corosync
	systemctl enable corosync
	systemctl enable pacemaker
        pcs cluster stop --all && pcs cluster start --all
else
	echo "Cluster is not configured yet, kurwa"
fi

