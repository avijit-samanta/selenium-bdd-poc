FROM docker
CMD echo Selenium Automation

CMD git clone -b base --single-branch https://github.com/avijit-samanta/selenium-bdd-poc.git
CMD CD selenium-bdd-poc
CMD mvn install

