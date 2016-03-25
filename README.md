# docker-qml-app

> This docker is based on rogaha/docker-desktop which helps to run xwindows application in docker

### Usage

    $ docker stop qml-template && docker rm qml-template && ./kickoff

> TODO: Generate qml lanch script

    $ sshpass -p $PASSWD ssh docker@$IPADDR DISPLAY=:10 qmlscene
