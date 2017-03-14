#!/bin/bash
################################################################################
#

PGNAME=$(basename $0)
PGDIR=$(cd $(dirname $0); pwd)
PGROOT=$(dirname $PGDIR)

if [ $# -lt 1 ]; then
    echo "Usage : $PGNAME  command  { msisdn }"
    echo ""
    echo "command - AERFRAME | BEACON"
    echo ""
    exit 1
fi

TOPIC="T6MO/command"
MSISDN="11835779308"

COMMAND=$1

if [ $# -gt 1 ]; then
    MSISDN=$2
fi

PAYLOAD="$COMMAND $MSISDN"

cd $PGROOT

echo $PAYLOAD | bin/start_sampleAsyncWait.sh publish $TOPIC
