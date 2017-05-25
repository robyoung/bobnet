# Bobnet

Bootstrap and configure the nodes in bobnet.

## Usage

1. Install role dependencies `make roles`
1. Bootstrap disk images with `make bootstrap`
1. Write image to USB drive with `sudo dd bs=1m if=images/{image name} of=/dev/rdiskN`
1. Install the images in the Raspberry Pis
1. Configure nodes with `make configure`
1. Set up local environment `make local`
1. Connect to docker manager `. ./tools/set-docker-socket.sh`
1. Verify the swarm looks ok `docker node ls`
1. Close connection to the docker manager `. ./tools/close-docker-socket.sh`

