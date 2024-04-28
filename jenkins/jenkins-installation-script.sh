#Jenkins Complete Setup in AMZN LINUX AMI

#! /bin/bash
sudo yum update -y 
sudo yum install java-17-amazon-corretto.x86_64 java-17-amazon-corretto-devel.x86_64 java-17-amazon-corretto-headless.x86_64 wget git tree -y  

wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip
unzip apache-maven-3.9.6-bin.zip
sudo cp -r apache-maven-3.9.6 /opt/

echo "#SET UP JAVA AND MAVEN" >> .bashrc #.bashrc contains terminal configurations
echo "JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto.x86_64" >> .bashrc
echo "M2_HOME=/opt/apache-maven-3.9.6/bin" >> .bashrc
echo "export JAVA_HOME" >> .bashrc  #export will make JAVA_HOME variable environment variable globally
echo "export M2_HOME" >> .bashrc
echo "PATH=$PATH:$JAVA_HOME:$M2_HOME" >> .bashrc #PATH variable stores any defined paths of shell commands globally
echo "export PATH" >> .bashrc #saving new path 

source .bashrc #reload .bashrc (bash is a shell and rc is remote control)

sudo wget -O /etc/yum.repos.d/.jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo #-O in wget we can define path where particular file can be donwloaded
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key #key is required to read the repo

sudo yum -y install jenkins
sudo service jenkins start
sudo chkconfig jenkins on  #chkconfig which will ensure jenkins services is always on

echo "#SETTING UP JENKINS WORKSPACE" >> .bashrc
echo "JENKINS_WORKSPACE=/var/lib/jenkins/workspace" >> .bashrc
echo "export JENKINS_WORKSPACE">> .bashrc
echo "WEBSERVER_PATH=/var/www/html">> .bashrc
echo "export WEBSERVER_PATH">> .bashrc

source .bashrc
