#!/bin/bash

DATE=$(date)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m" 
Y="\e[33m"

if [ $USERID -ne 0]

then 
  echo " $R Error: Please run the script with root access $N "
  exit 1

fi
  
