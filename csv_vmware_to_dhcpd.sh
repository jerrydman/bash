#This takes a csv file created from the powershell counterpart and makes #makes the hostname and mac into a dhcpd.conf compatible format



!/bin/bash

INPUT=vmware.csv
OUTPUT=mac_out.txt
OLDIFS=$IFS
IFS=","
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
[ -f $OUTPUT ] && { rm $OUTPUT; }
[ ! -f $OUTPUT ] && { touch $OUTPUT; }
while read hostname mac
do
echo "host $hostname {" >> $OUTPUT
echo -e "\thardware ethernet $mac;" >> $OUTPUT
echo -e "\tfixed-address $hostname;" >> $OUTPUT
echo "}" >> $OUTPUT
done < $INPUT

IFS=$OLDIFS

