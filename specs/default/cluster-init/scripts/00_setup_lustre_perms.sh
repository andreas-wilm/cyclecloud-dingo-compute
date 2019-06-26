#!/bin/bash

# Poor man's way of setting up permissions for the Lustre share:
# - Create a lustre group with gid $GID
# - Add cycleadmin to that group
# - Make mountpoint group writable
# - It would have been even easier to chmod 777 $MOUNTPOINT 

set -ex

MOUNTPOINT=/lustre
GID=10000

if ! grep -qw $GID /etc/group; then
  groupadd -g $GID lustre
  usermod -a -G lustre cycleadmin
fi

if mount | grep -q $MOUNTPOINT; then
    gid=$(stat -c "%g" $MOUNTPOINT)
    if [ $gid != $GID ]; then
        usermod -a -G lustre cycleadmin
        groupadd -g $GID lustre
    fi

    rights=$(stat -c "%a" $MOUNTPOINT)
    if [ $rights != 775 ]; then
        chmod 775 $MOUNTPOINT
    fi
else
    echo "WARNING: $MOUNTPOINT not mounted yet. Not fixing permissions" >&2
fi


