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

  # Common provisioning for all VMs
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y python
  SHELL

  # Define Multi-Machine environment
  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.56.100"
    master.vm.hostname = "master"

    # Install ansible and supporting packages
    master.vm.provision "shell", inline: <<-SHELL
      apt-get install -y software-properties-common
      apt-add-repository -y ppa:ansible/ansible
      apt-get update
      apt-get install -y ansible python-netaddr
    SHELL

  end

  config.vm.define "web1" do |web1|
    web1.vm.network "private_network", ip: "192.168.56.110"
    web1.vm.hostname = "web1"
  end

  config.vm.define "web2" do |web2|
    web2.vm.network "private_network", ip: "192.168.56.115"
    web2.vm.hostname = "web2"
  end

  config.vm.define "db1" do |db1|
    db1.vm.network "private_network", ip: "192.168.56.120"
    db1.vm.hostname = "db1"
  end

  config.vm.define "db2" do |db2|
    db2.vm.network "private_network", ip: "192.168.56.125"
    db2.vm.hostname = "db2"
  end

end
