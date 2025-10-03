#!/bin/bash
DEPLOY_PATH=/home/ubuntu/app/deploy
JAR_NAME=$(ls -tr $DEPLOY_PATH/*.jar | tail -n 1) # 가장 최근의 JAR 파일을 찾음

echo "> JAR Name: $JAR_NAME"

# nohup으로 백그라운드에서 실행, 표준 출력을 로그 파일로 리다이렉션
nohup java -jar -Dspring.profiles.active=prod $JAR_NAME > $DEPLOY_PATH/nohup.out 2>&1 &

echo "> 새 애플리케이션이 시작되었습니다."