#!/bin/bash

LOG_DIR="/var/log"
REPORT="/home/ec2-user/learning/projects/project2/reports.log"


echo "Log analysis report $(date)" >> $REPORT
echo "---------------------------" >> $REPORT

for file in $LOG_DIR/*.log
do
	echo "---------------" >> $REPORT
	echo "Checking $file" >> $REPORT

	ERROR_COUNT=$(grep -i "error" $file 2>/dev/null | wc -l)

	if [ $ERROR_COUNT -gt 0 ]; then
		echo "$file has $ERROR_COUNT errors" >> $REPORT
	else
		echo "No errors in $file" >> $REPORT
	fi
done
