#!/usr/bin/expect -f


spawn oathtool --base32 --totp $totp
expect -re \\d+
set token $expect_out(0,string)

spawn sudo openconnect -b  $ADDRESS --servercert=sha256:$SERVERCERT --user=$USER --token-mode=totp  --token-secret=$SECRET expect "Password:"
send "$PASSWORD"
expect "Password:"
send -- "$token\n"
expect eof
