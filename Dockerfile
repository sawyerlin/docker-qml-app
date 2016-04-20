FROM ubuntu:16.04
MAINTAINER Sawyer LIN <sawyer.lin@gmail.com>

RUN apt-get update -y
RUN apt-get upgrade -y

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y xpra rox-filer openssh-server pwgen xserver-xephyr xdm fluxbox xvfb sudo software-properties-common python-software-properties ffmpeg build-essential libgl1-mesa-dev

RUN sed -i 's/DisplayManager.requestPort/!DisplayManager.requestPort/g' /etc/X11/xdm/xdm-config
RUN sed -i '/#any host/c\*' /etc/X11/xdm/Xaccess
RUN echo X11Forwarding yes >> /etc/ssh/ssh_config

RUN sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd

RUN dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

RUN apt-get -y install fuse || :
RUN rm -rf /var/lib/dpkg/info/fuse.postinst
RUN apt-get -y install fuse

RUN wget -P /tmp http://download.qt.io/archive/qt/5.3/5.3.2/single/qt-everywhere-opensource-src-5.3.2.tar.gz
RUN cd /tmp && tar -xvzf qt-everywhere-opensource-src-5.3.2.tar.gz && rm qt-everywhere-opensource-src-5.3.2.tar.gz
RUN cd /opt && mkdir qt-build-5.3 && mkdir qt-5.3 && cd qt-build-5.3 && /tmp/qt-everywhere-opensource-src-5.3.2/configure -opensource -confirm-license -qt-xcb  -prefix /opt/qt-5.3 && cd ../qt-build-5.3 && make && cd ../qt-5.3 && make install
RUN echo $'PATH=/opt/qt-5.3/bin:$PATH\nexport PATH' > /home/docker/.profile

#RUN apt-get install -y qt-sdk qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin qmlscene qtdeclarative5-qtmultimedia-plugin qtdeclarative5-localstorage-plugin qtmultimedia5-dev libqt5qml-graphicaleffects gstreamer0.10-ffmpeg gstreamer0.10*

RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

ADD . /src

EXPOSE 22

CMD ["/bin/bash", "/src/startup.sh"]
