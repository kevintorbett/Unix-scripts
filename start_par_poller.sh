#!/bin/bash
# IMR ACES/PIES Batch (Parallel) Processing Poller script
# Authors: imruser
# chkconfig: 2345 25 75
# description: Starts the IMR Parallel poller

# Get host IP
IP=`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`

# Start the IMR Parallel Poller processes.
echo $"Starting IMR Parallel pollers..."

# Parallel poller
sudo -u imruser nohup java  -Dlog4j.configuration=file:///opt/imr-batch/conf/par_poller_log4j.properties -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Djava.rmi.server.hostname=$IP -Xms1024m -jar /opt/imr-batch/imr-par-poller.jar -f /opt/imr-batch/conf/poller.properties -e /opt/imr-batch/errors  > /dev/null 2>&1 &

echo "Display the Java processes running...."
sleep 2
ps -ef | grep java 
