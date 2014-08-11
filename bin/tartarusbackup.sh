#!/bin/sh
# /usr/local/sbin/backup.sh
# Run all backup profile found in /etc/tartarus/ and pass
# command line arguments on to tartarus (e.g. -i)
# source: http://wiki.hetzner.de/index.php/Tartarus_Backup-Konfiguration
for profile in /etc/tartarus/*.conf; do
  /usr/sbin/tartarus $* "$profile"
done
