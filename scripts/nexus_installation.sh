#!/bin/bash
# download the nexus from the browser
wget  https://download.sonatype.com/nexus/3/nexus-3.37.3-02-unix.tar.gz
# extact the tar package
tar -xvzf nexus-3.37.3-02-unix.tar.gz
# rename the folder
mv nexus-3.37.3-02-unix nexus
# open the nexus folder
cd /nexus
# list the files and open the /bin folder
cd /bin
# Add the user
useradd nexus
# set the password for the nexus user
passwd nexus <password>
# re-type the password
# add the nexus user to sudo
vi sudo
# insert the following content into vi sudo and save it
nexus ALL=(ALL) NOPASSWD:ALL
# open the /opt folder
cd /opt
# change the ownership to the nexus and sonar-type folders to nexus user
chown -R nexus:nexus nexus
chown -R nexus:nexus sonatype-work
# open the /etc folder
cd/etc
# install the java
sudo yum install java-1.8.0-openjdk-devel
# Enabking the systemctl to nexus
vi /etc/systemd/system/nexus.service
# insert the follwing content amd save it
[Unit]
Description=nexus service
After=network.target
  
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
TimeoutSec=600
  
[Install]
WantedBy=multi-user.target

# enable the nexus
systemctl enable nexus
# restart the nexus
systemctl restart nexus
# check the status of the nexus
systemctl status nexus
#then copy the public ip of the nexus (ec2) and paste it on the browser publicip:8081
#add username: 
admin
#password : do not add password to get password in a nexus page:  
cat /opt/sonatype-work/nexus3/admin.password
# * do not disable ananymous access.

