#!/bin/bash
#SCRIPT_NAME=$0
#LOGFILE_DIRECTORY=/tmp
#LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log
#DATE=$(date +%F:%H:%M:%S)

# R="\e[31m"
# G="\e[32m"
# N="\e[0m" 
# Y="\e[33m"

 DISK_USAGE=$(df -hT  | grep -vE 'tmpfs|Filesystem' )

 # DISK_USAGE_THRESHOLD=1
#IFS= Means internal field seperator is space

 while IFS= read line
 do
   echo "output: $line" 

 done  <<< $DISK_USAGE

