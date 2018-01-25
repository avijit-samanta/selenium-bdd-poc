FROM ubuntu

# Update and install s/w
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y git
RUN apt-get install -y maven
RUN apt-get install -y xvfb
RUN apt-get install -y ibxi6 libgconf-2-4
RUN apt-get install unzip

# Install Chrome.
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update
RUN apt-get -y install google-chrome-stable

#  Install Chrome driver for Debian/Ubuntu
CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
# RUN apt-get install libxss1 libappindicator1 libindicator7
RUN wget http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip ~/Downloads
RUN unzip ~/Downloads/chromedriver_linux64.zip -d ~/Downloads
RUN chmod +x ~/Downloads/chromedriver
RUN mv -f ~/Downloads/chromedriver /usr/local/share/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

# RUN dpkg -i google-chrome*.deb
# RUN apt-get install -f

# Support to run Chrome headlessly:
# RUN apt-get install xvfb
# RUN apt-get install unzip

#Install ChromeDriver
# RUN wget -N http://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip
# RUN unzip chromedriver_linux64.zip
# RUN chmod +x chromedriver
# RUN mv -f chromedriver /usr/local/share/chromedriver

# Clone Git repo and build/execute automation package
# RUN git clone -b base --single-branch https://github.com/avijit-samanta/selenium-bdd-poc.git
# WORKDIR selenium-bdd-poc
# RUN mvn install
