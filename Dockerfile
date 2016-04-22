FROM sawyerlin/docker-x11-app
MAINTAINER Sawyer LIN <sawyer.lin@gmail.com>

RUN wget -P /tmp http://download.qt.io/archive/qt/5.6/5.6.0/single/qt-everywhere-opensource-src-5.6.0.tar.gz
RUN cd /tmp && tar -xvzf qt-everywhere-opensource-src-5.6.0.tar.gz && rm qt-everywhere-opensource-src-5.6.0.tar.gz
RUN cd /opt && mkdir qt-build-5.6 && mkdir qt-5.6 && cd qt-build-5.6 && /tmp/qt-everywhere-opensource-src-5.6.0/configure -opensource -confirm-license -qt-xcb  -prefix /opt/qt-5.6 && cd ../qt-build-5.6 && make && make install

RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

RUN echo PATH=\"$PATH:/opt/qt-5.6/bin\" > /etc/environment

ADD . /src

EXPOSE 22

CMD ["/bin/bash", "/src/startup.sh"]
