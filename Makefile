SHELL := /bin/bash

roles:
	@[ -z "$$BOBNET_NO_ROLES" ] && ansible-galaxy install -r requirements.yml -p roles || true

bootstrap: roles
	vagrant up --provision

configure: roles
	ansible-playbook --ask-vault-pass configure.yml

local: roles
	ansible-playbook --ask-vault-pass local.yml

docker-connect:
	@echo "Run: . ./tools/set-docker-socket.sh"

docker-close:
	@echo "Run: . ./tools/close-docker-socket.sh"

.PHONY: roles bootstrap configure local
