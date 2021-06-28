#!/bin/bash

echo Jenkins + Filebeat + Elastic Stack Installation
echo '============================================='
echo 
echo JENKINS CONFIGURATION
read -p 'Please input jenkins username: ' jenkinsuser
read -sp 'Please input jenkins password: ' jenkinspassword
echo
echo Please input your server IP
read serverip
echo

echo ELASTIC STACK CONFIGURATION
read -sp 'Please input custom elastic password: ' elasticpassword

echo JENKINS_ADMIN_USER=$jenkinsuser > jenkins-preconfigured/.env
echo JENKINS_ADMIN_PASSWORD=$jenkinspassword >> jenkins-preconfigured/.env
echo JENKINS_IP=$serverip >> jenkins-preconfigured/.env

echo ELASTIC_USERNAME=elastic > elastic-stack/.env
echo ELASTIC_PASSWORD=$elasticpassword >> elastic-stack/.env

echo Thank you, All set
echo


echo CONFIGURING INTERNAL NETWORK
docker network create internal_network
echo

echo PROVISIONING ELASTIC STACK
cd elastic-stack/ && docker-compose up -d && cd ../
echo

echo PROVISIONING JENKINS WITH FILEBEAT
cd jenkins-preconfigured/ && docker-compose up -d && cd ../
echo

echo "Done Provisioning, Please wait a moment before accessing the service"

echo Jenkins URL : http://$serverip:8080/
echo Kibana URL : http://$serverip:5601/
echo
echo if kibana has an error please change dateFormat:tz to UTC
echo
