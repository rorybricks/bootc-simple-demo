#!/bin/bash
mkdir -p output

podman pull ghcr.io/brightrory/bootc-simple-demo:latest
podman run \
--rm \
--name bootc-demo-vmdk-bootc-gitops-bootc-image-builder \
--tty \
--privileged \
--security-opt label=type:unconfined_t \
-v ./output:/output/ \
-v /var/lib/containers/storage:/var/lib/containers/storage \
-v ./config.toml:/config.toml:ro \
--label bootc.image.builder=true \
quay.io/centos-bootc/bootc-image-builder:latest \
ghcr.io/brightrory/bootc-simple-demo:latest \
--output /output/ \
--type vmdk \
--target-arch arm64 \
--use-librepo=True \
--rootfs xfs
