#!/bin/bash

source modules/health.sh
source modules/disk.sh
source modules/logs.sh
source modules/network.sh

case $1 in
  health)
    health_check
    ;;
  disk)
    disk_check
    ;;
  logs)
    logs_analyze "$2"
    ;;
  network)
    network_check "$2"
    ;;
  *)
    echo "Usage: $0 {health|disk|logs file_name| network google.com }"
    ;;
esac