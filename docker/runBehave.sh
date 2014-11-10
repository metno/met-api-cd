#!/bin/bash
docker build --no-cache --tag=met-api-behave ./met-api-behave
docker run --link met-api:met-api met-api-behave
