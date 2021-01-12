#!/bin/bash
# Backup with Duplicity

if [ "`whoami`" != "root" ]; then
	echo 'Only root can run "backup"!' >&2
	exit 1
fi

#
# read the configuration file, it defines
#   * $BACKUP_MOUNT
#   * $BACKUP_CREDENTIALS
if [ -z $1 ] || [ $1 == '-h' ];
	then
		echo "Usage: backup_mount.sh PATH \n PATH is PATH for .backuprc "
		exit 2
fi

CONFIG=$1
[ -f $CONFIG ] && . $CONFIG || {
	echo "Missing configuration file $CONFIG!" >&2
	exit 2
}

#
# run scripts in /root/pre-backup-scripts when directory exists
#
if [ -d "/root/pre-backup-scripts" ]; then
	run-parts -v --regex '.sh$' /root/pre-backup-scripts
fi

export PASSPHRASE=$BACKUP_PASSWORD
HN=`hostname`

cat /root/backuppaths/*.conf | while read line 
do
echo $line
BN=`basename $line`
{% if duplicity_scheme == "rsync" %}
ssh -n $BACKUP_SSH mkdir -p $BACKUP_PATH$HN/$BN
{% endif %}
duplicity incremental --full-if-older-than 1M $line $BACKUP_CREDENTIALS$HN/$BN
rc=$?
duplicity remove-all-inc-of-but-n-full 2 --force $BACKUP_CREDENTIALS$HN/$BN
duplicity remove-all-but-n-full 4 --force $BACKUP_CREDENTIALS$HN/$BN
done
unset PASSPHRASE
exit $rc
