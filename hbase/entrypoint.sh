#!/bin/bash

function stop() {
    echo "Stopping..."
    bin/stop-hbase.sh
    while pgrep -f HMaster > /dev/null; do
      sleep 1
    done
    exit
}

trap stop TERM EXIT

bin/start-hbase.sh

tail -F logs/hbase--master-$(hostname).log &

wait
