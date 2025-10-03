#!/bin/bash

# 실행 중인 프로세스가 있는지 확인
CURRENT_PID=$(pgrep -f .jar)

if [ -z "$CURRENT_PID" ]; then
    echo "> 현재 구동 중인 애플리케이션이 없습니다."
else
    echo "> kill -15 $CURRENT_PID"
    kill -15 $CURRENT_PID # 안전한 종료 (SIGTERM)
    sleep 5
fi