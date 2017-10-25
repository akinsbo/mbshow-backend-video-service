#!/bin/bash
# Alternatively copy and paste the content of this file into Jenkins>Build>Execute shell>Command
#echo "changing permissions on $WORKSPACE/build/tools/*.phar"
#bash u+x $WORKSPACE/build/jenkins-set-permissions.sh

FILES=build/tools/*.phar
for file in $FILES
do
echo "setting execute permission on $file"
chmod u+x "$file"
done
