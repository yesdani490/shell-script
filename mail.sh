#!/bin/bash
 TO_ADDRESS=$1
 SUBJECT=$2
 #BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
 #BODY=$(echo "$3" | sed 's/[][\/$*.^[]/\\&/g')

 BODY="$3"  # Assign the entire message to BODY

# Use BODY in the sed expression, escaping any special characters
BODY=$(echo "$BODY" | sed 's/[][\/$*.^[]/\\&/g')


 TEAM_NAME=$4
 ALERT_TYPE=$5

#echo "$BODY"
 FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/Message/$BODY/g" template.html)
 echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"
 #echo " $TO_ADDRESS $SUBJECT $BODY $TEAM_NAME $ALERT_TYPE" 