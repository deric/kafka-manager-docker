FROM debian:stretch-slim

ENV LANG C.UTF-8
ARG VERSION
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && mkdir -p /usr/share/man/man1/ \
  && apt-get install --no-install-recommends -y openjdk-8-jdk-headless unzip\
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
COPY src/kafka-manager-$VERSION/target/universal/kafka-manager-$VERSION.zip /tmp
RUN unzip -d /tmp /tmp/kafka-manager-$VERSION.zip && mv /tmp/kafka-manager-$VERSION/* /app/ \
 && rm -rf /tmp/kafka-manager* && rm -rf /app/share/doc
ADD entrypoint.sh /app/
ADD application.conf /app/conf/
ADD logback.xml /app/conf/

WORKDIR /app

EXPOSE 9000
ENTRYPOINT ["./entrypoint.sh"]
