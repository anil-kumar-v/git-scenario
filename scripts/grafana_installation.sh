#!/bin/bash
# switch to root user
sudo su -
# update the machine
yum update -y
# open the grafana repo 
sudo nano /etc/yum.repos.d/grafana.repo
# Add the below lines and save it
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
# Install the grafana
sudo yum install grafana
# re-load the process
sudo systemctl daemon-reload
# start the grafana 
sudo systemctl start grafana-server
# check the status of grafana
sudo systemctl status grafana-server
# Enable the grafana
sudo systemctl enable grafana-server.service