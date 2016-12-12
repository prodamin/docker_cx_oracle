FROM ubuntu:16.04
MAINTAINER Vladimir Fesik <xeon@forever.org.ua>


ENV ORACLE_HOME /opt/oracle/instantclient_12_1
ENV LD_RUN_PATH=$ORACLE_HOME

COPY instantclient/* /tmp/

RUN \
    apt-get update && apt-get install -y unzip python3-pip && rm -rf /var/lib/apt/lists/* && \
	mkdir -p /opt/oracle && \
	unzip "/tmp/instantclient*.zip" -d /opt/oracle && \
	ln -s $ORACLE_HOME/libclntsh.so.12.1 $ORACLE_HOME/libclntsh.so && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
	pip install cx_Oracle && \
    pip install --upgrade pip

