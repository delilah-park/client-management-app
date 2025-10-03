#!/bin/bash

# Java 17 설치 확인 및 설치
if ! command -v java &> /dev/null || ! java -version 2>&1 | grep -q "17"; then
    echo "Java 17 설치 중..."
    sudo yum install -y java-17-amazon-corretto-devel
fi

# Java 버전 확인
java -version

# 애플리케이션 디렉토리 생성
sudo mkdir -p /home/ubuntu/app
sudo chown -R ubuntu:ubuntu /home/ubuntu/app

# 로그 디렉토리 생성
sudo mkdir -p /home/ubuntu/app/logs
sudo chown -R ubuntu:ubuntu /home/ubuntu/app/logs

echo "Before Install 완료"