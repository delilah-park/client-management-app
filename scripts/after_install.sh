#!/bin/bash

cd /home/ubuntu/app

# JAR 파일 찾기
JAR_NAME=$(find . -name "*.jar" | head -n 1)

if [ -z "$JAR_NAME" ]; then
    echo "JAR 파일을 찾을 수 없습니다!"
    exit 1
fi

echo "찾은 JAR 파일: $JAR_NAME"

# 심볼릭 링크 생성 (선택사항)
ln -sf $JAR_NAME application.jar

# JAR 파일 실행 권한 부여
chmod +x $JAR_NAME

echo "After Install 완료"