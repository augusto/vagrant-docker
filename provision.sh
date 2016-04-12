#!/bin/sh

# Install docker

## Install pre-requisites
apt-get update
apt-get install -y apt-transport-https ca-certificates
apt-get install -y linux-image-extra-$(uname -r)

## Add docker apt repo
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" > /etc/apt/sources.list.d/docker.list

apt-get update
apt-get purge lxc-docker

## Install docker
apt-get install -y docker-engine
usermod -aG docker vagrant

## Enable user namespace
cp /vagrant/files/docker.conf /etc/systemd/system/docker.service.d/override.conf
sed -i 's/vagrant.*/vagrant:1000:65536/' /etc/subuid
sed -i 's/vagrant.*/vagrant:1000:65536/' /etc/subgid
systemctl enable docker
systemctl restart docker


# Install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo 'alias dc="docker-compose"' >> /home/vagrant/.bashrc
