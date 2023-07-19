#!/bin/bash
# Script to quickly take IP or Domain as input then perform a quick scan
#
#
#
#
#export BLUE=$(tput setaf 3 :-"" 2>/dev/null)
#export RESET=$(tput sgr0 :-"" 2>/dev/null)
#
#echo -e "\n $BLUE ____***____________________/\___________________***_______/\____" $RESET
#echo -e " $BLUE ____***_______WELCOME____***____________/\_________***_____/\________" $RESET
#echo -e " $BLUE __/\____**____________+_______TO_______________________***______/\______" $RESET
#echo -e " $BLUE ___________+_____________/\________+_____QUICKSCAN_______/\__+_______" $RESET
#echo -e " $BLUE ___+____:)_______/\______;)________/\_________:-D_____+__________/\___________\n\n" $RESET
#
echo -e "Welcome to Quickscan"
echo -e "enter IP to scan"
read ip
echo -e "enter domain to scan"
read domain
nmap -sV -sC -A -O -oA $ip $domain
#
#
#
echo "Enter another IP or domain to scan or type exit"
echo "Enter IP to scan"
echo "Enter domain to scan"
echo "Type exit"
read ip
read domain
read exit
if [ $exit = exit ]
then
exit




