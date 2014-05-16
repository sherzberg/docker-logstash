# Logstash

Logstash 1.4.1

Build the container

```bash
$ docker build -t sherzberg/logstash .
```

Run Embedded Elasticsearch:

```bash
$ docker run sherzberg/logstash
```

Run with external Elasticsearch:

```bash
$ docker run -e ES_HOST=1.2.3.4 -e ES_PORT=9300 logstash
```

Ports

* 514 (syslog)
* 9200 (embedded elasticsearch if no external specified)
* 9292 (logstash ui)
* 9300 (embedded elasticsearch if no external specified)
