#!/bin/bash
 TO_ADDRESS=$1
 SUBJECT=$2
 BODY=$3
 TEAM_NAME=$4
 ALERT_TYPE=$5

 #echo " ALL args: $*@"
 echo "$BODY" | mail -s "$SUBJECT" "$TO_ADDRESS"
 echo " $TO_ADDRESS $SUBJECT $BODY $TEAM_NAME $ALERT_TYPE"