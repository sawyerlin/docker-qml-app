FROM sawyerlin/docker-x11-app
MAINTAINER Sawyer LIN <sawyer.lin@gmail.com>

RUN wget -P /tmp http://download.qt.io/archive/qt/5.3/5.3.2/single/qt-everywhere-opensource-src-5.3.2.tar.gz
RUN cd /tmp && tar -xvzf qt-everywhere-opensource-src-5.3.2.tar.gz && rm qt-everywhere-opensource-src-5.3.2.tar.gz
RUN cd /opt && mkdir qt-build-5.3 && mkdir qt-5.3 && cd qt-build-5.3 && /tmp/qt-everywhere-opensource-src-5.3.2/configure -opensource -confirm-license -qt-xcb  -prefix /opt/qt-5.3 && cd ../qt-build-5.3 && make && cd && make install

RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

ADD . /src

EXPOSE 22

CMD ["/bin/bash", "/src/startup.sh"]
