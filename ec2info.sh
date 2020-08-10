#!/bin/bash
#Arguments in is instance-id
#Pre Requisite
# awsls -> https://github.com/jckuester/awsls
#Usage ./findInstance.sh instance_id



echo "-------------------------------------------------------------------------------------------------------------------------------"
echo "This script will search all accounts by instance id and output hostname and other appropiate info required for troubleshooting."
echo "This is based on EC2 tags so please double check all info"
echo "This script will take some time to run (average being abount 1.5 minutes) since it does search ALL the accounts (qa -> ssprod)"
echo "This script does require awsls which can be found  https://github.com/jckuester/awsls"
echo "-------------------------------------------------------------------------------------------------------------------------------"

instance=$(awsls --attributes name  aws_instance -p profile1,profile2,profile3 -r us-west-2 | grep "$1" | awk '{print $2}')
profile=$(awsls --attributes name  aws_instance -p profile1,profile2,profile3 -r us-west-2 | grep "$1" | awk '{print $3}')
region=$(awsls --attributes name  aws_instance -p profile1,profile2,profile3 -r us-west-2 | grep "$1" | awk '{print $4}')


aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,NetworkInterfaces:PrivateIpAddress,State:State.Name,Hostname:Tags[?Key==`Hostname`]|[0].Value}' --instance-ids $instance --profile $profile --region $region  --output table



