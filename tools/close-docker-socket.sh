#!/usr/bin/env bash

docker_socket=/tmp/bobnet-docker.sock
control_socket=/tmp/bobnet-ssh.sock

ssh -S $control_socket -O exit $BOBNET_SWARM_MANAGER
rm -f $docker_socket

unset DOCKER_HOST
