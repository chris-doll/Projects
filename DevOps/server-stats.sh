#!/bin/bash

cpu_idle=$(top -bn1 | grep "Cpu(s)" | tr -s ' ' | awk '{print $8}' | sed 's/id,//')
cpu_usage=$(echo "100 - $cpu_idle" | bc)
echo "Your CPU Usage is: $cpu_usage"

