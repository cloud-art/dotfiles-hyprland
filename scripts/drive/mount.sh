#!/bin/bash

# Safe rclone mount with basic recovery and logging.
LOG="$HOME/.cache/rclone-mount.log"
MOUNTPOINT="/mnt/drive"
CONFIG_NAME="google-drive"
REMOTE_PATH="/"

mkdir -p "$HOME/.cache"

# If mountpoint exists but is a stale FUSE mount (Transport endpoint is not connected), try to unmount it.
if mountpoint -q "$MOUNTPOINT" || grep -q " $MOUNTPOINT " /proc/mounts 2>/dev/null; then
  echo "Found existing mount entry for $MOUNTPOINT — attempting to unmount (lazy) to recover" >> "$LOG" 2>&1 || true
  # try a polite fusermount unmount first
  fusermount -uz "$MOUNTPOINT" >> "$LOG" 2>&1 || true
  sleep 0.5
  # if still present, force lazy unmount
  if grep -q " $MOUNTPOINT " /proc/mounts 2>/dev/null; then
    echo "Falling back to umount -l for $MOUNTPOINT" >> "$LOG" 2>&1 || true
    umount -l "$MOUNTPOINT" >> "$LOG" 2>&1 || true
    sleep 0.5
  fi
fi

# Ensure mount directory exists and is writable
mkdir -p "$MOUNTPOINT"

# Start rclone and write logs to a file so we can inspect failures later
rclone mount "$CONFIG_NAME":"$REMOTE_PATH" "$MOUNTPOINT" \
  --daemon \
  --vfs-cache-mode full \
  --vfs-cache-max-size 5G \
  --vfs-cache-max-age 12h \
  --dir-cache-time 5s \
  --attr-timeout 1s \
  --poll-interval 1s \
  --log-level INFO \
  --log-file "$LOG" \
  --allow-non-empty