#!/bin/bash
# Install the EPEL
amazon-linux-extras install epel -y
# Install the java
amazon-linux-extras install java-openjdk11 -y
# switch to root user 
# install WGET
yum install wget -y
# create a new user called prometheus user
useradd -m -s /bin/bash prometheus
# make prometheus user as root user
vi /etc/sudoers
# add prometheus to sudoers.d
# making prometheus user as rootuser make him passwordless
passwd -d prometheus
# switch to prometheus user
su - prometheus
# download the prometheus software
wget https://github.com/prometheus/prometheus/releases/download/v2.19.2/prometheus-2.19.2.linux-amd64.tar.gz
# Extract the prometheus-2.19.2.linux-amd64.tar.gz file and rename the directory to 'prometheus'.
tar -xvf prometheus-2.19.2.linux-amd64.tar.gz
mv prometheus-2.19.2.linux-amd64/ prometheus/
# Create a new 'data' directory that will be used as a 'tsdb' storage.
mkdir -p ~/prometheus/data
# Configure Prometheus As a Systemd Service
#Create new service file 'prometheus.service' using vi editor in  '/etc/systemd/system/' directory
sudo vi /etc/systemd/system/prometheus.service
# Paste the prometheus service configuration below.
[Unit]
Description=Prometheus Server
Documentation=https://prometheus.io/docs/introduction/overview/
After=network-online.target

[Service]
User=prometheus
Restart=on-failure

#Change this line if you download the
#Prometheus on different path user
ExecStart=/home/prometheus/prometheus/prometheus \
  --config.file=/home/prometheus/prometheus/prometheus.yml \
  --storage.tsdb.path=/home/prometheus/prometheus/data

[Install]
WantedBy=multi-user.target

# Now reload the systemd system using the systemctl command below.
sudo systemctl daemon-reload
# sudo Start the prometheus service and enable it to launch everytime at system startup.
sudo systemctl enable prometheus
# start the prometheus service
sudo systemctl start prometheus