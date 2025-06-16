#!/bin/bash

CTR=entrypoint-build

docker run -d --name $CTR -v .:/work:Z alpine /bin/sleep 5m
docker exec $CTR apk add gcc libc-dev
docker exec $CTR gcc -static -o /work/entrypoint /work/entrypoint.c
docker exec $CTR strip /work/entrypoint
docker kill $CTR
docker rm $CTR
