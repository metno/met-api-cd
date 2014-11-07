FROM mpejcoch/met-api-dependency-layer
MAINTAINER Martin Grønlien Pejcoch <mpejcoch@gmail.com>

WORKDIR /root/met-api

# Cleanup
RUN sbt clean
RUN git reset --hard
RUN git pull

# Code linting
RUN sbt scalastyle

# Run tests and report test coverage
RUN sbt clean scoverage:test

# Build the production version
RUN sbt stage dist

RUN mkdir -p /opt/metapi
RUN unzip -d /opt/metapi/ target/universal/bora-prototype-1.0-SNAPSHOT.zip

CMD /opt/metapi/bora-prototype-1.0-SNAPSHOT/bin/bora-prototype
EXPOSE 9000
