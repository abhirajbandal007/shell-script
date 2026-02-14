#!/bin/bash

<<info
This shell script will take
periodic backups
eg: ./backup.sh <source> <dest>
src /home/ubuntu/scripts
dest /home/ubuntu/backups
info

src=$1
dest=$2

timestamp=$(date '+%Y-%m-%d-%H-%M')

zip -r "$dest/backup-$timestamp.zip" $src &>/dev/null

aws s3 sync $dest s3://<bucket-name>

echo "Backup completed and uploaded to s3 successfully..."
