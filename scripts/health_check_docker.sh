#!/bin/bash
# CodeDeploy Health Check (ValidateService Hook)

echo "Starting health check..."
# 애플리케이션이 완전히 시작될 때까지 기다리기 위한 반복문
for i in {1..10}; do
    # curl -sS: 메시지 숨김, 오류 발생 시 출력
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/actuator/health)

    if [ "$HTTP_STATUS" -eq 200 ]; then
        echo "Application is healthy (HTTP $HTTP_STATUS)."
        exit 0
    fi

    echo "Attempt $i: Application not yet healthy (HTTP $HTTP_STATUS). Waiting 10 seconds..."
    sleep 10
done

echo "Application failed to start within the allowed time."
exit 1 # 1을 반환하면 CodeDeploy 배포 실패
