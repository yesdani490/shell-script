#!/bin/bash
echo "Please enter username"
read USERNAME

# Use the 'id' command to check if the user exists
id "$USERNAME" 

# Check the exit status of the 'id' command
if [ $? -eq 0 ]; then
  echo "User '$USERNAME' exists."
  exit 1
else
  echo "User '$USERNAME' does not exist ."
  useradd $USERNAME
fi

echo "username  is:"$USERNAME
