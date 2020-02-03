#!/usr/bin/env bash

# Build Ruby test runner docker container from Dockerfile
docker build -f Dockerfile -t cucumber:0.0.1 .