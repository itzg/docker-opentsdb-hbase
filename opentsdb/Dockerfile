FROM ubuntu:18.04

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openjdk-8-jre-headless \
    && apt-get clean
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

ARG HBASE_VERSION=2.2.4
ADD http://apache.mirrors.hoobly.com/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-client-bin.tar.gz /tmp/hbase-${HBASE_VERSION}-client-bin.tar.gz
RUN tar -C /opt -xvf /tmp/hbase-${HBASE_VERSION}-client-bin.tar.gz && \
  rm /tmp/hbase-${HBASE_VERSION}-client-bin.tar.gz

ENV HBASE_HOME=/opt/hbase-${HBASE_VERSION}-client

ARG OTSDB_VERSION=2.4.0
ADD https://github.com/OpenTSDB/opentsdb/releases/download/v${OTSDB_VERSION}/opentsdb-${OTSDB_VERSION}_all.deb /tmp/opentsdb-${OTSDB_VERSION}_all.deb

RUN dpkg -i /tmp/opentsdb-${OTSDB_VERSION}_all.deb && \
  rm /tmp/opentsdb-${OTSDB_VERSION}_all.deb && \
  ln -s /usr/share/opentsdb/bin/tsdb /usr/bin

COPY hbase-site.xml ${HBASE_HOME}/conf/hbase-site.xml
COPY opentsdb.conf /etc/opentsdb/opentsdb.conf

COPY entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]