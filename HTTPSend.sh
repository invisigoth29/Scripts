#multiple HTTP requests 

#!/bin/bash

websites=("https://www.dovahsec.com” "https://www.google.com”)

while true; do
    for website in "${websites[@]}"; do
        response=$(curl -sSL "$website")
        status_code=$(echo "$response" | head -n 1 | cut -d' ' -f2)
        content=$(echo "$response" | tail -n +2)
        echo "Response status code: $status_code"
        echo "Response content:"
        echo "$content"
    done
done