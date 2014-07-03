#!/bin/bash
COUNTER=0
for a in `grep "host_name" ambari-hosts.txt | awk -F':' '{print $(NF)}'`; do
  let COUNTER=COUNTER+1
  echo "Replacing slave$COUNTER with $a"
  `sed -i "s/slave$COUNTER/$a/g" blueprint-cluster-definition`
done