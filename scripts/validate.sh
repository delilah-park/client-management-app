#!/bin/bash

# 애플리케이션 시작 대기
echo "Waiting for application to start..."
sleep 15

# 헬스 체크
echo "Validating service..."

# Actuator health endpoint 시도
if curl -f http://localhost:8080/actuator/health; then
    echo "Health check passed (actuator)"
    exit 0
fi

# 기본 루트 경로 시도
if curl -f http://localhost:8080; then
    echo "Health check passed (root)"
    exit 0
fi

# 모두 실패
echo "Health check failed"
exit 1