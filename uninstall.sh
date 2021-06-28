#!/bin/bash

echo "Jenkins + Filebeat + Elastic Stack Clean Unistallation"
echo '====================================================='
echo "Warning!! This will remove all service, Network & Volume" 
read -p "Continue uninstallation ? (Y/N) " confirmation

if [[ $confirmation == "Y" || $confirmation == "y" ]]; then

	echo REMOVING ELASTIC STACK
	cd elastic-stack/ && docker-compose down && cd ../
	echo

	echo REMOVING JENKINS WITH FILEBEAT
	cd jenkins-preconfigured/ && docker-compose down && cd ../
	echo

	echo Please wait for docker to finish remove
	sleep 5

	echo REMOVING INTERNAL NETWORK
	docker network rm internal_network
	echo

	echo REMOVING VOLUME
	docker volume rm elastic-stack_elasticsearch
	docker volume rm jenkins-preconfigured_jenkins-home
	docker volume rm jenkins-preconfigured_jenkins-logs

	echo "Done Uninstalling Jenkins + Elastic to reinstall run install.sh"

else

	echo "Uninstallation cancelled"

fi
