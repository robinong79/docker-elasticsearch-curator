FROM python:2.7.8

ENV ELASTICSEARCH_HOST=elasticsearch
ENV ELASTICSEARCH_PORT=9200
ENV INTERVAL_IN_HOURS=24

# grab gosu for easy step-down from root
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN arch="$(dpkg --print-architecture)" \
	&& set -x \
	&& curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch" \
	&& curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch.asc" \
	&& gpg --verify /usr/local/bin/gosu.asc \
	&& rm /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu

RUN groupadd -r curator && useradd -r -g curator curator

RUN pip install --quiet elasticsearch-curator

COPY docker-entrypoint.sh /
#COPY /config/curator.yml /var/curator/curator.yml
#COPY /action/action.yml /var/curator/action.yml

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["curator"] 

#ENTRYPOINT [ "/usr/local/bin/curator" ]

