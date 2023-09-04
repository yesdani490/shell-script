#!/bin/bash

echo "Enter a word to check palindrom:"
read WORD

echo "Entered word is: $WORD"

REVWORD=$( echo "$WORD" | rev )

if ( $WORD !ne $REVWORD )
then

  echo " $WORD is not palindrom"
else
   echo "$WORD is palindrom"
fi
