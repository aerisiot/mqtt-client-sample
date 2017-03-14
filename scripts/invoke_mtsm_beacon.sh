#!/bin/bash
################################################################################
#
S_TIME=`date +%s`

echo "[gammu sendsms TEXT destination -text '$S_TIME']"
gammu sendsms TEXT destination -text '$S_TIME'
