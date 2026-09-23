#!/bin/bash

# Variables
TARGET_DIR="./my_data"
BACKUP_DIR="./backup_folder"
DATE=$(date +%F)

echo "--- Starting System Check ---"

# Conditionals: Check disk space (simulated)
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -gt 90 ]; then
    echo "🚨 WARNING: Disk usage is critically high ($DISK_USAGE%)!"
else
    echo "✅ Disk space looks good ($DISK_USAGE% used)."
    
    # Loop: Create backup if directory doesn't exist
    if [ ! -d "$BACKUP_DIR" ]; then
        echo "📁 Backup directory not found. Creating one..."
        mkdir "$BACKUP_DIR"
    fi
    
    echo "🔄 Backing up $TARGET_DIR..."
    cp -r "$TARGET_DIR" "$BACKUP_DIR/backup_$DATE"
    echo "🎉 Backup completed successfully!"
fi
