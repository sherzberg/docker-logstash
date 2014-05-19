build:
	sudo docker build -t sherzberg/logstash .

shell:
	sudo docker run -i -t sherzberg/logstash /bin/bash

r:
	sudo docker run -i -t -e ES_HOST=localhost -p 12201:12201 -p 9292:9292 -p 9300:9300 -p 9200:9200 sherzberg/logstash
