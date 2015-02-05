
FROM stilliard/pure-ftpd

MAINTAINER Andrew Stilliard andrew.stilliard@gmail.com

# initial setup and tools (inc vim)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential wget curl less vim

# install symbiosis
RUN echo "deb http://symbiosis.bytemark.co.uk/wheezy ./\n\
deb-src http://symbiosis.bytemark.co.uk/wheezy ./" > /etc/apt/sources.list.d/symbiosis.list
RUN wget -O- https://secure.bytemark.co.uk/key/repositories-2006.key | apt-key add -
RUN apt-get -y update
RUN apt-get -y install bytemark-symbiosis

# Enable the ssl localhost (for the apache2 https test, as without this is would randomly fail about 4 out of 5 times...)
RUN a2ensite default-ssl && a2enmod ssl

CMD service bytemark-symbiosis start && \
    symbiosis-monit && \
    /bin/bash

EXPOSE 80 21/tcp
