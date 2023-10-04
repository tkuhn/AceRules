FROM ubuntu:14.04
WORKDIR /opt/application
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y wget git
RUN apt-get install -y swi-prolog
RUN apt-get install -y apache2
RUN apt-get install -y libcgi-pm-perl
#RUN apt-get install -y build-essential
#RUN apt-get install -y gcc-4
#RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4 4
#RUN update-alternatives --config gcc
RUN a2enmod cgi
RUN service apache2 restart
RUN git clone --depth=1 https://github.com/tkuhn/AceRules.git
WORKDIR /opt/application/
RUN git clone --depth=1 https://github.com/Attempto/APE.git
RUN mv APE AceRules/ape
WORKDIR /opt/application/AceRules/ape
RUN make build
WORKDIR /opt/application
RUN apt-get install -y make bison
RUN wget http://www.tcs.hut.fi/Software/smodels/src/smodels-2.34.tar.gz
RUN tar -zxvf smodels-2.34.tar.gz
RUN wget http://www.tcs.hut.fi/Software/smodels/src/lparse-1.1.2.tar.gz
RUN tar -zxvf lparse-1.1.2.tar.gz
WORKDIR /opt/application/smodels-2.34
RUN make
RUN make install
WORKDIR /usr/lib/x86_64-linux-gnu/perl-base/
WORKDIR /opt/application/lparse-1.1.2
#RUN sed -i 's/use POSIX qw(tmpnam);/use File::Temp qw(tempfile);/' configure
#RUN sed -i 's/$name = tmpnam();/$name = "tempfile";/' configure
#RUN sed -i 's/\bhash(/hashx(/g' /opt/application/lparse-1.1.2/src/instance.cc
RUN ./configure
RUN make
RUN make install
RUN ln -s /opt/application/AceRules/engine/webservice/acerulesws.perl /usr/lib/cgi-bin/
WORKDIR /opt/application/AceRules/engine/webservice
RUN ./compile_webservice.sh
EXPOSE 80
EXPOSE 2763
WORKDIR /opt/application/AceRules/engine/webservice/
COPY start.sh .
CMD ./start.sh
