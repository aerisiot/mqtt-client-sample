#!/bin/bash
################################################################################
#

PGNAME=$(basename $0)
PGDIR=$(cd $(dirname $0); pwd)
PGROOT=$(dirname $PGDIR)

if [ $# -gt 1 ]; then
    echo "Usage : $PGNAME  { msisdn }"
    echo ""
    exit 1
fi

S_TIME=`date`
MSISDN="11835779308"

if [ $# -gt 0 ]; then
    MSISDN=$1
fi

PAYLOAD="BEACON $MSISDN $S_TIME"

cd $PGROOT

echo "[gammu sendsms TEXT destination -text '$PAYLOAD']"
gammu sendsms TEXT destination -text '$PAYLOAD'
