#!/usr/bin/bash

if [ $# -eq 0 ]
  then
    echo "Script to setup your LDAP credentials";
    echo "Usage: sh init.sh username password";
    exit 1
elif [ ! $# -eq 2 ]
  then
    echo "Invalid format!";
    exit 1
fi

username=$1;
password=$2;

sed -ie 's/const username;/const username = "$(username)";/g' 's/const password;/const password = "$(password)";/g' main.js;

echo "Following credentials set!"
echo "Username: $username";
echo "Password: $password";
