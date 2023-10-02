FROM ubuntu:22.04
WORKDIR /opt/application
RUN apt-get -y update
RUN apt-get install -y wget git
RUN apt-get install -y swi-prolog
RUN apt-get install -y apache2
RUN apt-get -y install libcgi-pm-perl
RUN a2enmod cgi
RUN service apache2 restart
RUN git clone --depth=1 https://github.com/tkuhn/AceRules.git
WORKDIR /opt/application/
RUN git clone --depth=1 https://github.com/Attempto/APE.git
RUN mv APE AceRules/ape
WORKDIR /opt/application/AceRules/ape
RUN make build
#WORKDIR /opt/application
#RUN apt-get install -y make bison
#RUN wget http://www.tcs.hut.fi/Software/smodels/src/smodels-2.34.tar.gz
#RUN tar -zxvf smodels-2.34.tar.gz
#RUN wget http://www.tcs.hut.fi/Software/smodels/src/lparse-1.1.2.tar.gz
#RUN tar -zxvf lparse-1.1.2.tar.gz
#WORKDIR /opt/application/smodels-2.34
#RUN make
#RUN make install
#WORKDIR /opt/application/lparse-1.1.2
#RUN ./configure
#RUN make
#RUN make install
RUN ln -s /opt/application/AceRules/engine/webservice/acerulesws.perl /usr/lib/cgi-bin/
WORKDIR /opt/application/AceRules/engine/webservice
RUN ./compile_webservice.sh
EXPOSE 80
WORKDIR /opt/application/AceRules/engine/webservice/
COPY start.sh .
CMD ./start.sh
