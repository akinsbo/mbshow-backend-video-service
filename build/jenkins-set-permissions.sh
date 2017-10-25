#!/bin/bash
# Set permissions for Jenkins tools
# bash jenkins-set-permissions.sh in Jenkins
FILES=/tools/*.phar
for file in $FILES
do
echo "setting execute permission on $file"
chmod u+x $file
done
