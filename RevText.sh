#!/bin/bash
echo "Enter the file characters to be reversed"
read INPUTFILE

REVSTRING=$( cat $INPUTFILE | rev )

echo "$REVSTRING"