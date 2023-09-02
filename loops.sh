#!/bin/bash
DATE=$(date)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME.log

R="\e[31m"
G="\e[32m"
N="\e[0m" 

VALIDATE(){
    if [ $1 -ne 0 ]
     then echo -e "$2 is  $R not Successfully $N "
     exit 1
    else
     echo -e "$2 is installed $G Successfully $N "
    fi

}


for i in $@
 do 
  package_status=$(rpm -qa $i | cut -d'-' -f1 )
   if [ $package_status == $i ]
    then 
     echo -e " $i is already $G installed $N "
   else 
     echo -e " $i is $R not installed $N"
     echo " lets install $i"
     yum install $i -y &>>$LOGFILE
     VALIDATE $? "$i"
  fi
done 