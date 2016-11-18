# Cassandra reaper

Docker image of The Last Pickle's [fork](https://github.com/thelastpickle/cassandra-reaper) of Spotify's Cassandra Reaper.

## How to use this image

Simpy run
```
docker run --name reaper -d smartcat/cassandra-reaper -p 8090:8090 -p 8091:8091
```

This command will download cassandra-reaper image and start it with default configuration. WebUI can be accessed at localhost:8090/webui/index.html.

Custom configuration can be supplied by mapping a file cassandra-reaper.yaml to /opt/cassandra-reaper/cassandra-reaper.yaml.

## Docker-compose file example

This is a docker-compose file example
```
version: '2'
services:
  reaper:
    image: smartcat/cassandra-reaper
    logging:
      driver: json-file
      options:
        max-file: "2"
        max-size: "10m"
    volumes:
      - ./cassandra-reaper.yaml:/opt/cassandra-reaper/cassandra-reaper.yaml:ro
    ports:
      - 8080:8080
      - 8090:8090
      - 8091:8091
```
