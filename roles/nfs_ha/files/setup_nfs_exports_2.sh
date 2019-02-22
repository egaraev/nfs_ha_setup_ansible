#!/bin/bash
volumes=$1
clients=$2

nfs ()
{
    volumes=$(echo $volumes | sed 's/,/ /g')
    clients=$(echo $clients | sed 's/,/ /g')
    clients_allow=
    for client in $clients; do
        clients_allow="$clients_allow $client(rw,sync,no_subtree_check,no_root_squash)"
    done
    exports=/etc/exports
    mv -f $exports $exports.old
    touch $exports
    nfs_main_directory=/var/nfs
    mkdir -p $nfs_main_directory
    for volume in $volumes; do
        vol_directory=$nfs_main_directory/$volume
        rm -rf $vol_directory
        mkdir $vol_directory
        cat << EOT >> $exports
$vol_directory $clients_allow
EOT
    done
}

nfs  

