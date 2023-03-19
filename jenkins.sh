#!/bin/bash
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg --yes
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install openjdk-11-jdk -y
sudo apt install jenkins -y
sudo systemctl start jenkins.service
echo -e "Jenkins URL:\n$(curl http://checkip.amazonaws.com):8080\nInitial Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword