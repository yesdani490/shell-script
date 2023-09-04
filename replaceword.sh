#!/bin/bash

input_file="$1"
old_word_or_phrase="$2"
new_word_or_phrase="$3"

# Use 'sed' to perform the replacement 
sed "s/$old_word_or_phrase/$new_word_or_phrase/g" "$input_file" > "${input_file}.new"

echo "Replacement complete. Result saved to ${input_file}.new"