#!/bin/bash

echo "===== Linux System Health Check ====="
echo ""
echo "Current date and time:"
date
echo ""
echo "Disk space:"
df -h /
echo ""
echo "Memory usage:"
free -h
echo ""
echo "Checking disk usage..."

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK_USAGE" -ge 80 ]; then
    echo "WARNING: Disk usage is at ${DISK_USAGE}%!"
else
    echo "Disk usage is healthy at ${DISK_USAGE}%."
fi
echo ""
echo "Health check complete!"
