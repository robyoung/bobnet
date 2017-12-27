#!/usr/bin/env bash

docker_socket=/tmp/bobnet-docker.sock
control_socket=/tmp/bobnet-ssh.sock
write_socket=0

if [ ! -f $control_socket ]; then
  ssh -nNTf -MS $control_socket -L $docker_socket:/var/run/docker.sock $BOBNET_SWARM_MANAGER
  if [ $? -eq 0 ]; then
    write_socket=1
  else
    >&2 echo "Failed to ssh to swarm manager"
  fi
else
  >&2 echo "Control socket already exists, you may need to close the socket"
fi

if [ $write_socket -eq 1 ]; then
  export DOCKER_HOST=unix://$docker_socket
fi
