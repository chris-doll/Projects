#!/bin/bash

#extract and save the idle cpu value from top output
cpu_idle=$(top -bn1 | grep "Cpu(s)" | tr -s ' ' | awk '{print $8}' | sed 's/id,//')

#subtract idle from 100 to get usage and then print out
cpu_usage=$(echo "100 - $cpu_idle" | bc)
echo "Your CPU Usage is: $cpu_usage %"

#get RAM info from free CLI tool, then extract and save the free, used, and total memory
mem_free=$(free -h | grep "Mem:" | tr -s ' ' | awk '{print $4}' | sed 's/Gi//')
mem_used=$(free -h | grep "Mem:" | tr -s ' ' | awk '{print $3}' | sed 's/Gi//')
mem_total=$(free -h | grep "Mem:" | tr -s ' ' | awk '{print $2}' | sed 's/Gi//')

#get percentages of each from total memory and echo them out
mem_fp=$(echo "scale=3;$mem_free / $mem_total * 100" | bc -l)
mem_usp=$(echo "scale=3;$mem_used / $mem_total * 100" | bc -l)
echo "Your RAM used is $mem_usp %"
echo "Your RAM free is $mem_fp %"



















