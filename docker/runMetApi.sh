#!/bin/bash

docker build --tag met-api - < met-api/Dockerfile
docker run --name metapi --detach=true met-api
