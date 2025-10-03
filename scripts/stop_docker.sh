#!/bin/bash
# CodeDeploy ApplicationStop Hook (Existing Docker Cleanup)

CONTAINER_NAME="spring-app-container"

echo "Checking for running container: $CONTAINER_NAME"

# 현재 실행 중이거나 중지된 상태의 컨테이너 목록에서 이름을 검색합니다.
if docker ps -a --format '{{.Names}}' | grep -q "$CONTAINER_NAME"; then
    echo "Existing container found. Stopping and removing..."

    # 컨테이너 중지 (이미 중지된 경우에도 오류 없이 작동)
    docker stop $CONTAINER_NAME

    # 컨테이너 삭제
    docker rm $CONTAINER_NAME

    echo "Cleanup complete."
else
    echo "No existing container found. Skipping cleanup."
fi
