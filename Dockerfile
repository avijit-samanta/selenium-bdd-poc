FROM ubuntu
MAINTAINER Avijit Samanta

# Update and install s/w
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk git pip wget unzip curl 
 
#Upgrade pip, install Git & VNC 	
RUN pip install --upgrade pip \
        && apt-get update \
	      && apt-get install -y git x11vnc 
