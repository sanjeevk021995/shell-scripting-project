# DevOps Toolkit CLI

This is a small project I built to **practice real-world DevOps troubleshooting using Bash scripting**.

In daily work, I often run multiple commands to debug issues like disk usage, logs, or network problems.
So I created this **simple CLI tool** to bring common DevOps checks into one place.

---




## Features

* System health check (CPU, memory, disk)
* Disk usage analysis (top space consumers)
* Log analysis (error/warn count, frequent errors)
* Network debugging (ping, DNS, HTTP)
* Color output for better readability
* Config-based thresholds
* Logging system (all actions logged to file)
* Modular script design

---

## Project Structure

```
devops-toolkit/
│── main.sh
│
│── modules/
│   ├── health.sh
│   ├── disk.sh
│   ├── logs.sh
│   ├── network.sh
│
│── utils/
│   ├── colors.sh
│   ├── logger.sh
│
│── config/
│   ├── config.conf
│
│── logs/
│   ├── toolkit.log
│
│── app.log   # sample log file
```

---
## How it works 

* `main.sh` → entry point
* It calls different modules based on input
* Each module handles a specific task
* Utilities provide common functions (colors, logging)
* Config file controls thresholds

---
## Configuration

You can change thresholds from:

```
config/config.conf
```

Example:

```
CPU_THRESHOLD=80
DISK_THRESHOLD=80
```

This helps avoid hardcoding values inside scripts.

---



## Logging System (toolkit.log)

All important actions are logged in:

```
logs/toolkit.log
```

Example:

```
Sun Mar 29 14:09:24 IST 2026 [ERROR] High CPU usage: 86%
Sun Mar 29 14:10:39 IST 2026 [ERROR] High Disk usage: 82%
Sun Mar 29 14:31:06 IST 2026 [INFO] Network check started for google.com
Sun Mar 29 14:36:34 IST 2026 [INFO] Analyzing log file: app.log
```

This helps in debugging and tracking script activity.

---

## Usage Examples

---

### 1. Health Check

```
./main.sh health
```
Example output:
``` 
High CPU: 86%
Sun Mar 29 14:51:36 IST 2026 [ERROR] High CPU usage: 86%
```
---

### 2. Disk Analysis

```
./main.sh disk
```
Example output:
``` 
Disk usage high: 82%
Sun Mar 29 14:53:10 IST 2026 [ERROR] High Disk usage: 82%
```



---

### 3. Log Analysis

```
./main.sh logs app.log
```

Example output:

```
Analyzing log file: app.log

Total lines:
10

Error count:
4

Warning count:
2

Top 5 frequent errors:
3 ERROR Database connection failed
1 ERROR Timeout while calling API
```

---

### 4. Network Check

```
./main.sh network google.com
```

Example output:

```
Checking network for: google.com

Ping successful
DNS OK
HTTP reachable
```



---










