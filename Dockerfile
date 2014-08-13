FROM sherzberg/oracle-java7
MAINTAINER Spencer Herzberg "spencer.herzberg@gmail.com"

WORKDIR /opt

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe multiverse" > /etc/apt/sources.list

RUN apt-get update -qq
RUN sudo apt-get install -y wget python

RUN wget --quiet https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -O /opt/logstash-1.4.2.tar.gz --no-check-certificate
RUN tar zxf logstash-1.4.2.tar.gz
RUN mv logstash-1.4.2 logstash

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN rm -rf /tmp/*

ADD templates /opt/templates

EXPOSE 514
EXPOSE 9200
EXPOSE 9292
EXPOSE 9300
EXPOSE 12201

VOLUME ["/opt/templates"]
CMD ["/usr/local/bin/run"]
