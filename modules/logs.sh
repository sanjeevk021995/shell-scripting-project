#!/bin/bash

logs_analyze() {

  source utils/colors.sh
  source utils/logger.sh

  file=$1

  if [ -z "$file" ]; then
    echo -e "${RED}Please provide a log file${NC}"
    exit 1
  fi

  if [ ! -f "$file" ]; then
    echo -e "${RED}File does not exist${NC}"
    exit 1
  fi

  echo -e "${YELLOW}Analyzing log file: $file${NC}"
  log_info "Analyzing log file: $file"

  echo "-----------------------------------"

  echo "Total lines:"
  wc -l "$file"

  echo "-----------------------------------"

  echo "Error count:"
  grep -i "error" "$file" | wc -l

  echo "Warning count:"
  grep -i "warn" "$file" | wc -l

  echo "-----------------------------------"

  echo "Top 5 frequent errors:"
  grep -i "error" "$file" | sort | uniq -c | sort -nr | head -5

  echo "-----------------------------------"

}