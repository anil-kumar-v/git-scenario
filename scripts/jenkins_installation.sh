#!/bin/bash
# Downloading the local jenkins repo
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# Enabling the key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
# installing the EPEL fo java
amazon-linux-extras install epel -y
# installing the java
amazon-linux-extras install java-openjdk11 -y
yum install epel-release
yum install java-11-openjdk-devel -y
# installing the jenkins
yum install jenkins -y
# start the jenkins
service jenkins start
# enable the jenkins
chkconfig jenkins on
# to display the default password to install jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword