#!/bin/bash
sudo docker swarm init --advertise-addr=192.168.56.100
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
