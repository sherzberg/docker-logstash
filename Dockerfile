FROM sherzberg/oracle-java7
MAINTAINER Arcus "http://arcus.io"

WORKDIR /opt

RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse" > /etc/apt/sources.list

RUN apt-get update -qq
RUN sudo apt-get install -y wget

RUN wget --quiet https://download.elasticsearch.org/logstash/logstash/logstash-1.4.1.tar.gz -O /opt/logstash-1.4.1.tar.gz --no-check-certificate
RUN tar zxf logstash-1.4.1.tar.gz
RUN mv logstash-1.4.1 logstash

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN rm -rf /tmp/*

EXPOSE 514
EXPOSE 9200
EXPOSE 9292
EXPOSE 9300

CMD ["/usr/local/bin/run"]
