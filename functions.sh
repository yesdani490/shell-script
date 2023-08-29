#!/bin/sh

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo " ERROR: please run the script with root access"
   exit 1
fi
VALIDATE (){

    if [ $1 -ne 0 ]
then 
  echo " $2  is error "
  exit 1
 else
 echo " $2 is success "
fi
}
yum install mysql -y
 VALIDATE $? "Installing MySQL"


yum install postfix -y

VALIDATE $? "Installing Postfix"