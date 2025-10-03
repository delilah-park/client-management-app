#!/bin/bash

IMAGE_URI="713665789031.dkr.ecr.ap-northeast-2.amazonaws.com/simple-docker-service:latest"

# 최신 이미지 pull
echo "Pulling Docker image..."
docker pull $IMAGE_URI

# 컨테이너 실행
echo "Starting Docker container..."
docker run -d -p 8080:8080 $IMAGE_URI

echo "Application started successfully"