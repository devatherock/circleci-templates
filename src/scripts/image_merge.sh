TAG=${CIRCLE_SHA1:0:8}
docker manifest create ${PARAM_IMAGE}:$TAG \
    ${PARAM_IMAGE}:${TAG}-amd64  \
    ${PARAM_IMAGE}:${TAG}-arm64
docker manifest push ${PARAM_IMAGE}:$TAG
docker buildx create --name rockbuilder --driver docker-container --use --bootstrap
docker buildx imagetools create -t ${PARAM_IMAGE}:latest ${PARAM_IMAGE}:$TAG