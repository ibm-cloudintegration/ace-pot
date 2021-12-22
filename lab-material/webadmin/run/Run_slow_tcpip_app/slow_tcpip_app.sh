#!/bin/bash
# Sample program for use with IBM Integration Bus
# (c) Copyright International Business Machines Corporation 2013
# Licensed Materials - Property of IBM

MYCP=./jars/slow_tcpip_app.jar

# Ensure the correct platform JAR is found before the app is launched
# This assumes Java is already in the PATH
java -version 2>&1 | grep 'amd64-64' > /dev/null
if test $? -eq 0
then
MYCP=$MYCP:./jars/swt_lin64.jar
else
MYCP=$MYCP:./jars/swt_lin32.jar
fi

# Launch the Workload Management sample backend application
java -classpath $MYCP Slow_TCPIP_Application $1 $2
