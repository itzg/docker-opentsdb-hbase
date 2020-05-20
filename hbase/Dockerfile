FROM ubuntu:18.04

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openjdk-8-jre-headless \
    && apt-get clean
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

ARG HBASE_VERSION=2.2.4

ADD http://apache.mirrors.hoobly.com/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz /tmp/hbase-${HBASE_VERSION}-bin.tar.gz

RUN cd /opt && \
  tar xvf /tmp/hbase-${HBASE_VERSION}-bin.tar.gz && \
  rm /tmp/hbase-${HBASE_VERSION}-bin.tar.gz

WORKDIR /opt/hbase-${HBASE_VERSION}

COPY hbase-site.xml conf/hbase-site.xml

COPY entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]

COPY healthcheck.sh /healthcheck
HEALTHCHECK CMD /healthcheck

VOLUME ["/data"]

# HBase Web UI
EXPOSE 16010
