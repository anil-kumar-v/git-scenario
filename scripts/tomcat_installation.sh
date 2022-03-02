#!/bin/bash
# Install EPEL for extra package
sudo amazon-linux-extras install epel -y
# Install java
sudo amazon-linux-extras install java-openjdk11 -y
# Download the zip/tar package 
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58-windows-x64.zip
# Extract zip 
sudo unzip apache-tomcat-9.0.58-windows-x64.zip
# Delete the zip 
sudo rm -f apache-tomcat-9.0.58-windows-x64.zip
# Rename the file
sudo mv apache-tomcat tomcat
# Give the permission
sudo chmod -R 755 /opt/tomcat
# start the Tomcat
sudo sh /opt/tomcat/bin/startup.sh
# check the status of tomcat
sudo sh /opt/tomcat/bin/status.sh


