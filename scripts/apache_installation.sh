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
<<<<<<< HEAD
echo "this is dev-2"
=======
echo "This is devloper-1"
echo "this is devloper-1 modified 2nd time"
>>>>>>> 3bfa1c17222a02893b6a69dff51e19eb6b5e1ff7
