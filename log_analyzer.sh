#!/bin/bash

LOG_DIR="/var/log"
REPORT="/home/ec2-user/learning/projects/project2/reports.log"
TEMP_FILE="/home/ec2-user/learning/projects/project2/temp_reports.log"

echo "Log analysis report $(date)" >> $REPORT
echo "---------------------------" >> $REPORT


> $TEMP_FILE

for file in $LOG_DIR/*.log
do
	ERROR_COUNT=$(grep -i "error" $file 2>/dev/null | wc -l)

	if [ $ERROR_COUNT -gt 0 ]; then
		echo "$ERROR_COUNT $file" >> $TEMP_FILE
	fi
done

echo "Top Error Logs:" >> $REPORT

if [ -s $TEMP_FILE ]; then
	sort -nr $TEMP_FILE | while read count file
	do
		echo "$file has $count errors" >> $REPORT
	done
else
	echo "No errors found in logs" >> $REPORT
fi

echo "" >> $REPORT
echo "Analysis Complete" >> $REPORT
