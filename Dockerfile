FROM avijitsamanta/selenium-bdd-poc:stable
VOLUME /tmp

RUN git clone https://github.com/avijit-samanta/selenium-bdd-poc.git
WORKDIR selenium-bdd-poc
RUN mvn install
