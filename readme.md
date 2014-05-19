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

Both of these examples above open up a syslog port to accept syslog events. This
is the default. If you want more flexibility, try this:

```bash
$ sudo docker run -i -p 9292:9292 -p 9200:9200 -p 9300:9300  -v /templates/path:/opt/templates -t sherzberg/logstash
```

And in _/templates/path_, create a file called `logstash.template`. Here is a sample

```bash
input {
  gelf {
  }
}
output {
  file { path => '/var/log/logstash.log' }
  elasticsearch { embedded => true }
  stdout { codec => rubydebug }
}
```

You can create a fully custom logstash config. This config file will be used when 
Logstash starts Also, any environment variable will be replaced! Just use 
`{ENV_VARIABLE_NAME}` in the config.

Ports

* 514 (syslog)
* 9200 (embedded elasticsearch if no external specified)
* 9292 (logstash ui)
* 9300 (embedded elasticsearch if no external specified)
* 12201 (gelf input)
