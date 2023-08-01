#!/bin/bash

COLOR='\033[1;34m'
NC='\033[0m' # No Color

# Percentage of RAM used
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

# Percentage of disk spce used
df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'

# CPU % used
top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'

# for each directory in ~/ see if there is a logs/ directory, if so, print the directory name and the contents of the logs/ directory with ls -lh
for d in ~/*/; do
    [[ -d "${d}logs/" ]] && echo -e "${COLOR}\n${d}${NC}" && ls -lh "${d}logs/"
done

# script location
echo -e "\nProcess IDs"
pwdx $(ps -ef | grep -v grep | grep -E "java -jar Lavalink|python3 main.py" | awk '{print $2}')
