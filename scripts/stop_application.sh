#!/bin/bash

echo "애플리케이션 중지 중..."

# 실행 중인 Spring Boot 애플리케이션의 PID 찾기
CURRENT_PID=$(pgrep -f 'java.*jar')

if [ -z "$CURRENT_PID" ]; then
    echo "실행 중인 애플리케이션이 없습니다."
else
    echo "실행 중인 애플리케이션 PID: $CURRENT_PID"
    kill -15 $CURRENT_PID

    # Graceful shutdown을 위해 대기
    sleep 10

    # 프로세스가 여전히 실행 중이면 강제 종료
    if ps -p $CURRENT_PID > /dev/null; then
        echo "강제 종료 중..."
        kill -9 $CURRENT_PID
    fi

    echo "애플리케이션 중지 완료"
fi