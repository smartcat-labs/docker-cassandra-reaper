#!/bin/bash

echo "Starting cassandra reaper"

TARGET_PATH="/opt/cassandra-reaper"

if [ -n "$1" ]; then
    TARGET_PATH=$1
fi

echo "Using ${TARGET_PATH} as jar and configuration folder"

# echo "Using reaper in /opt/cassandra-reaper"
CLASS_PATH="${TARGET_PATH}/cassandra-reaper.jar"
CONFIG_PATH="${TARGET_PATH}/cassandra-reaper.yaml"

JVM_OPTS=(
    -Xms1G
    -Xmx2G
    )

exec java ${JVM_OPTS[@]} \
    -cp ${CLASS_PATH} \
    com.spotify.reaper.ReaperApplication \
    server ${CONFIG_PATH}
