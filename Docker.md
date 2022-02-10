## Docker Learn
------------------------------------------------------------------
#### To pull the images from DockerHub
docker pull

#### List the running containers
docker ps

#### List the container[History], whether they are running or not.
docker ps -a

#### To run the image on the containers
docker run  
Ex: docker run redis

Note: It combines both docker pull and docker start

#### Run a container and expose a port.
docker run -p 9090:9090 bitnami/prometheus

#### Start/stop containers
docker start
docker stop

#### Give a NAME to the container
docker run -d -p 9090:9090 --name prometheus bitnami/prometheus

NOTE: -d : detached mode

#### Create a container with USERNAME
docker run -d -p 9090:9090 --name prometheus2 --user root --workdir /root  bitnami/prometheus

#### List networks
docker network ls

#### Remove unwanted images, which are not in use.
docker images prune


NOTE: Dokerfile is a blue print for creating docker images.

RUN: If you want to create any directory or anything with in the containers.

COPY: You can copy anything from your local host to container. It executes on the host[your machine] to remote containers.
Ex:
COPY . /home/app

CMD: Entry point command. We can run scripts and execute any anything.

We can have multiple RUN entries but CMD should be one as an entry point.

Example Dockerfile:
------------------
FROM ubuntu

RUN mkdir -p /home/mveera

COPY ./scripts/sample-bash.sh /home/mveera

CMD ["bash","/home/mveera/sample-bash.sh"]

--------------------
Shell script: file: scripts/sample-bash.sh
#!/bin/bash
while true; do echo "Hello world";sleep 10;done
---------------------

#### How to create an image with Dockerfile
Once you are done with dockerfile composing. Run below commands to create an image with TAGS.
```bash
cd to the dockerfile locations.
docker build -t <IMAGE_NAME>:<TAG> .

Ex:
 docker build -t ubuntu-sleep:1.0 .
```

Check images after dockerfile done with Building.
```bash
docker images
```

Use that image to create containers.
```bash
docker run -d --name sleep-test ubuntu-sleep:1.0
```

###### Logs:
docker logs sleep-test -f
###### Login to that container:
docker exec -it sleep-test bash
