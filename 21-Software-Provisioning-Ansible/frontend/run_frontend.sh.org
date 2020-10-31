#!/bin/bash

yum update -y 
yum install httpd -y 
systemctl start httpd 
systemctl enable httpd 

mkdir -p /var/www/html/terraform
echo "Welcome to the world of Terraform" > /var/www/html/terraform/01-Hello.html


