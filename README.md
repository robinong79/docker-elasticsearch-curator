# docker-elasticsearch-curator
Repository for the Elasticsearch Curator in Docker. 

## Environment Variables

| Name | Purpose |
| ------ | ----- |
| ELASTICSEARCH_HOST | Specify the Elasticsearch host |
| ELASTICSEARCH_PORT | The port where Elasticsearch is listening on |
| INTERVAL_IN_HOURS | The interval in which the curator will start |

## Files

| Name | Purpose | Location |
| ------ | ----- | ----- |
| curator.yml | Holds the config for Curator | /var/curator/curator.yml |
| action.yml | Hold the actions to be taken by Curator | /var/curator/action.yml |

Make sure you add a mount for /var/curator/ on your local filesystem so Curator can find them
