# Logstash

Logstash 1.4.1

Build the container

```bash
$ docker build -t sherzberg/logstash .
```

Run Embedded Elasticsearch:

```bash
$ sudo docker run -i -p 9292:9292 -p 9200:9200 -p 9300:9300 -t sherzberg/logstash
```

Run with external Elasticsearch:

```bash
$ sudo docker run -i -e ES_HOST=1.2.3.4 -e ES_PORT=9300 -t sherzberg/logstash
```

Ports

* 514 (syslog)
* 9200 (embedded elasticsearch if no external specified)
* 9292 (logstash ui)
* 9300 (embedded elasticsearch if no external specified)
