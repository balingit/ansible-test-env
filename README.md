# ansible-test-env

This creates a test sandbox for ansible. It consist of a control machine, and 4 managed
nodes. 

A private network is added for networking between VMs. Static IPs are assigned and the IP
addresses will depend on the virtualbox Host-Only Etherner Adapter CIDR. In this example, the
CIDR is 192.168.56.0/24.

Provisioning is via Ansible Local.  Ansible is first installed on the control VM,
then ansible is run on the control VM for provisioning.

# Requirements

+ vagrant
+ virtualbox

# Private key file

Since this is a test environment in a private network, the vagrant ssh keys are used instead of
generating ssh keys. The private keys are mounted on /machines and the ansible_ssh_private_key_file
parameter is used in the inventory file

# Testing

Run:
+ vagrant ssh master
+ ansible -i /vagrant/inventory all -m ping

# Dynamic inventory

To use dynamic inventory in Ansible, provision the dynamic.yml playbook on the master VM.
It installs cobbler, apache, and dependent packages, donwloads the Ansible contrib files 
cobbler.py and cobbler.ini, adds cobbler entries, and creates host and group variable files.

## Provisioning

Run on master:

ansible-playbook /vagrant/dynamic.yml

## Testing

ansible -i /etc/ansible/cobbler.py all -m ping

