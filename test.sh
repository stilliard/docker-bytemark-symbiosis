#!/bin/bash

# make directory structure
mkdir -p /srv/demo.com/{config,public/{htdocs,logs}}

# add a demo index.html file
echo "<h1>Success symbiosis!</h1>" > /srv/demo.com/public/htdocs/index.html

# add ip
echo "127.0.0.1" > /srv/demo.com/config/ip

# set permissions
chown admin:admin /srv/demo.com/ -R
chown admin:www-data /srv/demo.com/public/htdocs -R
chmod 775 /srv/demo.com/public/htdocs -R

# run symbiosis configuration scripts to do the rest
symbiosis-httpd-configure -v

