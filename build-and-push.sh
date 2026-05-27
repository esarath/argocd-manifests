#!/usr/bin/env bash
set -e

IMAGE_NAME="esarathmails/demo-webapp:latest"

echo "Building Docker image..."
docker build -t $IMAGE_NAME .

echo "Logging into DockerHub (if required)..."
docker login

echo "Pushing image to DockerHub..."
docker push $IMAGE_NAME

echo "Done: $IMAGE_NAME"
