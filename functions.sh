#!/bin/bash
DATE=$(dATE)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME.log

VALIDATE (){

    if [ $1 -ne 0 ]
then 
  echo " $2  is error "
  exit 1
 else
 echo " $2 is success "
fi
}
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo " ERROR: please run the script with root access"
   exit 1
fi

yum install mysql -y &>>LOGFILE
 VALIDATE $? "Installing MySQL" 


yum install postfix -y  &>>LOGFILE

VALIDATE $? "Installing Postfix"