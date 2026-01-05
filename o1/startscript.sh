
#!/bin/bash
#
# Detta script samlar in systeminformation - RECON
#
#
# Author: Daniel Törnblom
# Last Update: 2025-12-11
GREEN="\e[32m"
NC="\e[0m"

echo "Välkommen till mitt RECON script för att kontrollera en Linux-miljö"
echo
echo "${GREEN}== DATUM OCH TID==${NC}"
date 
echo
echo "=== SYSTEMINFO ==="
uname -a

echo
echo "=== AKTUELL ANVÄNDARE ==="
echo $USER

echo
echo "=== ANVÄNDARE MED SHELL ==="
grep "sh$" /etc/passwd

echo
echo "=== NÄTVERK ==="
ip a | grep inet

echo
echo "${GREEN}=== Hårdvara du sitter på  ===${NC}"
lscpu
echo
echo "${GREEN}=== Ram-använding  ===${NC}"
free 
#
# 
#
