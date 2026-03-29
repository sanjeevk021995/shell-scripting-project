#!/bin/bash

network_check() {

  source utils/colors.sh
  source utils/logger.sh

  host=$1

  if [ -z "$host" ]; then
    echo -e "${RED}Please provide a host${NC}"
    exit 1
  fi

  echo -e "${YELLOW}Checking network for: $host${NC}"
  log_info "Network check started for $host"

  echo "-----------------------------------"

  echo "Ping test:"
  if ping -c 2 "$host" &>/dev/null; then
    echo -e "${GREEN}Ping successful${NC}"
  else
    echo -e "${RED}Ping failed${NC}"
  fi

  echo "-----------------------------------"

  echo "DNS resolution:"
  if nslookup "$host" &>/dev/null; then
    echo -e "${GREEN}DNS OK${NC}"
  else
    echo -e "${RED}DNS failed${NC}"
  fi

  echo "-----------------------------------"

  echo "HTTP check:"
  if curl -Is "$host" | head -1 | grep "200" &>/dev/null; then
    echo -e "${GREEN}HTTP reachable${NC}"
  else
    echo -e "${RED}HTTP issue${NC}"
  fi

  echo "-----------------------------------"

}