FROM ubuntu

# Update aptitude with new repo
RUN apt-get update

RUN git clone -b base --single-branch https://github.com/avijit-samanta/selenium-bdd-poc.git
WORKDIR selenium-bdd-poc
RUN mvn install

