#!/bin/bash
sudo apt update -y
sudo apt install -y wget apt-transport-https gpg
wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
sudo apt update -y 
sudo apt install temurin-17-jdk -y
/usr/bin/java --version
#jenkins

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
which jenkins 
#install docker

sudo apt-get update -y 
sudo apt-get install docker.io -y 

sudo systemctl start docker 
sudo systemctl enable docker 
which docker 
sudo apt-get update -y 

sudo usermod -aG docker ubuntu
sudo chmod 777 /var/run/docker.sock 
sudo docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
#install trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release -y 
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update -y 
sudo apt-get install trivy -y 
which trivy 