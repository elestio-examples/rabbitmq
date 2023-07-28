#!/usr/bin/env bash
cp -rf 3.12/alpine/management/* ./

docker buildx build . --output type=docker,name=elestio4test/rabbitmq:latest | docker load
