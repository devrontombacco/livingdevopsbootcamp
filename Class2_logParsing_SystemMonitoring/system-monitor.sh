#!/bin/bash

echo "=== System Performance Monitor ==="
echo "Time: $(date)"
echo ""

echo "=== CPU Usage ==="
top -b -n 1 | grep "Cpu(s)" | awk '{print "User: " $2 ", System: " $4 ", Idle: " $8 ", IOWait: " $10}'
echo ""

echo "=== Load Average ==="
uptime | awk -F'load average:' '{print $2}'
echo ""

echo "=== Memory Usage ==="
free -h | grep Mem | awk '{print "Total: " $2 ", Used: " $3 ", Free: " $4 ", Available: " $7}'
echo ""

echo "=== Top 5 CPU Processes ==="
ps aux --sort=-%cpu | head -6 | tail -5 | awk '{print $11, "-", $3 "%"}'
echo ""

echo "=== Top 5 Memory Processes ==="
ps aux --sort=-%mem | head -6 | tail -5 | awk '{print $11, "-", $4 "%"}'
echo ""

echo "=== Disk Usage ==="
df -h | grep -v tmpfs | grep -v devtmpfs
echo ""

echo "=== I/O Wait ==="
iostat | grep -A1 avg-cpu | tail -1 | awk '{print "IOWait: " $4 "%"}'