#!/bin/bash
cobbler distro add --name=ubuntu --kernel=/boot/vmlinuz-4.4.0-133-generic --initrd=/boot/initrd.img-4.4.0-133-generic
cobbler profile add --name=web --distro=ubuntu
cobbler profile add --name=db --distro=ubuntu
cobbler system add --name=web1 --profile=web --dns-name="web1.example.com" --interface=enp0s8
cobbler system add --name=web2 --profile=web --dns-name="web2.example.com" --interface=enp0s8
cobbler system add --name=db1 --profile=db --dns-name="db1.example.com" --interface=enp0s8
cobbler system add --name=db2 --profile=db --dns-name="db2.example.com" --interface=enp0s8
