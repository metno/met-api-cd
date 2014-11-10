#!/bin/bash

docker build --tag met-api - < met-api/Dockerfile
docker kill met-api
docker rm met-api
docker run --name met-api --detach=true met-api
