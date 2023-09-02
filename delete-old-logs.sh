#!/bin/bash

 APP_LOGS=/home/centos/app-logs

 DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/home/centos/$SCRIPT_NAME-$DATE.log


FILES_TO_DELETE=$(find  $APP_LOGS -name "*.log" -type f -mtime +15)
echo "$FILES_TO_DELETE"

while read line

do 
  echo "Deleting $line" &>>$LOGFILE
  rm -rf $line
done <<< $FILES_TO_DELETE