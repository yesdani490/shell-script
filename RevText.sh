#!/bin/bash

INPUTFILE=$1

REVSTRING=$( $INPUTFILE | rev )

echo "$REVSTRING >> revfile.txt"