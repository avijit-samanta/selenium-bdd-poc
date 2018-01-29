FROM ubuntu
MAINTAINER Avijit Samanta

# Update and install s/w
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y git
RUN apt-get install -y maven
RUN apt-get install -y xvfb
RUN apt-get install -y libxi6
RUN apt-get install -y libgconf-2-4
RUN apt-get install wget
RUN apt-get install unzip
RUN apt-get install curl
# RUN apt-get install libxss1 libappindicator1 libindicator7

#  Install Chrome driver for Ubuntu
RUN wget -N http://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip -d /usr/local/share/chromedriver
RUN rm chromedriver_linux64.zip
RUN chmod +x /usr/local/share/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

# Install Chrome
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -yqq update
RUN apt-get -yqq install google-chrome-stable
RUN rm -rf /var/lib/apt/lists/*

# Clone Git repo and build/execute automation package
# RUN git clone -b base --single-branch https://github.com/avijit-samanta/selenium-bdd-poc.git
# WORKDIR selenium-bdd-poc
# RUN mvn install
