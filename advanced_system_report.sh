#!/bin/bash

echo "=============================="
echo "   ADVANCED SYSTEM REPORT"
echo "=============================="

echo "1. DATE AND TIME"
date
echo ""

echo "2. CPU LOAD AVERAGE"
uptime | awk -F'load average:' '{ print $2 }'
echo ""

echo "3. TOP 5 PROCESSES BY CPU"
# -e (all processes) -o (custom columns) --sort (descending cpu)
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""

echo "4. DISK & MEMORY"
df -h | grep '^/dev/'
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
echo "=============================="
________________________________________
