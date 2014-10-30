FROM ubuntu:trusty
MAINTAINER Martin Grønlien Pejcoch <mpejcoch@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq -y install apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq -y install git wget openjdk-7-jdk unzip

WORKDIR /root
RUN wget http://dl.bintray.com/sbt/debian/sbt-0.13.5.deb
RUN dpkg -i sbt-0.13.5.deb
RUN rm sbt-0.13.5.deb

RUN git clone https://github.com/metno/met-api.git

WORKDIR /root/met-api
RUN sbt clean stage dist

RUN mkdir -p /opt/metapi
RUN unzip -d /opt/metapi/ target/universal/bora-prototype-1.0-SNAPSHOT.zip

EXPOSE 9000

CMD /opt/metapi/bora-prototype-1.0-SNAPSHOT/bin/bora-prototype
