FROM ubuntu:22.04
WORKDIR /opt/application
RUN apt-get -y update
RUN apt-get install -y wget git ant
RUN apt-get install -y openjdk-11-jdk
RUN git clone --depth=1 https://github.com/tkuhn/AceRules.git
WORKDIR /opt/application/AceRules/webapp
RUN ant createwar
RUN wget -O jetty-runner.jar https://repo1.maven.org/maven2/org/mortbay/jetty/jetty-runner/8.1.9.v20130131/jetty-runner-8.1.9.v20130131.jar
EXPOSE 9078
CMD java -Xmx400m -Xss4m -Djava.awt.headless=true -jar jetty-runner.jar --port 9078 acerules.war
