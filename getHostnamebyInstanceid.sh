#!/bin/bash
# Get Hostname via instance ID
# how to use
# ./getHostnamebyID $instance_id $profile 
# Jerry Reid


aws ec2 describe-instances --instance-ids "$1" --query 'Reservations[].Instances[].{Hostname: Tags[?Key==`Hostname`].Value}' --profile "$2"
