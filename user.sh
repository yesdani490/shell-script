#!/bin/bash
echo "Please enter username"
read USERNAME

# Use the 'id' command to check if the user exists
id "$USERNAME" 

# Check the exit status of the 'id' command
if [ $? -eq 0 ]; then
  echo "User '$USERNAME' exists."

else
  echo "User '$USERNAME' does not exist so adding user."
  sudo useradd $USERNAME
fi

echo "username added is:"$USERNAME

echo "Enter Directory name"
read directory
# Check if the directory already exists
if [ -d "$directory" ]; then
  echo "The directory '$directory' already exists."
 
else
  # If it doesn't exist, create the directory
  sudo mkdir -p "$directory"

  echo "Directory created: $directory"
 
fi
