#!/bin/bash

echo "애플리케이션 상태 확인 중..."

# 프로세스 실행 확인
CURRENT_PID=$(pgrep -f 'java.*jar')

if [ -z "$CURRENT_PID" ]; then
    echo "애플리케이션이 실행되지 않았습니다!"
    exit 1
fi

echo "애플리케이션 PID: $CURRENT_PID"

# Health Check (포트 8080 기준, 필요시 변경)
sleep 60

# curl로 health check (Spring Boot Actuator 사용 시)
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/actuator/health)
if [ "$response" == "200" ]; then
  echo "애플리케이션 헬스 체크 성공. 애플리케이션이 정상적으로 실행 중입니다!: $response"
  exit 0
else
  echo "애플리케이션 헬스 체크 실패 : $response"
  exit 1

# 기본 포트 체크
# sudo apt-get install net-tools 설치 필수
if netstat -tuln | grep -q ":8080"; then
    echo "애플리케이션이 정상적으로 실행 중입니다!"
    exit 0
else
    echo "애플리케이션 포트가 열리지 않았습니다!"
    exit 1
fi