#!/bin/bash
#Get Hostname via instance ID
#how to use
# ./ec2info $profile 
#Jerry Reid

aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,NetworkInterfaces:PrivateIpAddress,State:State.Name,Hostname:Tags[?Key==`Hostname`]|[0].Value}' --profile "$1" --output table

