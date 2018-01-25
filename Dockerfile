FROM docker
CMD echo Selenium Automation
RUN git clone -b base --single-branch https://github.com/avijit-samanta/selenium-bdd-poc.git
WORKDIR selenium-bdd-poc

