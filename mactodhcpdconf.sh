#Script to convert from CSV to dhcpd.conf
#Written bt Jerry Reid
#Any Questions please contact gerald.j.reid@intel.com
#Please feel free to modify and use as necessary


#!/bin/bash

echo "Type the name of the csv file you want to convert i.e file.csv"
read file

#Remove the double quotes from the output from powershell
sed -i 's/\"//g' $file


INPUT=newmacs.csv
OUTPUT=mac_out_$file.txt
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

