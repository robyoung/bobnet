#!/usr/bin/env bash

set -e

docker_socket=/tmp/bobnet-docker.sock
control_socket=/tmp/bobnet-ssh.sock

if [ ! -f $control_socket ]; then
  ssh -nNTf -MS $control_socket -L $docker_socket:/var/run/docker.sock $BOBNET_SWARM_MANAGER
fi

export DOCKER_HOST=unix://$docker_socket
