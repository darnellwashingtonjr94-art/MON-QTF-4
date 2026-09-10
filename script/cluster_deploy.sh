#!/bin/bash
set -e

NAMESPACE="credkellarboop"
IMAGE_NAME="mon-qtf-4"
TAG="latest"

echo "Building Docker image for Mon-QTF-4..."
docker build -t ${NAMESPACE}/${IMAGE_NAME}:${TAG} .

echo "Deploying 100-node HFT cluster swarm..."
for i in {1..100}; do
  CONTAINER_NAME="mon-qtf-4-node-${i}"
  echo "Spawning ${CONTAINER_NAME}..."
  docker run -d --name ${CONTAINER_NAME} \
    --restart always \
    -e NODE_ID=${i} \
    ${NAMESPACE}/${IMAGE_NAME}:${TAG}
done

echo "All 100 Mon-QTF-4 execution proxies successfully deployed."
