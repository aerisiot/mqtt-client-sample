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

TOPIC="T6MO/echo"
S_TIME=`date`
MSISDN="11835779308"

if [ $# -gt 0 ]; then
    MSISDN=$1
fi

PAYLOAD="$MSISDN $S_TIME"

cd $PGROOT

echo $PAYLOAD | bin/start_sampleAsyncWait.sh publish $TOPIC
