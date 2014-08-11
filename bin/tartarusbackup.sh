#!/bin/sh
# /usr/local/sbin/tartarusbackup.sh
# Run all backup configs wtih specified profile directory under the base dir
# based on: http://wiki.hetzner.de/index.php/Tartarus_Backup-Konfiguration

PROFILEBASEDIR="/etc/tartarus"
TARTARUSBIN="/usr/sbin/tartarus"

# parameter count must equals two ($1 = backuptype, $2 = profile directory)
if [ $# -ne 2 ]; then
  echo "usage: $0 full|inc profile"
  exit 1
fi

# set profile directory and test if exists and accessable
PROFILEDIR="$PROFILEBASEDIR/${2}"
if [ ! -d "$PROFILEDIR" ]; then
  echo "profile directory isn't accessable or doesn't exist!"
  exit 1
fi

# execute tartarus with every configfile in profile directory
for config in $PROFILEDIR/*.conf; do

  # test if fill or incremental backup shall performed 
  if [ "$1" = "inc" -o "$1" = "i" -o "$1" = "-i" ]; then
    $TARTARUSBIN -i "$config"
  else
    $TARTARUSBIN "$config"
  fi

done

exit 0
