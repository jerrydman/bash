#!/bin/bash

set -u

secret=secret_code_here

serial=$1

if [ -z "${serial}" ]
then
        echo Unable to read serial number from DMI
        exit 1
fi

passwd_r610=$(echo ${serial}${secret} | sha1sum | base64 | cut -b -16)

passwd_r620=$(echo ${passwd_r610} | tr 'A-Z' 'a-z')

echo
echo r620 BIOS password: ${passwd_r620}
echo r620 DRAC password: ${passwd_r620}
echo
