#!/bin/bash
# Script to quickly take IP or Domain as input then perform a quick scan

echo -e "\n ____***____________________/\___________________***_______/\____"
echo -e " ____***_______WELCOME____***____________/\_________***_____/\________"
echo -e " __/\____**____________+_______TO_______________________***______/\______"
echo -e " ___________+_____________/\________+_____QUICKSCAN_______/\__+_______"
echo -e " ___+____:)_______/\______;)__by___Invisigoth29______/\_________:-D_____+__________/\___________\n\n"

echo -e "Welcome to Quickscan"
echo -e "Enter IP, domain, or integer to scan:"
read input

# Function to check if the input is a valid IPv4 address
is_valid_ip() {
    local ip=$1
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        local IFS='.'
        local -a octets=($ip)
        for octet in "${octets[@]}"; do
            if (( octet < 0 || octet > 255 )); then
                return 1
            fi
        done
        return 0
    else
        return 1
    fi
}

# Check if the input is an integer
if [[ $input =~ ^[0-9]+$ ]]; then
    echo "Input is an integer. Exiting."
    exit 1
fi

# Check if the input is a valid IP address
if is_valid_ip "$input"; then
    nmap -Pn -sS -f "$input"  # Scanning an IP address
else
    # Assume it's a domain name
    domain=$input
    ip=$(dig +short "$domain")  # Use dig command to resolve domain to IP address

    if [ -z "$ip" ]; then
        echo "Failed to resolve the domain name. Exiting."
        exit 1
    fi

    echo "Domain resolved to IP: $ip"
    nmap -Pn -sS -f  "$domain" "$ip"  # Scanning the domain
fi


