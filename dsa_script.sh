#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo bash -c 'echo Web Sever com IaC na Terraform e AWS > /var/www/html/index.html'
