#!/bin/bash
# install apache
yum install apache
#enable the apache
systemctl enable apache
#start the apache
systemctl start apache
#check the status
systemctl status apache
#check the process
ps -ef | grep -i httpd
echo "this is dev-2"
