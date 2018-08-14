# ansible-test-env

This creates a test sandbox for ansible. It consist of a control machine, and 4 managed
nodes. Python 2 is installed on all VMs, and ansible is installed on the control machine.

A private network is added for networking between VMs. Static IPs are assigned and the IP
addresses will depend on the virtualbox Host-Only Etherner Adapter CIDR. In this example, the
CIDR is 192.168.56.0/24.

# Requirements

+ vagrant
+ virtualbox
