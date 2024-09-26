#!/bin/bash

LOG_FILE="/var/log/docker_cleanup.log"

echo "[$(date)] Удаление неиспользуемых Docker образов..." >> $LOG_FILE
docker image prune -af >> $LOG_FILE 2>&1

echo "[$(date)] Перезапуск всех контейнеров..." >> $LOG_FILE
docker-compose down && docker-compose up -d >> $LOG_FILE 2>&1

echo "[$(date)] Задание завершено." >> $LOG_FILE
