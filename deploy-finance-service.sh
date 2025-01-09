#!bin/bash


aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 878666174159.dkr.ecr.ap-south-1.amazonaws.com

cd /home/ubuntu/scripts/finance-service
docker-compose -f finance-docker-compose.yml down
docker rmi $(docker images -aq)

IMAGE_TAG=$1 docker-compose -f finance-docker-compose.yml up -d

