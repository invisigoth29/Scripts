#!/bin/bash

# Check if the input file is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 input_file"
  exit 1
fi

input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file does not exist."
  exit 1
fi

# Define the list of ports to scan
ports=("80" "443" "22" "8080")

# Loop through the list of IP addresses from the input file
while IFS= read -r ip; do
  echo "Scanning IP: $ip"
  
  # Loop through the list of ports
  for port in "${ports[@]}"; do
    # Use netcat to attempt a connection to the IP and port
    if nc -z -w1 $ip $port; then
      echo "Port $port is open on $ip"
      
      # If the port is open, attempt to get the service banner
      banner=$(nc -v -n -w1 -z $ip $port 2>&1)
      echo "Service banner for port $port on $ip:"
      echo "$banner"
      echo "------------------------"
    fi
  done
done < "$input_file"
