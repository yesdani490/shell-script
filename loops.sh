#!/bin/bash
DATE=$(date)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME.log
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m" 
Y="\e[33m"

VALIDATE(){
    if [ "$1" -ne 0 ]
     then echo -e " $2 is  $R not Successfully $N "
    else
     echo -e " $2 is installed $G Successfully $N "
    fi

}


for i in $@
 do 
 if [ $USERID -ne 0 ]
then
   echo " ERROR: please run the script with root access"
   exit 1
fi
  package_status=$(rpm -qa "$i" | cut -d'-' -f1 )
   if [ $package_status != "$i" ]
   then 
     echo -e " Package $i is $R not installed $N "
     echo " lets install  Package $i "
     yum install " $i " -y &>>"$LOGFILE"
     VALIDATE $? " Installation of $i"
    else
      echo -e " $i is already $Y installed $N "
  fi
done 
# if [ -z "$package_status" ]
# then
#     # Package is not installed
#     echo -e "Package $i is $R not installed $N"
#     echo "Let's install Package $i"
#     yum install $i -y &>>"$LOGFILE"
#     VALIDATE $? "Installation of $i"
# else
#     # Package is installed
#     echo -e "$i is already $Y installed $N"
# fi
# done