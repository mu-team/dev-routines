#!/bin/bash

set -e

# user custom defined constants
PID_FILE="/run/zookeeper.pid"
SERVICE_NAME="Zookeeper"
SERVICE_ROOT="/opt/kafka"
SERVICE_BIN=${SERVICE_ROOT}/bin

service_pid() {
    echo `ps ax | grep -i "org.apache.zookeeper.server" | grep -v grep | awk '{print $1}'`
}

service_start() {
    local pid=$(service_pid)
    if [ -n "$pid" ]; then
        echo "${SERVICE_NAME} already running."
    else
        echo "Starting ${SERVICE_NAME}..."
        ${SERVICE_BIN}/zookeeper-server-start.sh -daemon ${SERVICE_ROOT}/config/zookeeper_cupis.properties
        ${pid} > ${PID_FILE}
        echo "${SERVICE_NAME} started [${pid}]."
    fi
}

service_stop() {
    local pid=$(service_pid)
    if [ -n "$pid" ]; then
        echo "Stopping ${SERVICE_NAME}..."
        kill -9 ${pid}
        rm ${PID_FILE}
        echo "${SERVICE_NAME} stopped."
    else
        echo "${SERVICE_NAME} is not running."
    fi
}

service_restart() {
    service_stop
    service_start
}

service_status() {
    local pid=$(service_pid)
    if [ -n "$pid" ]; then
        echo "${SERVICE_NAME} is running [${pid}]."
    else
        echo "${SERVICE_NAME} is not running."
    fi
}

service_help() {
    echo "Usage: $0 {start|stop|restart|status}. Help: $0 -h | --help"
}

case "$1" in
    -h | --help) service_help;;

    stop)        service_stop;;
    start)       service_start;;
    status)      service_status;;
    restart)     service_restart;;

    *) service_help && exit 1;;
esac
