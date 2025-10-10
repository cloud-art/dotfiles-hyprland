rclone mount google-drive:/ /mnt/drive \
  --daemon \
  --allow-other \
  --vfs-cache-mode full \
  --vfs-cache-max-size 5G \
  --vfs-cache-max-age 12h \
  --dir-cache-time 5s \
  --attr-timeout 1s \
  --poll-interval 1s \
  --log-level INFO