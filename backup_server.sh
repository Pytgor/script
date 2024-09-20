#!/bin/bash

# Backup Script to Remote Server using rsync

# Set variables
LOCAL_DIR=(
	"/home/arch06/ansible_wp"       # Local directory to back up
	"/home/arch06/ansible"
)
REMOTE_USER="sky"                	# Remote server username
REMOTE_SERVER="172.17.0.2"      	# Remote server IP or hostname
REMOTE_DIR="/home/sky/"           	# Remote backup directory
LOG_FILE="/var/log/backup_server.log"


touch $LOG_FILE

log_message() {
    local MESSAGE="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $MESSAGE" | tee -a "$LOG_FILE"
}


for DIR in "${LOCAL_DIR[@]}"; do
	echo "backing up $DIR"

	if rsync -avz -e "ssh -i /home/arch06/.ssh/id_rsa" --delete "$DIR/" "$REMOTE_USER@$REMOTE_SERVER:$REMOTE_DIR$(basename "$DIR")/"; then
	log_message "Backup of $DIR completed succesfully"
	
	else

		echo "Error backing up $DIR"
	fi
done

log_message "backup process finished!!!"

