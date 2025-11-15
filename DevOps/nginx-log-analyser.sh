#!/bin/bash
#Author: Chris Doll

#setting variable as first argument
file="$1"

#if-then-else statement to verify if file exists, and if true, will start analysis
if [[ ! -f "$file" ]]; then
    echo "File does not exist: $file"
    exit 1
else    
#    echo "$(awk '{print}' $file)"
    echo "Top 5 IP addresses with the most requests"
    echo "$(awk '{print $1}' $file | uniq -c | sort -nr | head -n 6 | awk '{print $2, "-", $1, "requests"}')"
    echo
    echo "Top 5 most requested paths:"
    echo "$(awk '{print $7}' $file | uniq -c | sort -nr | head -n 50)"
    
    
    
    exit 0
fi











