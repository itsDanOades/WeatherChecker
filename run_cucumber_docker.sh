#!/usr/bin/env bash

# Boot Ruby test runner docker container and download public Selenium Grid docker containers
# Note - requires Docker and docker-compose to be installed, see README

set +e
docker-compose up -d --force-recreate && docker-compose logs -f cucumber

set -e
docker-compose down