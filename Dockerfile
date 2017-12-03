FROM debian:stretch as builder
MAINTAINER Tomas Barton <tomas.barton@gmail.com>

# install dependencies
RUN apt-get update && apt-get install --no-install-recommends -y openjdk-8-jdk-headless wget\
 && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG VERSION
RUN echo "$VERSION"
RUN mkdir -p /tmp /src && wget -nv https://github.com/yahoo/kafka-manager/archive/$VERSION.tar.gz -O /tmp/kafka-manager.tar.gz\
  && tar -xf /tmp/kafka-manager.tar.gz -C /src && cd /src/kafka-manager-$VERSION \
  && echo 'scalacOptions ++= Seq("-Xmax-classfile-name", "200")' >> build.sbt\
  && ./sbt clean dist
