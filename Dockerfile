FROM ubuntu
MAINTAINER Avijit Samanta

#Upgrade pip, install Git & VNC 	
RUN pip install --upgrade pip \
        && apt-get update \
	      && apt-get install -y git x11vnc 
 
# Add entrypoint.sh and other available files to image
ADD . /usr/qxf2_pom
 
#Change directory and clone Qxf2 Public POM repo
RUN cd /usr/qxf2_pom \
	&& git clone https://github.com/qxf2/qxf2-page-object-model.git 
 
#Set envirnmental variable for display	
ENV DISPLAY :20
 
#Set working directory
WORKDIR /usr/qxf2_pom/qxf2-page-object-model
 
#Install requirements using requirements.txt 
RUN pip install -r requirements.txt 
 
#Provide read, write and execute permissions for entrypoint.sh and also take care of '\r' error which raised when someone uses notepad or note++ for editing in Windows.
RUN chmod 755 /usr/qxf2_pom/entrypoint.sh \
	&& sed -i 's/\r$//' /usr/qxf2_pom/entrypoint.sh
 
#Expose port 5920 to view display using VNC Viewer
EXPOSE 5920
 
#Execute entrypoint.sh at start of container
ENTRYPOINT ["/usr/qxf2_pom/entrypoint.sh"]


# Update and install s/w
#RUN apt-get update
#RUN apt-get install -y openjdk-8-jdk
#RUN apt-get install -y git maven
#RUN apt-get install -y xvfb libxi6 libgconf-2-4
#RUN apt-get install wget unzip curl


#  Install Chrome driver for Ubuntu
#RUN wget -N http://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip
#RUN unzip chromedriver_linux64.zip -d /usr/local/share
#RUN rm chromedriver_linux64.zip
#RUN chmod +x /usr/local/share/chromedriver
#RUN ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
#RUN ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

# Install Chrome
#RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
#RUN apt-get -yqq update
#RUN apt-get -yqq install google-chrome-stable
#RUN rm -rf /var/lib/apt/lists/*

# Clone Git repo and build/execute automation package
#RUN git clone -b base --single-branch https://github.com/avijit-samanta/selenium-bdd-poc.git
#WORKDIR selenium-bdd-poc
#RUN mvn install
