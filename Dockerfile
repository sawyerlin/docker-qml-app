FROM sawyerlin/docker-x11-app
MAINTAINER Sawyer LIN <sawyer.lin@gmail.com>

RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

RUN apt-get install -y qmlscene qtdeclarative5-localstorage-plugin qml-module-qtqml-models2 qtdeclarative5-qtmultimedia-plugin

ADD . /src

EXPOSE 22

CMD ["/bin/bash", "/src/startup.sh"]
