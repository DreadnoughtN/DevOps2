#!/bin/bash

DOCKER_COMPOSE_FILE="./docker-compose.yml"
BACKUP_DIR="/var/backups"

mkdir -p $BACKUP_DIR

DATE=$(date +"%d%m%Y")
BACKUP_FILE="$BACKUP_DIR/docker-compose-$DATE.gz"

echo "[$(date)] Бэкап файла docker-compose.yml в $BACKUP_FILE"
gzip -c $DOCKER_COMPOSE_FILE > $BACKUP_FILE

BACKUPS_COUNT=$(ls -1 $BACKUP_DIR/docker-compose-*.gz | wc -l)
if [ "$BACKUPS_COUNT" -gt 2 ]; then
    echo "[$(date)] Удаление старых бэкапов..."
    ls -1 $BACKUP_DIR/docker-compose-*.gz | head -n -2 | xargs rm
fi

echo "[$(date)] Бэкап завершен."
