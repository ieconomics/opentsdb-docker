FROM ubuntu
MAINTAINER antonio@tradingeconomics.com

#Install OpenTSDB and requirements
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    apt-get install -y openjdk-6-jdk gnuplot nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/OpenTSDB/opentsdb/releases/download/v2.1.0RC1/opentsdb-2.1.0RC1_all.deb /tmp/opentsdb.deb
RUN dpkg -i /tmp/opentsdb.deb
RUN rm /tmp/opentsdb.deb

# For nano to work properly
ENV TERM=xterm

EXPOSE 4242

COPY start.sh start.sh
CMD ["/bin/sh", "start.sh"]
