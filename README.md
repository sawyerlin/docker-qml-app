# docker-qml-app

> This docker is based on rogaha/docker-desktop which helps to run xwindows application in docker

## Ubuntu 14.04 Configuration

### prerequests

[Install docker-engine and
docker-compose](http://sawyerlin.github.io/#/record/2015_11_25_11_35.md)

    $ sudo apt-get install xpra ssh sshpass

[disable public key
authentication](https://docs.oseems.com/general/application/ssh/disable-public-key-authentication)

### Usage

    $ ./kickoff

Then the script **qmlLancher** is generate, execute

    $ ./qmlLancher

to run your qml application
