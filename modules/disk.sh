#!/bin/bash

disk_check() {

  source utils/colors.sh
  source config/config.conf
  source utils/logger.sh

  usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

  if [ "$usage" -gt "$DISK_THRESHOLD" ]; then
    echo -e "${RED}Disk usage high: $usage%${NC}"
    log_error "High Disk usage: $usage%"
  else
    echo -e "${GREEN}Disk OK: $usage%${NC}"
  fi

}