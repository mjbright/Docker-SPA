FROM ubuntu:trusty
MAINTAINER Michael Bright <dockerfiles@mjbright.net>

RUN apt-get update
#RUN cat /etc/apt/sources.list
#RUN sed -i.bak 's/^deb-src/# deb-src/' /etc/apt/sources.list
#RUN cat /etc/resolv.conf

#RUN grep -v "^#" /etc/apt/sources.list
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Install packages
RUN mkdir -p /var/run/sshd 
RUN chmod 7555 /var/run/sshd 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server
# Fix for ssh login issue: (Exit 254 immediately after successful authenticn)
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install tar build-essential curl git-core

# Misc:
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install vim sudo

# Add Node.js / MongoDB:
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs npm
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mongodb

# Add JSLint:
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install default-jdk wget zip unzip

# Add HTML tidy:
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install tidy tidy-doc
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install tidy tidy-doc csstidy; exit 0

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g jquery
RUN npm install -g nodeunit
RUN npm install -g connect

# Added for basic testing:
RUN npm install -g serve-static
RUN npm install -g http-server

# Added for basic testing:
RUN npm install -g express
RUN npm install -g express-logger
RUN npm install -g mongodb
RUN npm install -g socket.io
RUN npm install -g JSV
RUN npm install -g q
RUN npm install -g promised-io
RUN npm install -g jslint


#ADD root.bashrc /root/.bashrc
# Default command
CMD bash

RUN adduser --gecos "" --disabled-password user
#RUN adduser --gecos "" --ingroup rvm --disabled-password user
ADD user.bashrc /home/user/.bashrc
RUN echo 'user:user' |chpasswd

RUN chmod 755 /home/user/.bashrc

RUN adduser user sudo

ADD jslint.sh /home/user/jslint.sh
RUN /home/user/jslint.sh -install

EXPOSE 22
EXPOSE 3000

# Restart ssh server and loop - login via ssh
ENTRYPOINT /etc/init.d/ssh start; while true; do sleep 60; done


