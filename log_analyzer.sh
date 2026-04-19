#!/bin/bash

LOG_DIR="/var/log"
REPORT="/home/ec2-user/learning/projects/project2/reports.log"


echo "Log analysis report $(date)" >> $REPORT
echo "---------------------------" >> $REPORT

for file in $LOG_DIR/*.log
do
	echo "Checking $file" >> $REPORT
done
