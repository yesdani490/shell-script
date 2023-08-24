#!/bin/sh

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo " ERROR: please run the script with root access"

fi