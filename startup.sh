#!/bin/bash

mkdir /var/run/sshd

DOCKER_PASSWORD=`pwgen -c -n -1 12`
echo User: docker Password: $DOCKER_PASSWORD
DOCKER_ENCRYPYTED_PASSWORD=`perl -e 'print crypt('"$DOCKER_PASSWORD"', "aa"), "\n"'`
useradd -m -d /home/docker -p $DOCKER_ENCRYPYTED_PASSWORD docker
sed -Ei 's/adm:x:4:/docker:x:4:docker/' /etc/group
adduser docker sudo

chsh -s /bin/bash docker

cd /src/config/ && sudo -u docker cp -R .[a-z]* [a-z]* /home/docker/

/etc/init.d/xdm restart

/usr/sbin/sshd -D
