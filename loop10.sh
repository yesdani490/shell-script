#!/bin/bash

DATE=$(date %+F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m" 
Y="\e[33m"

VALIDATE(){
   if [ $1 -ne 0 ];
      then
        echo -e "Installing $2....$R Failure $N"
        exit 1
      else 
      echo -e "Installing  $2 .... $G Success $N"
   fi
}

if [ $USERID -ne 0 ];

then 
  echo -e " $R Error::: Please run the script with root access $N "
  exit 1

fi
  
for i in "$@"
do 
 yum list installed $i &>>LOGFILE

  if [ $? -ne 0 ]
   then 
   echo " $i is not installed, lets install it"
    yum install $i -y &>>$LOGFILE
    VALIDATE $? "$i"
  else
    echo -e " $Y $i  is alreasy intalled $N "
 fi

done
