#!/bin/bash
cobbler system remove --name=web1 
cobbler system remove --name=web2 
cobbler system remove --name=db1 
cobbler system remove --name=db2 
cobbler profile remove --name=web
cobbler profile remove --name=db
cobbler distro remove --name=ubuntu
