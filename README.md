# docker-qml-app

> This docker is based on rogaha/docker-desktop which helps to run xwindows application in docker

## Ubuntu 14.04 Configuration

### prerequests

> Because the docker use Ubuntu 16.04, and the xpra of 14.04 could not connect the version of xpra on 16.04. 
> We need to install the right version of xpra 0.15.8 on ubuntu 14.04

Add the line 
    deb http://us.archive.ubuntu.com/ubuntu wily main universe
to the end of file **/etc/apt/sources.list**
    
    $ sudo apt-get update
    $ sudo apt-get install python-rencode
    $ cd /tmp
    $ wget http://xpra.org/dists/trusty/main/binary-amd64/xpra_0.15.8-3_amd64.deb

double click on this file to install xpra

> These first two articles should be fallowed to install **docker, docker-compose and dnsdocker**

[Install docker-engine and docker-compose](http://sawyerlin.github.io/#/record/2015_11_25_11_35.md)

[How to use dnsdock](http://sawyerlin.github.io/#/record/2015_11_26_12_38.md)

> Then install these tools on your local machine

    $ sudo apt-get install xpra ssh sshpass

[Disable strict host key checking](http://askubuntu.com/questions/87449/how-to-disable-strict-host-key-checking-in-ssh/385187)

### Usage

    $ ./kickoff

Then the script **qmlLancher** is generate, execute

    $ ./qmlLancher

to run your qml application
