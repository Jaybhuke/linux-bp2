# Log Analyzer and Alerting System

## Overview
This project is a Bash based log monitoring tool that scans system log files and identifies critical issues using keywords based detection.

It helps in proactive monitoring by detecting errors and sending alerts.

---

## Features

- Multi-keyword log analysis (error, failed, critical)
- Error count per log file
- Sorted report based on severity
- Telegram alert integration
- Handles Permission erros (2>/dev/null)
- Clean and structured logging

---

## Technologies used

- Linux
- Bash Scripting
- grep, awk, sed, sort
- Cron (Optional)
- Telegram Bot API

---

## How it works

1. Scan log files in `/var/log`
2. Searches for critical keywords
3. Counts occurence using `wc -l`
4. Stores results in temporary file
5. Sorts logs based on error count
6. Generates final report
7. Sends alert if thershold exceeded

---

## Setup instructions
```bash
git clone
cd "/"
```
---

## Make Script Executable

```bash
chmod +X log_analyzer.sh
```
---

## Add Environment Variables

1. Create .env files

```bash

TOKEN=your_token
CHAT_ID=your_chat_id
```
---

## Run Script
```bash
./log_analyzer.sh
```
