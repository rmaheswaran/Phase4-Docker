# Docker

The SCSB Middleware codebase and components are all licensed under the Apache 2.0 license, with the exception of a set of API design components (JSF, JQuery, and Angular JS), which are licensed under MIT X11.

[Docker](https://www.docker.com/why-docker) is an open-source software platform to create, deploy and manage virtualized application containers on a common operating system (OS). The SCSB(Shared Collections Service Bus) application runs with docker containers running up and dependent on each other. Each container provides a microservice project which are built as separate images. All the micro services which are used in SCSB applications are given under respective modules.

### Prerequisites
Ubuntu environment with [Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/) and JAVA 8 installed.

### Installation
This project can be cloned using the command :  
```sh
git clone https://github.com/ResearchCollectionsAndPreservation/docker.git
```

To build and run each Dockerfile,a docker build and docker run command must be used.  

#### To build a docker image :  
```sh
docker build -t {image-name} . (current directory)
```
#### To run a docker container :  
```sh
docker run --name {container-name} -v /path-to-local-directory:/path-to-container-directory -p {localhost port}:{container port} -d {image-name}
```  
The images available under this Docker repositories are :  

1.[scsb-base](#scsb-base)     
2.[scsb-mysql](#scsb-mysql)    
3.[scsb-solr-base](#scsb-solr-base)    
4.[scsb-solr-server](#scsb-solr-server)  
5.[scsb-cas](#scsb-cas)    
6.[scsb-activemq-base](#scsb-activemq-base)  
7.[scsb-activemq](#scsb-activemq)  
8.[scsb-zookeeper-base](#scsb-zookeeper-base)  
9.[scsb-zookeeper](#scsb-zookeeper)  
10.[scsb](#scsb)  
11.[scsb-solr-client](#scsb-solr-client)  
12.[scsb-circ](#scsb-circ)  
13.[scsb-etl](#scsb-etl)  
14.[scsb-shiro](#scsb-shiro)  
15.[scsb-ui](#scsb-ui)  
16.[scsb-batch-scheduler](#scsb-batch-scheduler)  
17.[jenkins](#jenkins)  
18.[scsb-javadocs](#scsb-javadocs)  

[scsb-log4j](#scsb-log4j)  

[scsb-persistence](#scsb-persistence)  -- This is no longer used.

### SCSB-BASE  
SCSB-BASE is the base image for building SCSB application.This image builds on Ubuntu and installs GIT,JAVA and GRADLE.
This image will be used as the base image for almost all the other images.
#### To build scsb-base image :  
Goto [scsb-base](scsb-base) where the Dockerfile is available and run the below command to build the base image  
```sh
docker build -t scsb-base .  
```
### SCSB-MYSQL
SCSB-MYSQL is an docker image which will install MySQL and all the database schema/scripts needed for SCSB application will be created and maintained [here](scsb-mysql)
#### To build the scsb-mysql image :
Goto to [scsb-mysql](scsb-mysql) and run the below command to build the scbs-mysql image
```sh
docker build -t scsb-mysql .  
```
#### to run the scsb-mysql container :
```sh
docker run --name scsb-mysql -v /data/mysql-data:/var/lib/mysql -p 3306:3306 -d scsb-mysql
```
### SCSB-SOLR-BASE  
SCSB-SOLR-BASE builds from the base image and installs Apache Solr Server.
#### To build the scsb-solr-base image :  
Goto [scsb-solr-base](scsb-solr-base) and run the below command
```sh
docker build -t scsb-solr-base .  
```
### SCSB-SOLR-SERVER
Apache solr server configuration files are managed here.
#### To build the scbs-solr-server image
Goto to [scsb-solr-server](scsb-solr-server) and the below command
```sh
docker build -t scsb-solr-server .  
```

#### To run the scsb-solr-server container
```sh
docker run --name scsb-solr-server -v /data/solr-data:/var/data/solr -p 8983:8983 -d scsb-solr-server  
```
### PHASE4-SCSB-CAS
SCSB-CAS image manages the configuration files for CAS Authentication

#### To build the scsb-cas image :  
Goto [phase4-scsb-cas](phase4-scsb-cas) and run the below command  
```sh
docker build -t scsb-cas .  
```

#### To run the scsb-cas conatiner :
```sh
docker run --name scsb-cas -p ${port} -p ${sslport} -e "DB_HOST=${DB_HOST}" -e "DB_USERNAME=${DB_USERNAME}" -e "DB_PASSWORD=${DB_PASSWORD}" -d scsb-cas  
```
### SCSB-ACTIVEMQ-BASE
SCSB-ACTIVEMQ-BASE image is build from scsb-base image.This image downloads and installs ActiveMQ.

### To build scsb-activemq-base :
Goto [scsb-activemq-base](scsb-activemq-base) and run the below command.
```sh
docker build -t scsb-activemq-base .
```
### SCSB-ACTIVEMQ
This image mananges all the configuration files for ActiveMQ.

#### To build the scsb-activemq image :  
Goto [scbs-activemq](scbs-activemq) and run the below command  
```sh
docker build -t scsb-activemq .
```
#### To run a scsb-activemq container :
```sh
docker run --name scsb-activemq -v /data/activemq-dev-data:/opt/activemq/data  -p 8161:8161 -p 61616:61616 -p 1099:1099 -d scsb-activemq  
```
### SCSB-ZOOKEEPER-BASE
This image downloads Apache Zookeeper.

#### To build the scsb-zookeeper-base :  
```sh
docker build -t scsb-zookeeper-base .
```

### SCSB-ZOOKEEPER
The environment variable and configurations needed for Apache Zookeeper are managed here.

#### To build a scsb-zookeeper image :
Goto [scsb-zookeeper](scsb-zookeeper) and run the below command  
```sh
docker build -t scsb-zookeerper .
```
#### To run a scsb-zookeeper container :
```sh
docker run --name scsb-zookeeper  -e "ZOO_MY_ID=?" -e "ZOO_SERVERS=server.1=? server.2=? server.3=?" -v ${MOUNT_DIR}/conf:/opt/scsb-zookeeper/conf -v ${MOUNT_DIR}/data:/opt/scsb-zookeeper/data -v ${MOUNT_DIR}/log:/opt/scsb-zookeeper/datalog  -p ${CLIENT_PORT} -p ${SYNC_PORT_1} -p ${SYNC_PORT_2} -d scsb-zookeeper  
```
### PHASE4-SCSB-GATEWAY
This image is build from the scsb-base image.This image clones the [PHASE4-SCSB-GATEWAY](https://github.com/ResearchCollectionsAndPreservation/Phase4-SCSB-Gateway) github project and starts the application when a container is created.

#### To build the phase4-scsb-gateway image :  
Goto [phase4-scsb-gateway](phase4-scsb-gateway) and run the below command :  
```sh
docker build -t scsb .
```
#### To run a phase4-scsb-gateway container :
```sh
docker run --name scsb -v ${mountVolume}  -p ${port} -e "ENV=-XX:+HeapDumpOnOutOfMemoryError -Dspring.config.location=?  -Dorg.apache.activemq.SERIALIZABLE_PACKAGES="*"" -d scsb  
```
### PHASE4-SCSB-DOC
This image is build from the scsb-base image.This image clones the [PHASE4-SCSB-DOC](https://github.com/ResearchCollectionsAndPreservation/Phase4-SCSB-Doc) github project and starts the application when a container is created.
#### To build the phase4-scsb-doc image :  
Goto [phase4-scsb-doc](phase4-scsb-doc) and run the below command :  
```sh
docker build -t scsb-solr-client .
```
#### To run a phase4-scsb-doc container :
```sh
docker run --name scsb-solr-client --link scsb-activemq:activemq -v ${dataDir}  -p ${port} -e "ENV=-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/data/heapdumps/scsb-solr-client -Dorg.apache.activemq.SERIALIZABLE_PACKAGES="*" -Dspring.config.location=?" -d scsb-solr-client  
```

### PHASE4-SCSB-CIRC
This image is build from the scsb-base image.This image clones the [PHASE4-SCSB-CIRC](https://github.com/ResearchCollectionsAndPreservation/Phase4-SCSB-Circ) github project and starts the application when a container is created.
#### To build the phase4-scsb-circ image :  
Goto [phase4-scsb-circ](phase4-scsb-circ) and run the below command :  
```sh
docker build -t scsb-circ .
```
#### To run a phase4-scsb-circ container :
```sh
docker run --name scsb-circ --link scsb-mysql:mysql --link scsb-solr-client:scsb-solr-client --link scsb-activemq:activemq  -v ${dataDir}  -p ${port} -e "ENV=  -XX:+HeapDumpOnOutOfMemoryError  -Dorg.apache.activemq.SERIALIZABLE_PACKAGES="*" -Dspring.config.location=?" -d scsb-circ  
```
### PHASE4-SCSB-ETL
This image is build from the scsb-base image.This image clones the [PHASE4-SCSB-ETL](https://github.com/ResearchCollectionsAndPreservation/Phase4-SCSB-ETL) github project and starts the application when a container is created.
#### To build the phase4-scsb-etl image :  
Goto [phase4-scsb-etl](phase4-scsb-etl) and run the below command :  
```sh
docker build -t scsb-etl .
```
#### To run a scsb-etl container :
```sh
docker run --name scsb-etl --link scsb-mysql:mysql -v ${pendingDir}  -p ${port} -e "ENV=-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/data/heapdumps/scsb-etl -Xmx4g -Xms256m -Dorg.apache.activemq.SERIALIZABLE_PACKAGES="*"  -Dspring.config.location=?" -d scsb-etl 
```
### PHASE4-SCSB-AUTH
This image is build from the scsb-base image.This image clones the [PHASE4-SCSB-AUTH](https://github.com/ResearchCollectionsAndPreservation/Phase4-SCSB-Auth) github project and starts the application when a container is created.
#### To build the phase4-scsb-auth image :  
Goto [phase4-scsb-auth](phase4-scsb-auth) and run the below command :  
```sh
docker build -t scsb-shiro .
```
#### To run a phase4-scsb-auth container :
```sh
docker run --name scsb-shiro --link scsb-mysql:mysql -v ${mountdir}  -p ${port} -e "ENV=-XX:+HeapDumpOnOutOfMemoryError  -Dspring.config.location=?" -d scsb-shiro
```

### PHASE4-SCSB-UI
This image is build from the scsb-base image.This image clones the [PHASE4-SCSB-UI](https://github.com/ResearchCollectionsAndPreservation/Phase4-SCSB-UI) github project and starts the application when a container is created.
#### To build the phasescsb-ui image :  
Goto [phase4-scsb-ui](phase4-scsb-ui) and run the below command :  
```sh
docker build -t scsb-ui .
```
#### To run a scsb-ui container :
```sh
docker run --name scsb-ui --link scsb-mysql:mysql --link scsb-solr-client:scsb-solr-client --link scsb:scsb --link scsb-shiro:scsb-shiro --link  -v ${mountdir}  -p ${port} -e "ENV=-XX:+HeapDumpOnOutOfMemoryError -Dspring.config.location=?" -d scsb-ui
```
### JENKINS
[JENKINS](https://jenkins.io/) is used as an automation tool for deployment and run other jenkins jobs as necessary.

#### To build the jenkins image :  
Goto [jenkins](jenkins) and run the below command :  
```sh
docker build -t scsb-jenkins .
```
#### To run a scsb-jenkins container :
```sh
docker run --name scsb-jenkins -v /data/jenkins:/var/lib/jenkins -p 8080:8080 -d scsb-jenkins
```
To get the administrative password :  
```sh
#Get inside the container
docker exec -it scsb-jenkins bin/bash  
#Goto  
cd /data  
#Type the below command,tt displays the password
sudo tail jenkins/secrets/initialAdminPassword
```
### PHASE4-SCSB-BATCH-SCHEDULER
This image is build from the scsb-base image.This image clones the [PHASE4-SCSB-BATCH-SCHEDULER](https://github.com/ResearchCollectionsAndPreservation/Phase4-SCSB-Batch-Scheduler) github project and starts the application when a container is created.
#### To build the phase4-scsb-batch-scheduler image :  
Goto [phase4-scsb-batch-scheduler](phase4-scsb-batch-scheduler) and run the below command :  
```sh
docker build -t scsb-batch-scheduler .
```
#### To run a phase4-scsb-batch-scheduler container :
```sh
docker run --name scsb-batch-scheduler --link scsb-mysql:mysql --link scsb-solr-client:scsb-solr-client --link scsb-circ:scsb-circ --link scsb-activemq:activemq -v ${mountVolume}  -p ${port} -e "ENV= -XX:+HeapDumpOnOutOfMemoryError -Dspring.config.location=?" -d scsb-batch-scheduler
```
### SCSB-JAVADOCS
This image generates the javadocs for all the projects based on the war file built.  

#### To create a scsb-javadocs image :  
Goto [scsb-javadocs](scsb-javadocs) and run the below command  
```sh
docker build -t scsb-javadocs .  
```
#### To run a scsb-javadocs container :  
```sh  
docker run --name scsb-javadocs -p ${port} -d scsb-javadocs
```

### SCSB-LOG4J
[scsb-log4j](scsb-log4j) folder contains the log file configurations for all the projects.  
