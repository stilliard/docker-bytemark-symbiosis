#!/bin/bash

site=demo.com

# make directory structure
mkdir -p /srv/$site/{config,public/{htdocs,logs}}

# add a demo index.html file
echo "<h1>Success symbiosis!</h1>" > /srv/$site/public/htdocs/index.html

# add ip
echo "127.0.0.1" > /srv/$site/config/ip

# set permissions
chown admin:admin /srv/$site/ -R
chown admin:www-data /srv/$site/public/htdocs -R
chmod 775 /srv/$site/public/htdocs -R

# run symbiosis configuration scripts to do the rest
symbiosis-httpd-configure -v

