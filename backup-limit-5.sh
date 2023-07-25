#!/bin/env bash

PROJECT_DIR=$1
BACKUP_DIR=$PROJECT_DIR/BACKUPS


if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p $BACKUP_DIR;
fi

echo $(date +%Y-%m-%d-%H:%M:%S) " backup created" >> $BACKUP_DIR/backup.log

wp db export - | gzip > $BACKUP_DIR/db_backup-$(date +%Y-%m-%d-%H%M%S).sql.gz

echo $(date +%Y-%m-%d-%H:%M:%S) " backup was successfully created" >> $BACKUP_DIR/backup.log

CURRENT_NUB=$(ls $BACKUP_DIR | wc -l)

if [ $CURRENT_NUB -gt 6 ]; then
    find $BACKUP_DIR -type f -iname '*.sql.gz' -printf "%T@ %Tc %p\n" | sort | head -n $(($CURRENT_NUB - 6)) | xargs rm -f
	
	echo $(date +%Y-%m-%d-%H:%M:%S) " the oldest backup file has been deleted" >> $BACKUP_DIR/backup.log
    # find $BACKUP_DIR -type f -iname '*.sql.gz' -printf "%T@ %Tc %p\n" | sort | head -n $(($CURRENT_NUB - 5))
fi

