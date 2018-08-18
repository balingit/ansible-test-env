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

  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.56.100"
    master.vm.hostname = "master"
    # Work around so private keys are mode 600
    master.vm.synced_folder "./.vagrant/machines", "/machines", mount_options: ["dmode=775,fmode=600"]

    # Provisioning using ansible on master
    master.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "provision.yml"
    end

    # Provisioning using ansible on all other nodes
    master.vm.provision "ansible_local" do |ansibl2|
      ansibl2.playbook = "provision.yml"
      ansibl2.limit = "nodes"
      ansibl2.inventory_path = "provision_inventory"
    end
  end

end
