# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "1"
    vb.linked_clone = true
  end

  # Define Multi-Machine environment
  (1..2).each do |x|
    config.vm.define "web#{x}" do |web|
      web.vm.network "private_network", ip: "192.168.56.11#{x}"
      web.vm.hostname = "web#{x}"
    end
  end

  (1..2).each do |y|
    config.vm.define "db#{y}" do |db|
      db.vm.network "private_network", ip: "192.168.56.12#{y}"
      db.vm.hostname = "db#{y}"
    end
  end

  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.56.100"
    master.vm.hostname = "master"
    # Work around so private keys are mode 600
    master.vm.synced_folder "./.vagrant/machines", "/machines", mount_options: ["dmode=775,fmode=600"]

    # Provisioning using ansible on master
    master.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "provision.yml"
    end
  end

end
