#!/bin/bash
CACHE_FOLDER="$HOME/.cache"
COPY_FOLDER="/home/artyushenko/my_obsidian"
CONFIG_NAME="google-drive"
REMOTE_PARENT_DIR="/Obsidian"
REMOTE_PATH="${REMOTE_PARENT_DIR}/my_obsidian"

LOCAL_BACKUP_DIR="${CACHE_FOLDER}/obsidian-backup"
REMOTE_BACKUP_DIR="${REMOTE_PARENT_DIR}/.rclone-bisync-backups"

LOGFILE="$CACHE_FOLDER/rclone-drive-sync.log"

START_BACKOFF=5
SLEEP_INTERVAL=30

# Handling arguments
RESYNC=0
for arg in "$@"; do
  if [ "$arg" = "--resync" ]; then
    RESYNC=1
  fi
done

mkdir -p "$CACHE_FOLDER"
mkdir -p "$COPY_FOLDER"
mkdir -p "$LOCAL_BACKUP_DIR"

rclone mkdir "${CONFIG_NAME}:${REMOTE_BACKUP_DIR}" >/dev/null 2>&1

RCLONE_OPTS=(--fast-list \
  --transfers=4 \
  --checkers=8 \
  --log-file="$LOGFILE" \
  --log-level=INFO \
  --backup-dir1 "$LOCAL_BACKUP_DIR" \
  --backup-dir2 "${CONFIG_NAME}:${REMOTE_BACKUP_DIR}")

if [ "$RESYNC" -eq 1 ]; then
  RCLONE_OPTS+=(--resync)
  echo "$(date --iso-8601=seconds) --resync enabled" >> "$LOGFILE"
fi

backoff=$START_BACKOFF
last_was_success=1
while true; do
  echo "$(date --iso-8601=seconds) starting rclone bisync (two-way)" >> "$LOGFILE"
  rclone bisync "$COPY_FOLDER" "${CONFIG_NAME}:${REMOTE_PATH}" "${RCLONE_OPTS[@]}"
  rc=$?
  if [ $rc -eq 0 ]; then
    echo "$(date --iso-8601=seconds) bisync succeeded" >> "$LOGFILE"
    backoff=$START_BACKOFF
    last_was_success=1
    sleep $SLEEP_INTERVAL
  else
    echo "$(date --iso-8601=seconds) bisync failed rc=$rc — retry after ${backoff}s" >> "$LOGFILE"
    if [ $last_was_success -eq 1 ]; then
      notify_error "bisync failed rc=$rc — retry after ${backoff}s"
    fi
    last_was_success=0
    sleep $backoff
    backoff=$((backoff * 2))
    [ $backoff -gt 300 ] && backoff=300
  fi
done