#!/usr/bin/bash
pushd ~/.assn-cli/ > /dev/null;
node ./auto.js 2&>/dev/null;

if [ ! -f ./temp.mhtml ]; then
    echo "Setup credentials first!"
    exit 1;
fi

if grep -Fq "due on" ./temp.mhtml
then
	sed -n -e '/due on/p' ./temp.mhtml | sed -e 's/,//g' -e 's/.*activity in //g' -e "s/:.*is due on /,/g" -e 's/">//g' | sed '1iCourse,Due on' | awk -F ',' '{print $0}' | tty-table;
else
	echo "No assignments due!";
fi

rm ./temp.mhtml;
popd > /dev/null;
