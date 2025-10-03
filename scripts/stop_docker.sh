#!/bin/bash
# CodeDeploy 환경 변수에서 ECR 경로와 태그를 가져와야 함.
# 하지만 CodePipeline 설정을 단순화하기 위해 여기서는 'imagedefinitions.json'을 파싱하거나,
# ECR 경로를 직접 사용합니다. (imagedefinitions.json 파싱이 더 안정적입니다.)

DEPLOY_PATH=/home/ec2-user/app/deploy
CONTAINER_NAME="spring-app-container"
# CodeDeploy 아티팩트에서 imagedefinitions.json을 파싱하여 이미지 URI를 가져옴
IMAGE_URI=$(cat $DEPLOY_PATH/imagedefinitions.json | jq -r '.[0].imageUri')

echo "Starting container with image: $IMAGE_URI"

# 도커 이미지를 ECR에서 pull합니다.
docker pull $IMAGE_URI

# 새 컨테이너 실행 (8080 포트를 EC2의 8080 포트에 매핑)
docker run -d --name $CONTAINER_NAME -p 8080:8080 $IMAGE_URI

echo "New container started."
