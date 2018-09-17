#!/usr/bin/env bash

set -e

container_ip() {
    if [ -z "$1" ]; then
        echo "Parameter \"CONTAINER\" is not specified." && exit 1
    fi
    echo $(docker exec ${1} tail -n 1 /etc/hosts | awk -F' ' '{print $1}')
}

commands_help() {
    echo "Usage: $0 \"command\" \"parameter(-s)\""
    echo "command | parameter(-s) | description"
    echo "-------------------------------------------------"
    echo "     ip |     CONTAINER | get docker container IP"
}

case "$1" in
    ip) container_ip "$2";;
    *)  commands_help && exit 1;;
esac
