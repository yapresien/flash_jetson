#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	echo "Quitting ..."
	exit 1
fi

EXT_DRIVE=$1

if [ -z "$EXT_DRIVE" ]
then
	echo "External stroage is empty!!"
	exit
fi      

if [ ! -e "$EXT_DRIVE" ]; then
    echo "$EXT_DRIVE not exists!!"
	exit
fi

if [ "$(df | grep $EXT_DRIVE | wc -l)" != "0" ]
then
	echo "External Storage has mounted. Please unmount it!!"
	exit
fi

# Mount the EXT_DRIVE as /mnt
sudo mount "$EXT_DRIVE" /mnt

# Copy over the rootfs from the EMMC flash to the external storage
sudo rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt
# We want to keep the external storage mounted for further operations. So we do not unmount it


# Setup the service to set the rootfs to point to the EXT_DRIVE
sudo cat > /etc/systemd/system/setexternalroot.service <<EOF
[Unit]
Description=Change rootfs to External ($EXT_DRIVE)
DefaultDependencies=no
Conflicts=shutdown.target
After=systemd-remount-fs.service
Before=local-fs-pre.target local-fs.target shutdown.target
Wants=local-fs-pre.target
ConditionPathExists=$EXT_DRIVE
ConditionPathExists=/etc/setexternalroot.conf
ConditionVirtualization=!container
[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/sbin/setexternalroot.sh
[Install]
WantedBy=default.target
EOF

sudo cat > /sbin/setexternalroot.sh  <<EOF
#!/bin/sh
# Runs at startup, switches rootfs to the external
EXT_DRIVE_NAME=${EXT_DRIVE}
CHROOT_PATH="/extroot"

INITBIN=/lib/systemd/systemd
EXT4_OPT="-o defaults -o errors=remount-ro -o discard"

modprobe ext4

mkdir -p \${CHROOT_PATH}
mount -t ext4 \${EXT4_OPT} \${EXT_DRIVE_NAME} \${CHROOT_PATH}

cd \${CHROOT_PATH}
/bin/systemctl --no-block switch-root \${CHROOT_PATH}

EOF

sudo chmod 777 /sbin/setexternalroot.sh
systemctl daemon-reload
sudo systemctl enable setexternalroot.service

# Copy these over to the EXT_DRIVE
sudo cp /etc/systemd/system/setexternalroot.service /mnt/etc/systemd/system/setexternalroot.service
sudo cp /sbin/setexternalroot.sh /mnt/sbin/setexternalroot.sh

# Create setexternalroot.conf which tells the service script to set the rootfs to the EXT_DRIVE
# If you want to boot from EMMC flash again, remove the file /etc/setexternalroot.conf from the EMMC flash.
sudo touch /etc/setexternalroot.conf
echo "Service to set the rootfs to the $EXT_DRIVE installed."
sync
echo "Make sure that you have copied the rootfs to $EXT_DRIVE."
echo "Reboot for changes to take effect."

