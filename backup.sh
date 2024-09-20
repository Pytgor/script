#!/bin/bash

# Backup Script using rsync
# This script backs up specified directories to a designated backup location.

# Set variables
SOURCE_DIRS=("/etc" "/home" "/var/www")  # Directories to back up
BACKUP_DIR="/path/to/your/backup/directory"  # Change this to your backup directory
LOG_FILE="/var/log/backup.log"           # Change this to your log file location

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform the backup
for DIR in "${SOURCE_DIRS[@]}"; do
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    BACKUP_FILE="$BACKUP_DIR/$(basename "$DIR")_$TIMESTAMP"
    
    echo "$(date +"%Y-%m-%d %H:%M:%S") - Starting backup for $DIR..." >> "$LOG_FILE"
    
    rsync -av --delete "$DIR/" "$BACKUP_FILE/" >> "$LOG_FILE" 2>&1
    
    if [ $? -eq 0 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - Backup of $DIR completed successfully!" >> "$LOG_FILE"
    else
        echo "$(date +"%Y-%m-%d %H:%M:%S") - Backup of $DIR failed!" >> "$LOG_FILE"
    fi
done

echo "$(date +"%Y-%m-%d %H:%M:%S") - Backup script execution completed." >> "$LOG_FILE"

