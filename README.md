# redriverapp
Demo application in JSP and bootstrap to display students List

Installation Instructions:

Install MYSQL server .
sudo apt-get install mysql-server
sudo service mysql start
sudo service mysql status

#Create DB User
mysql -u root -p
SET PASSWORD = PASSWORD('root');


Once SQL DB server is set with user root having password root , 

go to https://github.com/phande3 .

Download zip file of redriverapp in your local machine
Download Zip file of redriverapi in your local machine

Extract redriverapi
====================
cd <extracted folder>/target
java -jar redriverapidemo-0.0.1-SNAPSHOT.jar

====================
Extract redriverapp

cd <extracted folder>/target
java -jar  redriverwebappdemo-0.0.1-SNAPSHOT.war
  
Finally , Enter the URL in your browser as http://localhost:9090/  
