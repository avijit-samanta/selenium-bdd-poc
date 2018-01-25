FROM ubuntu

# Update and install s/w
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y git
RUN apt-get install -y maven

#  Install Google Chrome for Debian/Ubuntu
RUN apt-get install libxss1 libappindicator1 libindicator7
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

RUN dpkg -i google-chrome*.deb
RUN apt-get install -f

# Support to run Chrome headlessly:
RUN apt-get install xvfb
RUN apt-get install unzip

#Install ChromeDriver
RUN wget -N http://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod +x chromedriver
RUN mv -f chromedriver /usr/local/share/chromedriver

# Clone Git repo and build/execute automation package
RUN git clone -b base --single-branch https://github.com/avijit-samanta/selenium-bdd-poc.git
WORKDIR selenium-bdd-poc
RUN mvn install
