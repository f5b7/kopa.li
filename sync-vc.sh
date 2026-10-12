#!/bin/bash

# make sure $PWD is the directory of this script
if [[ "$0" == /* ]]; then
  cd $(dirname $0)
else
  cd $(dirname $PWD/$0)
fi

# sync depending on environment
if [[ "$HOME" == "/home/msa" ]]; then
  echo "Syncing from $HOME/f5b7/visualcube/local/vc/ to $PWD/vc/"
  rsync -rt --delete $HOME/f5b7/visualcube/local/vc/ $PWD/vc/
elif [[ "$HOME" == *com.termux* ]]; then
  echo "Syncing from /storage/emulated/0/Autosync/🧩/KoPaLi/kopa.li/vc/ to $PWD/vc/"
#  rsync -rt --delete /storage/emulated/0/Autosync/🧩/KoPaLi/kopa.li/vc/ $PWD/vc/
else
  echo "ERROR: Unknown environment."
  exit 1
fi
