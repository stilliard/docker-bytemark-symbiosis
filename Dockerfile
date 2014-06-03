
FROM stilliard/pure-ftpd

MAINTAINER Andrew Stilliard andrew.stilliard@gmail.com

# initial setup and tools (inc vim)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential wget curl less vim

# install symbiosis
RUN echo "deb http://symbiosis.bytemark.co.uk/wheezy-rc3 ./" > /etc/apt/sources.list.d/symbiosis.list
RUN wget -O- https://secure.bytemark.co.uk/key/repositories-2006.key | apt-key add -
RUN apt-get -y update
RUN apt-get -y install bytemark-symbiosis

# turn off monitoring on pure-ftp
RUN rm /etc/symbiosis/monit.d/pure-ftpd

CMD /project/test.sh

EXPOSE 80 21/tcp
