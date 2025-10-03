#!/bin/bash

# ECR 로그인
echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 713665789031.dkr.ecr.ap-northeast-2.amazonaws.com

echo "ECR login successful"