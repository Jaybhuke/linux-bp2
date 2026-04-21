#!/bin/bash

set -a
source /home/ec2-user/learning/projects/project2/.env
set +a


LOG_DIR="/var/log"
REPORT="/home/ec2-user/learning/projects/project2/reports.log"
TEMP_FILE="/home/ec2-user/learning/projects/project2/temp_reports.log"

echo "Log analysis report $(date)" >> $REPORT
echo "---------------------------" >> $REPORT

THERSHOLD=3
> $TEMP_FILE

for file in $LOG_DIR/*.log
do
	ERROR_COUNT=$(grep -Ei "error|failed|critical" $file 2>/dev/null | wc -l)

	if [ $ERROR_COUNT -gt $THERSHOLD ]; then
		echo "$ERROR_COUNT $file" >> $TEMP_FILE

		MESSAGE="ALERT: $file has $ERROR_COUNT critical issue"

		curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
			--data-urlencode "chat_id=$CHAT_ID" \
			--data-urlencode "text=$MESSAGE"
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
