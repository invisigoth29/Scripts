#!/bin/bash

# Get the filename of the input file from the command line argument
input_file=$1

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file '$input_file' not found"
    exit 1
fi

# Read the contents of the input file
while read line; do
    # Split the line into IP address and port number
    ip=$(echo $line | cut -d " " -f 1)
    port=$(echo $line | cut -d " " -f 2)

    # Use netcat to query the service version on the given port
    echo "Querying $ip:$port ..."
    (echo ""; echo) | nc $ip $port | head -n 1
done < $input_file
