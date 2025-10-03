#!/bin/bash
# CodeDeploy ApplicationStart Hook (Docker Container Startup)

# CodeDeploy 아티팩트 경로
DEPLOY_PATH=/home/ubuntu/app/deploy
CONTAINER_NAME="spring-app-container"

# CodeDeploy 아티팩트에서 imagedefinitions.json을 파싱하여 이미지 URI를 가져옴
if [ -f $DEPLOY_PATH/imagedefinitions.json ]; then
    # jq를 사용하여 imagedefinitions.json에서 첫 번째 이미지 URI를 파싱합니다.
    # jq는 CodeDeploy 환경에서 일반적으로 설치되어 있어야 합니다.
    IMAGE_URI=$(cat $DEPLOY_PATH/imagedefinitions.json | jq -r '.[0].imageUri')
else
    echo "ERROR: imagedefinitions.json not found at $DEPLOY_PATH."
    exit 1
fi

echo "Starting container with image: $IMAGE_URI"

# 1. 도커 이미지를 ECR에서 pull합니다.
docker pull $IMAGE_URI

# 2. 새 컨테이너 실행 (8080 포트를 EC2의 8080 포트에 매핑)
# -d: 백그라운드 실행(Detach)을 보장합니다. CodeDeploy가 다음 단계로 넘어갈 수 있게 합니다.
# --name: 컨테이너 이름을 지정하여 stop 스크립트에서 쉽게 찾을 수 있게 합니다.
docker run -d --name $CONTAINER_NAME -p 8080:8080 $IMAGE_URI

echo "New container started."
