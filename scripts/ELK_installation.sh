#!/bin/bash
# This script is for ubuntu os---machine atlleast t2.xlarge
# update the system
apt-get update 
# upgrade the system
apt-get upgrade -y
# Install the WGET
apt-get install wget -y
# Download and install public signing key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# Install apt-transport-https package
sudo apt-get install apt-transport-https -y
# Save directory definitions
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
# Update and Install elasticsearch
sudo apt-get update && sudo apt-get install elasticsearch && sudo apt-get install logstash && sudo apt-get install kibana
#  configure elasticsearch
nano /etc/elasticsearch/elasticsearch.yml
# change cluster name
# cluster.name: demo-elk  
# give the cluster a descriptive name
# node.name: elk-1 
# change network binding
# network.host: 0.0.0.0  
# setup discovery.type as single node
# discovery.type: single-node
# Start Elasticsearch service
sudo systemctl start elasticsearch
# validate Elasticsearch cluster health
curl -XGET http://localhost:9200/_cluster/health?pretty

# configure kibana
nano /etc/kibana/kibana.yml
# uncomment server.port
# server.port: 5601
# server base url however this needs to be corrected everytime you start and stop the server
# server.publicBaseUrl: "http://192.168.1.3:5601/"
# change server.host
# server.host: "0.0.0.0"
# change server.name
# server.name: "demo-kibana"
# uncomment elasticsearch.host
# elasticsearch.hosts: ["http://localhost:9200"]

# start kibana
systemctl start kibana
# enable elasticsearch and kibana
systemctl enable elasticsearch
systemctl enable kibana