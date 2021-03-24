#!/bin/bash
IMAGE="rogierlommers/openweather-exporter:latest"

# first build the image (and tag it)
docker build -t ${IMAGE} .

if [ $? -eq 0 ]; then
    # then push to the registry
    docker push ${IMAGE}
else
    echo "docker build failed, not pushing to registry"
fi
