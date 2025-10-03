#!/bin/bash

# 실행 중인 모든 컨테이너 중지
docker stop $(docker ps -q) || true

# 중지된 모든 컨테이너 삭제
docker rm $(docker ps -aq) || true

echo "Stopped and removed all containers"