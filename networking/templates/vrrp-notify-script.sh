#!/bin/bash

TYPE=$1
NAME=$2
STATE=$3

case $STATE in
        "MASTER") systemctl start bird
                  systemctl start haproxy
                  exit 0
                  ;;
        "BACKUP") systemctl stop bird
                  systemctl stop haproxy
                  exit 0
                  ;;
        # NOTE(luisd): While FAULT states are not implemented yet, we still 
        #  handle the case. It could be implemented in the future eg.: if 
        #  the internet on the router fails.
        "FAULT")  systemctl stop bird
                  systemctl stop haproxy
                  exit 0
                  ;;
        *)        echo "unknown state"
                  exit 1
                  ;;
esac