#!/bin/bash

# read each line of the file
while read ipaddress; do
  # query the DNS name using 'nslookup' command
  dnsname=$(nslookup $ipaddress | grep 'name =' | awk '{print $4}')
  
  # print the IP address and DNS name
  echo "$ipaddress -> $dnsname"
done < ip_addresses.txt