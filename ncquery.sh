#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

input_file="$1"

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file not found: $input_file"
    exit 1
fi

# Loop through each line (each line should contain a hostname and a port)
while read -r line; do
    # Split the line into hostname and port
    hostname=$(echo "$line" | cut -d' ' -f1)
    port=$(echo "$line" | cut -d' ' -f2)

    # Use netcat to query the banner on the specified port
    echo "Checking $hostname:$port..."
    result=$(nc -v -n -w 1 -z "$hostname" "$port" 2>&1)

    if [[ $result == *succeeded* ]]; then
        echo "Banner for $hostname:$port:"
        echo "$result"
    else
        echo "Unable to connect to $hostname:$port"
    fi

    echo
done < "$input_file"
