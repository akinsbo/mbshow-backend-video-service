#!/bin/bash
# Copy and paste the content of this file into Jenkins>Build>Execute shell>Command
echo "changing permissions on $WORKSPACE/build/tools/*.phar"
bash u+x $WORKSPACE/build/jenkins-set-permissions.sh