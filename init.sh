#!/usr/bin/bash

if [ $# -eq 0 ]; then
	echo "Script to setup your LDAP credentials";
    	echo "Usage: sh init.sh username password";
    	exit 1
elif [ ! $# -eq 2 ]; then
	echo "Invalid format!";
    	exit 1
fi

sed -i -e "s/.*const username.*/const username = \"$1\";/g" -e "s/.*const password.*/const password = \"$(echo $2 | sed 's/\\/\\\\/g')\";/g" ~/.assn-cli/main.js;

echo "Following credentials set!"
echo "Username: $1";
echo "Password: $2";
