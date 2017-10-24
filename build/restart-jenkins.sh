#!/bin/bash
# restart-jenkins
#
# Jenkins restart script for Mac
#
# (c)2017 Olaolu Akinsete

# Defining Sleep Time
SLEEP=10

echo "Stopping Jenkins"
sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist

echo "Let me sleep for $SLEEP seconds to make sure Jenkins have enough time to stop"
for ((i=1;i<=$SLEEP;i++))
do
  printf "."
  sleep 1
done

echo -e "\nStart Jenkins"
