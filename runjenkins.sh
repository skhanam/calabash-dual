JOB_URL=http://10.2.24.186:8080/view/TUI_Automation/job/$1/
JOB_STATUS_URL=${JOB_URL}/lastBuild/api/json

GREP_RETURN_CODE=0

# Start the build
curl $JOB_URL/build?delay=0sec

# Poll every thirty seconds until the build is finished
while [ $GREP_RETURN_CODE -eq 0 ]
do
    sleep 30
    # Grep will return 0 while the build is running:
    curl --silent $JOB_STATUS_URL | grep result\":null > /dev/null
    GREP_RETURN_CODE=$?
done

echo Build finished

curl http://10.2.24.186:8080/view/TUI_Automation/job/$1/lastBuild/api/json?tree=result

