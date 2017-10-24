#!/bin/bash
# jenkins-plugins-installation
#
# Jenkins restart script for Mac
#
# (c)2017 Olaolu Akinsete

# Downloading jenkins-cli
wget http://localhost:8080/jnlpJars/jenkins-cli.jar
# running in the same directory
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin checkstyle cloverphp crap4j dry htmlpublisher jdepend plot pmd violations warnings xunit
# restarting after jobs finish (not aborting jobs)
java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart
