#!/bin/bash
echo "Enter the file characters to be reversed"
read INPUTFILE

REVSTRING=$( $INPUTFILE | rev )

echo "$REVSTRING"