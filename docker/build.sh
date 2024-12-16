#!/bin/bash

image_tag=base

cd ..

# build
#docker build -t gitlab-master.nvidia.com:5005/tkurth/torchfort:${image_tag} -f docker/Dockerfile .
docker build -t marssim:${image_tag} -f docker/Dockerfile .
#docker build -t torchfort:${image_tag} -f docker/Dockerfile_cpu_torchfort .

#if [ $? -eq 0 ]; then
#    #docker push gitlab-master.nvidia.com:5005/tkurth/torchfort:${image_tag}
#    docker push torchfort:${image_tag}
#fi
