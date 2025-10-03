#!/bin/bash

cd /home/ubuntu/app

# JAR 파일 찾기
JAR_NAME=$(find . -name "*.jar" | head -n 1)

if [ -z "$JAR_NAME" ]; then
    echo "JAR 파일을 찾을 수 없습니다!"
    exit 1
fi

echo "JAR 파일 실행: $JAR_NAME"

# 환경 변수 설정 (필요한 경우)
export JAVA_OPTS="-Xms512m -Xmx1024m"

# Spring Boot 애플리케이션 백그라운드 실행
nohup java $JAVA_OPTS -jar $JAR_NAME \
    --spring.profiles.active=prod \
    > /home/ubuntu/app/logs/application.log 2>&1 &

# PID 저장
echo $! > /home/ubuntu/app/application.pid

echo "애플리케이션 시작 완료"
echo "PID: $(cat /home/ubuntu/app/application.pid)"

# 애플리케이션 시작 대기
sleep 10