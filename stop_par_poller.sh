#!/bin/bash
echo "Terminating the Parallel Poller process..."
ps -ef | grep imr-par-poller | awk '{print $2}' | xargs kill -9 > /dev/null 2>&1
echo "Waiting for the process to be killed..."
sleep 2
echo "Display the Java processes running..."
ps -ef | grep java
