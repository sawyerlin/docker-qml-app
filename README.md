# docker-qml-app

> This docker is based on rogaha/docker-desktop which helps to run xwindows application in docker

## Ubuntu 14.04 Configuration

### prerequests

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
