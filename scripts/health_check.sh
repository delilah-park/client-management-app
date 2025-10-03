#!/bin/bash
echo "> Health Check 시작"
# Spring Boot가 완전히 시작될 때까지 기다리기 위해 10번 반복 시도
for RETRY_COUNT in {1..10}
do
    # 애플리케이션의 헬스 체크 엔드포인트에 접속 시도
    RESPONSE=$(curl -s http://localhost:8080/actuator/health)
    UP_COUNT=$(echo $RESPONSE | grep 'UP' | wc -l)

    if [ $UP_COUNT -ge 1 ]; then
        echo "> Health Check 성공 ($RESPONSE)"
        exit 0
    else
        echo "> Health Check 실패. 응답: $RESPONSE"
        sleep 5
    fi
done

echo "> Health Check 최종 실패. 배포를 중단합니다."
exit 1