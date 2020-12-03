#!/usr/bin/env bash
set -ex

registry="w2u2j1b9"

#aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws

for d in $(ls -d */); do
    version=$(cat "$d/VERSION")
    image=$(basename "$d")
    docker tag "$image:latest" "public.ecr.aws/$registry/$image:latest"
    docker tag "$image:latest" "public.ecr.aws/$registry/$image:$version"
    docker push "public.ecr.aws/$registry/$image:latest"
    docker push "public.ecr.aws/$registry/$image:$version"
done

