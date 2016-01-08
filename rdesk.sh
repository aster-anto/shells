#!/bin/bash
if [ $# -ne 1 ]; then echo "Usage : rdesk host" && exit 2; fi
nohup rdesktop -g 90% $1 -5 -K -r clipboard:CLIPBOARD -r disk:share=$HOME/Share  > ~/logs/rdesktop.log 2>&1 &
