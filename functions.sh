#!/bin/sh

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo " ERROR: please run the script with root access"
   exit 1
fi
VALIDATE (){

    if [ $? -ne 0 ]
then 
  echo " Installation  is error "
  exit 1
 else
 echo " Installtion is success "
fi
}
yum install mysql -y
 VALIDATE $?


yum install postfix -y

VALIDATE $?