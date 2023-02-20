#!/bin/bash
# Auth: Deix
# Date 02/18/2023

## This is a script to install sonarqube

sudo yum update -y # to update the system
sudo yum install java-11-openjdk-devel -y ## to install java
sudo yum install java-11-openjdk -y
cd /opt ## to change to opt
sudo yum install wget -y ## to install wget
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld