#!/bin/bash
master_node="$1"
COUNTER=0
for a in `grep "host_name" ambari-hosts.txt | awk -F':' '{print $(NF)}'`; do
  let COUNTER=COUNTER+1
  echo "Replacing slave$COUNTER with $a"
  `sed -i "s/slave$COUNTER/$a/g" blueprint-cluster-definition.json`
done

 `sed -i "s/master/$master_node/g" blueprint-cluster-definition.json`