#!/bin/bash

LOG_FILE="logs/toolkit.log"

log_info() {
  echo -e "$(date) [INFO] $1" | tee -a "$LOG_FILE"
}

log_error() {
  echo -e "$(date) [ERROR] $1" | tee -a "$LOG_FILE"
}