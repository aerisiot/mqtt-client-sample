#!/bin/bash
################################################################################
# This script is called by gammu-smsd via 'runonreceive' setting.
#
# See the gammu-smsd configuration file (e.g. /etc/gammu-smsdrc) for details.
#

PGNAME=$(basename $0)
PGDIR=$(cd $(dirname $0); pwd)
PGROOT=$(dirname $PGDIR)

# S_TIME=`date`
# MSISDN="11835779308"
#
# PAYLOAD="$MSISDN $S_TIME - an MT-SM received: $1"
#
cd $PGROOT

# invoke a simple message to the MQ
bin/invoke_mo_echo.sh
