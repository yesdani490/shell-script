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

 DISK_USAGE_THRESHOLD=1
 message=""
#IFS= Means internal field seperator is space

 while IFS= read line
 do
   usage=$(echo $line | awk '{print $6f}'| cut -d % -f1)
   partition=$(echo $line | awk '{print $1f}')
  
   if [ $usage -gt $DISK_USAGE_THRESHOLD ]
   then 
     message+="High Disk Usage on $partition:$usage"$'\n'
    fi
 done  <<< "$DISK_USAGE"

echo -e "message: $message"

#echo "$message $(date)" | mail -s "High Disk Usage" yesdaniece@gmail.com

sh mail.sh yesdaniece@gmail.com "High Disk Usage" "$message" "DevOps Team" "High Disk Usage"