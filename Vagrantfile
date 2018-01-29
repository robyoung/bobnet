# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # Create a private network address on a link-local address for NFS
  config.vm.network "private_network", ip: "169.254.0.3"

  # Create a shared folder for sending the built images back to the host
  config.vm.synced_folder "./images", "/built-images", create: true

  config.vm.provision "shell", inline: "apt-get -y install python-minimal"

  config.vm.provision "ansible" do |ansible|
    ansible.ask_vault_pass = true
    ansible.verbose = "1"
    ansible.playbook = "playbooks/bootstrap.yml"
    ansible.galaxy_roles_path = "roles"
  end
end
