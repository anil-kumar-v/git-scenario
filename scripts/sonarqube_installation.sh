#!/bin/bash
# Sonarqube won’t run with root user 
# Create a user by using command  useradd <name> Ex: useradd sonaradmin
# install java
amazon-linux-extras install java-openjdk11
# open the /opt to download any third-party applications
cd /opt
# download the sonarqube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.7.52159.zip
# extract the package
unzip sonarqube-8.9.7.52159.zip
# Add the user
adduser sonaradmin
# check the user exist or not
id sonaradmin
# change the ownership of folder from root to sonaradmin
chown -R sonaradmin:sonaradmin sonarqube-8.9.7.52159
# open the sonarqube-8.9.7.52159
cd sonarqube-8.9.7.52159/
# list the files and open the /bin 
cd bin
# open the linux-x86-64
cd linux-x86-64/
# change the permissions
chmod -R 777 /opt/sonarqube-8.9.7.52159/
# switch to sonaradmin user
su - sonaradmin
# open the /sonarqube-8.9.7.52159/bin/linux-x86-64/
cd /sonarqube-8.9.7.52159/bin/linux-x86-64/
# start the sonarqube
./sonar.sh start
# check the status
./sonar.sh status
#then access the webpage by using public Ip
#default credentials:
#username: admin
#passwd  : admin