Jenkins Complete Setup in AMZN LINUX AMI
----------------------------------------

sudo yum update -y 
sudo yum install java-17-amazon-corretto.x86_64 java-17-amazon-corretto-devel.x86_64 java-17-amazon-corretto-headless.x86_64 wget git tree -y  

wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip
unzip apache-maven-3.9.6-bin.zip
sudo cp -r apache-maven-3.9.6 /opt/

echo "#SET UP JAVA AND MAVEN" >> .bashrc
echo "JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto.x86_64" >> .bashrc
echo "M2_HOME=/opt/apache-maven-3.9.6/bin" >> .bashrc
echo "export JAVA_HOME" >> .bashrc
echo "export M2_HOME" >> .bashrc
echo "PATH=$PATH:$JAVA_HOME:$M2_HOME" >> .bashrc
echo "export PATH" >> .bashrc

source .bashrc

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum -y install jenkins
sudo service jenkins start
sudo chkconfig jenkins on

echo "#SETTING UP JENKINS WORKSPACE" >> .bashrc
echo "JENKINS_WORKSPACE=/var/lib/jenkins/workspace" >> .bashrc
echo "export JENKINS_WORKSPACE">> .bashrc
echo "WEBSERVER_PATH=/var/www/html">> .bashrc
echo "export WEBSERVER_PATH">> .bashrc

source .bashrc
