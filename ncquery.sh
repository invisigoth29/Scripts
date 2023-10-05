#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 input_file ports_file"
    exit 1
fi

input_file="$1"
ports_file="$2"

# Check if input and ports files exist
if [ ! -f "$input_file" ]; then
    echo "Input file not found: $input_file"
    exit 1
fi

if [ ! -f "$ports_file" ]; then
    echo "Ports file not found: $ports_file"
    exit 1
fi

# Loop through each line (each line should contain a hostname)
while read -r hostname; do
    # Loop through the specified ports in the ports file and attempt to query banners
    while read -r port; do
        # Use netcat to query the banner on the current port
        echo "Checking $hostname:$port..."
        result=$(nc -v -n -w 1 -z "$hostname" "$port" 2>&1)

        if [[ $result == *succeeded* ]]; then
            echo "Banner for $hostname:$port:"
            echo "$result"
        fi
    done < "$ports_file"

    echo
done < "$input_file"
