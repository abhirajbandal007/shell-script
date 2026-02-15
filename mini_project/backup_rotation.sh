#!/bin/bash

#########################################################################
# Script Name: folder_backup.sh
# Description: 
#   - Takes backup of a source directory
#   - Compresses it into a timestamped zip file
#   - Stores backup in destination directory
#   - Deletes backups older than 7 days (rotation policy)
#
# Usage:
#   ./folder_backup.sh /path/to/source /path/to/destination
#
# Example:
#   ./folder_backup.sh /var/www/html /backup
#
# Author: DevOps Best Practice Script
#########################################################################

# Exit immediately if a command exits with non-zero status
set -e

############################
# Function: print_usage
# Purpose : Display usage information
############################
print_usage() {
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
}

############################
# Function: validate_inputs
# Purpose : Validate source and destination directories
############################
validate_inputs() {
    # Check if both arguments are provided
    if [ "$#" -ne 2 ]; then
        echo "ERROR: Invalid number of arguments."
        print_usage
    fi

    SOURCE_DIR="$1"
    DEST_DIR="$2"

    # Check if source directory exists
    if [ ! -d "$SOURCE_DIR" ]; then
        echo "ERROR: Source directory does not exist: $SOURCE_DIR"
        exit 1
    fi

    # Create destination directory if it does not exist
    if [ ! -d "$DEST_DIR" ]; then
        echo "Destination directory does not exist. Creating: $DEST_DIR"
        mkdir -p "$DEST_DIR"
    fi
}

############################
# Function: create_backup
# Purpose : Create timestamped zip backup
############################
create_backup() {

    # Generate timestamp (YYYY-MM-DD_HH-MM-SS)
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

    # Extract folder name from source path
    FOLDER_NAME=$(basename "$SOURCE_DIR")

    # Define backup file name
    BACKUP_FILE="${DEST_DIR}/${FOLDER_NAME}_${TIMESTAMP}.zip"

    echo "Starting backup of $SOURCE_DIR"
    echo "Backup file: $BACKUP_FILE"

    # Create zip archive recursively (-r)
    zip -r "$BACKUP_FILE" "$SOURCE_DIR" > /dev/null

    echo "Backup completed successfully."
}

############################
# Function: rotate_backups
# Purpose : Delete backup files older than 7 days
############################
rotate_backups() {

    echo "Applying 7-day rotation policy..."

    # Find and delete .zip files older than 7 days
    find "$DEST_DIR" -type f -name "*.zip" -mtime +7 -delete


    echo "Rotation completed."
}

############################
# Main Execution
############################

validate_inputs "$@"
create_backup
rotate_backups

echo "Backup process finished successfully."

