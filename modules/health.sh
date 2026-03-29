#!/bin/bash

health_check() {

  source utils/colors.sh
  source utils/logger.sh
  source config/config.conf

  echo "System Health Check"

  cpu=$(top -bn1 | grep "Cpu" | awk '{print $2}' | cut -d. -f1)

  if [ "$cpu" -gt "$CPU_THRESHOLD" ]; then
    echo -e "${RED}High CPU: $cpu%${NC}"
    log_error "High CPU usage: $cpu%"
  else
    echo -e "${GREEN}CPU OK: $cpu%${NC}"
  fi

}