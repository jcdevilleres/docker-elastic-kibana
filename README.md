
# Dockerized Elasticsearch and Kibana Installation Guide

Short guide on deploying elastic search and kibana dockers locally for testing.

## What is Docker?

[Docker](https://www.docker.com/) simplifies the use of containerization technology, reducing the overhead of operating systems. If you don't have Docker installed yet, head over to [Get Docker](https://docs.docker.com/get-docker/) to install it.

## Install Elasticsearch with Docker

1. **Create a Docker Network:**
    ```bash
    docker network create elastic
    ```

2. **Pull Elasticsearch Image:**
    ```bash
    docker pull docker.elastic.co/elasticsearch/elasticsearch:8.12.0
    ```

3. **Start Elasticsearch Container:**
    ```bash
    docker run --name es01 --net elastic -p 9200:9200 -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:8.12.0
    ```
    The command will print the Elasticsearch user password and an enrollment token for Kibana.

4. **Access Elasticsearch:**
    You can now access Elasticsearch locally using the provided username and password.

## Install Kibana with Docker

1. **Pull Kibana Image:**
    ```bash
    docker pull docker.elastic.co/kibana/kibana:8.12.0
    ```

2. **Start Kibana Container:**
    ```bash
    docker run --name kib01 --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:8.12.0
    ```
    When Kibana starts, it will output a unique generated link to the terminal. Open this link in a web browser to access Kibana.

3. **Log in to Kibana:**
    Log in as the elastic user with the password generated when you started Elasticsearch.

## Removing Containers

If needed, you can remove the containers using the Docker Desktop app or these commands:

```bash
# Remove the Elastic network
docker network rm elastic
# Remove Elasticsearch container
docker rm es01
# Remove Kibana container
docker rm kib01
