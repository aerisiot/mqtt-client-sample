#!/bin/bash
################################################################################
#

PGNAME=$(basename $0)
PGDIR=$(cd $(dirname $0); pwd)
PGROOT=$(dirname $PGDIR)

if [ $# -lt 1 ]; then
    echo "Usage : $PGNAME  mode  { topic }"
    echo ""
    echo "mode - publish | subscribe"
    exit 1
fi

BIN_DIR=${PGROOT}/bin
CFG_DIR=${PGROOT}/conf
LIB_DIR=${PGROOT}/lib
LOG_DIR=${PGROOT}/logs
RPT_DIR=${PGROOT}/report
RUN_DIR=${PGROOT}/

# app name
APP_NAME=SampleAsyncWait
APP_JNAME=org.eclipse.paho.sample.mqttv3app.SampleAsyncWait

ACTION_MODE=$1
TOPIC=""

if [ $# -gt 1 ]; then
    TOPIC=$2
fi


################################################################################
function start_app {

    #cd $PGDIR
    cd $PGROOT

    # default current dir and config for resource files
    CP=".:${PGROOT}/conf"
    CP="${CP}:${PGROOT}/lib/*"

    mkdir -p ${RUN_DIR}
    cd ${RUN_DIR}

#   java ${JOPTS} -cp ${CP} ${APP_JNAME} -t T6MT
#   java -cp ${CP} ${APP_JNAME} -a $ACTION_MODE -q
	if [ "$TOPIC" != "" ]; then
        java -cp ${CP} ${APP_JNAME} -a $ACTION_MODE -t $TOPIC -q
    else
        java -cp ${CP} ${APP_JNAME} -a $ACTION_MODE -q
	fi

}

(start_app)

exit 0
