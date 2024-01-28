# Create a Docker Network
docker network create elastic

# Pull Elasticsearch Image
docker pull docker.elastic.co/elasticsearch/elasticsearch:8.12.0

# Start Elasticsearch Container
docker run --name es01 --net elastic -p 9200:9200 -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:8.12.0

# Pull Kibana Image
docker pull docker.elastic.co/kibana/kibana:8.12.0

# Start Kibana Container
docker run --name kib01 --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:8.12.0

# Remove the Elastic network
docker network rm elastic

# Remove Elasticsearch container
docker rm es01

# Remove Kibana container
docker rm kib01
