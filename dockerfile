FROM python:2.7.8-slim

ENV ELASTICSEARCH_HOST=elasticsearch
ENV ELASTICSEARCH_PORT=9200

RUN pip install --quiet elasticsearch-curator

COPY /config/curator.yml /var/curator/curator.yml
COPY /action/action.yml /var/curator/action.yml

ENTRYPOINT [ "/usr/local/bin/curator" ]

