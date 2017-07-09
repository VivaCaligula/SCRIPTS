#!/bin/bash
# This was originally from a thread posted on lainchan.org

# Get local IP from ifconfig.
localIP=($(sudo ifconfig | grep "inet " | awk '{print $2}' | awk 'END{print}' ))

# Affix two wildcards to the end of local IP.
startIP=`echo $localIP | cut -d "." -f1-3`
searchIP=`echo "$startIP.*"`
echo "Search IP is: $searchIP"

# Get IPs running on the local network.
echo "Scanning for IPs (this may take a while)."
networkIPs=($(nmap -sP $searchIP | grep -E '\d{2,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | awk '{print $5}'))

# Find details of stuff on network.
for index in ${!networkIPs[*]}; do
    echo "Device found on: ${networkIPs[$index]}"
    sudo nmap -v -O ${networkIPs[$index]} | grep -E "PORT|^\d{1,}/tcp|Running|MAC"
    printf "\n"
done
