#!/bin/sh

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo " ERROR: please run the script with root access"
   exit 1
fi

yum install mysql -y

if [ $? -ne 0 ]
then
  echo "Installation of mysql is error"
else
  echo "Installaion of mysql is success"
fi