#!/bin/bash

#extract and save the idle cpu value from top output
cpu_idle=$(top -bn1 | grep "Cpu(s)" | tr -s ' ' | awk '{print $8}' | sed 's/id,//')

#subtract idle from 100 to get usage and then print out
cpu_usage=$(echo "100 - $cpu_idle" | bc)
echo "Your CPU Usage is: $cpu_usage %"
echo " "

#get RAM info from free CLI tool, then extract and save the free, used, and total memory
mem_free=$(free -h | grep "Mem:" | tr -s ' ' | awk '{print $4}' | sed 's/Gi//')
mem_used=$(free -h | grep "Mem:" | tr -s ' ' | awk '{print $3}' | sed 's/Gi//')
mem_total=$(free -h | grep "Mem:" | tr -s ' ' | awk '{print $2}' | sed 's/Gi//')

#get percentages of each from total memory and echo them out
mem_fp=$(echo "scale=3;$mem_free / $mem_total * 100" | bc -l)
mem_usp=$(echo "scale=3;$mem_used / $mem_total * 100" | bc -l)
echo "Your RAM used is $mem_usp %"
echo "Your RAM free is $mem_fp %"
echo " "
#get Disk usage stats from running df -h and save them
disk_size=$(df -h | grep "/dev/sda" | tr -s ' ' | awk '{print $2}' | sed 's/G//')
disk_used=$(df -h | grep "/dev/sda" | tr -s ' ' | awk '{print $3}' | sed 's/G//')
disk_avail=$(df -h | grep "/dev/sda" | tr -s ' ' | awk '{print $4}' | sed 's/G//')
#calculate percentages of used/free vs total
disk_usep=$(echo "scale=3;$disk_used / $disk_size * 100" | bc -l)
disk_frep=$(echo "scale=3;$disk_avail / $disk_size * 100" | bc -l)
#print disk usage percentages
echo "Your disk usage is $disk_usep %" 
echo "Your disk free is $disk_frep %"
echo " "

#get top 5 processes by CPU usage and print out
tfive_cpu=$(ps aux --sort=-%cpu | head -n 6)
echo "Top 5 processes by CPU%"
echo "$tfive_cpu"
echo " "
#get top 5 processes by MEM/RAM usage
tfive_mem=$(ps aux --sort=-%mem | head -n 6)
echo "Top 5 processes by MEM%"
echo "$tfive_mem"













