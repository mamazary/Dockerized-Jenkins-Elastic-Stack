# Dockerized Jenkins & Elastic Stack
This is a bash script for easy installation, provision & logging the Jenkins and Elastic Stack. Tho ship the Jenkins log, this project using filebeat and will be parsed by logstash.

## Prerequisite
This script depends on **docker** and **docker-compose**, so before running the script, kindly make sure that the server has that _service / bin_.

## Step Breakdown For Installation
1. Assign Jenkins custom variable _( username, password, server ip )_ into **.env**
2. Assign Elastic Password into **.env**
3. Create **docker internal network** so the service can communicate and compose down
won’t delete the network
4. Run **Elastic Stack** compose & build
5. Run **Jenkins Filebeat** Compose & build


## Step Breakdown For Uninstallation
1. Docker compose down for Elastic Stack to **remove the elastic container**
2. Docker compose down for Jenkins Filebeat to **remove the jenkins container**
3. Remove created **internal network**
4. **Removing volume** for elastic and jenkins

## Directory Structure
This is the tree structure of this project / repository.
```
.
|-- README.MD
|-- elastic-stack
|   |-- docker-compose.yml
|   |-- elasticsearch
|   |   |-- Dockerfile
|   |   `-- elasticsearch.yml
|   |-- kibana
|   |   |-- Dockerfile
|   |   `-- kibana.yml
|   `-- logstash
|       |-- Dockerfile
|       |-- logstash.conf
|       `-- logstash.yml
|-- install.sh
|-- jenkins-preconfigured
|   |-- docker-compose.yml
|   |-- filebeat
|   |   |-- Dockerfile
|   |   `-- filebeat.yml
|   `-- jenkins
|       |-- Dockerfile
|       |-- casc.yaml
|       `-- plugins.txt
`-- uninstall.sh
```

## Installation
The installation are straightforward, just run ``./install.sh`` and follow the instructions on the terminal.

## Uninstallation
Please run ``./uninstall.sh`` in the root directory to clean and uninstall the Jenkins + Elastic.

## Note
If kibana showing error after clicking / narrow down the log based on timestamp, kindly change the **“dateFormat:tz”** from **“Browser”** to **“UTC”** in _**Kibana Management** > **Advanced Settings** > **Timezone for date formatting**_

## License
This work is under [MIT license](https://opensource.org/licenses/MIT).
