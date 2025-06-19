#!/bin/bash

#Author: Jishnu
#Description: Simple System Health Checkup Script

LOGFILE="/var/log/system-health-$(date +%F).log"
HOSTNAME=$(hostname)
DATE=$(date)

{
echo "====================================================================================="
echo "System Health Report for $HOSTNAME"
echo "Generated on: $DATE"
echo "====================================================================================="

#Disk usage
echo -e "\nDisk Usgae:"
printf "%-20s %-10s %-10s %-10s %-6s %-s\n" "Filesystem" "Size" "Used" "Avail" "Use%" "Mounted on"
df -h --output=source,size,used,avail,pcent,target | tail -n +2

#CPU Load
echo -e "\nCPU Load (1/5/15 min average):"
uptime | awk -F'load average:' '{ print " " $2}'

#Memory Usage
echo -e "\nMemory Usage:"
free -h | awk 'NR==1 || /Mem|Swap/ { printf " %-10s %-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5, $6 }'

#Failed Services
echo -e "\nFailed System Services"
FAILED=$(systemctl --failed --no-legend)
if [ -z "$FAILED" ]; then
	echo " No failed services. "
else
	echo "$FAILED" | while read -r line; do
		echo " $line"
	done
fi

#Top 5 Memory-Consuming Process
echo -e "\nTop 5 Memory Consuming Process:"
ps -eo user,pid,%cpu,%mem,command --sort=-%mem | head -n 6 | \
awk '{ printf " %-10s %-6s %-6s %-6s %-s\n", $1, $2, $3, $4, substr($0, index($0,$5), 60)}'

#Top 5 CPU-Consuming Process
echo -e "\nTop 5 CPU Consuming Processes:"
ps -eo user,pid,%cpu,%mem,command --sort=-%cpu | head -n 6 | \
awk '{ printf " %-10s %-6s %-6s %-6s %-s\n", $1, $2, $3, $4, substr($0, index($0,$5), 60) }'

#Uptime
echo -e "\nSystem Uptime:"
echo " $(uptime -p)"

#Package Updates
echo -e "\nAvaliable Package Updates:"
if command -v apt &> /dev/null; then
	UPDATES=$(apt list --upgradable 2>/dev/null | grep -v "Listing...")
	if [ -z "$UPDATES" ]; then
		echo " System is uptodate!!!! "
	else
		echo "$UPDATES" | awk '{ print " " $0 }'
	fi
elif command -v dnf &> /dev/null; then
	dnf check-update || echo " system is upto date "
elif command -v yum &> /dev/null; then
	yum check-update || echo " system is upto date "
else
	echo "Packege manager not supported"
fi

echo -e "\nEnd of Report"

} > "$LOGFILE"

#Optional: Send report via mail ( if mail is configured )

