#!/bin/bash
#Script to create runlist
# v2 try to attach to case
#Usage ./runlist githubprlink cab_case_number cab_case_link



echo "-------------------------------------------------------------------------------------------------------------------------------"
echo "This script will generate a run list and attempt to attch it to your cab case."
echo "Usage ./runlist githubprlink cab_case_number cab_case_link"
echo "If it hangs that means a problem with your input"
echo "-------------------------------------------------------------------------------------------------------------------------------"

#Variables

pr=$1
num=$2
link=$3

#create text file of runlist
cat <<EOF>> /Users/jerry.reid/Desktop/runlists/runlist-$2.txt

Runlist for $2

$1

Roll Back:
Undo $1
EOF


#attempt to email to attach
#mailx  $2-runlist-$d.txt ->  as attachment to ticket :-)
