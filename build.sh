#!/bin/bash
# Alternatively copy and paste into Jenkins>Build>Execute shell>Command
# bash build.sh

FILES=build/tools/*.phar
for file in $FILES
do
echo "setting execute permission on $file"
chmod u+x "$file"
done
