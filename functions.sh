#!/bin/bash
DATE=$(date)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
VALIDATE (){

    if [ $1 -ne 0 ]
then 
    echo -e " $2  is $R error $N "
    exit 1
 else
    echo -e " $2 is $G success $N "
fi
}
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo " ERROR: please run the script with root access"
   exit 1
fi

yum install mysql -y &>>$LOGFILE
 VALIDATE $? "Installing MySQL" 


yum install postfix -y  &>>$LOGFILE

VALIDATE $? "Installing Postfix"