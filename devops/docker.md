# Docker

## Build dockerfile

```bash
docker image build -t [tag_name:version] .
```

## Run dockerfile

- `-d` container runs in second plane

```bash
docker container run -d --name [container_name] -p [host_port:container_port] [image_tag_name:version]
```

## List images

```bash
docker image ls -a
```

## List containers

```bash
docker container ls -a
```

## Remove image

- `-f` flag to force remove

```bash
docker image rm -f [container_id]
```

## Remove container

- `-f` flag to force remove

```bash
docker container rm -f [container_id]
```

## Get into container

- `-it` flag creates an interactive terminal

```bash
docker container exec -it [container_id] /bin/bash

## if container wasn't created before

docker container run -it [image_name:version] /bin/bash
```

## Pull image

### From Docker Hub

```bash
docker login

## set credentials

docker image pull [image_name]
```

### From AWS ECR

```bash
aws ecr get-login-password --region [aws_region] | docker login --username [username] --password-stdin [image_name]

## aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 952729869933.dkr.ecr.eu-west-1.amazonaws.com/symfony-node

## aws ecr get-login-password --region eu-west-1 docker login 
```

### Windows => AWS ECR Login and pull image

```bash
aws ecr get-login --region eu-west-1
```

* Copy output and paste it to login

```
docker pull [image_name]
```

## Start/stop a container

```bash
docker container start [container_id]
docker container stop [container_id]
```



## Terminology

- **Images:** The file system and configuration of our application which are used to create containers. To find out more about a Docker image, run  docker image inspect alpine

- **Containers:** Running instances of Docker images — containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers, and runs as an isolated process in user space on the host OS. You created a container using docker run which you did using the alpine image that you downloaded

- **Docker daemon:** The background service running on the host that manages building, running and distributing Docker containers.

- **Docker client:** The command line tool that allows the user to interact with the Docker daemon.

- **Docker Store:** Store is, among other things, a registry of Docker images. You can think of the registry as a directory of all available Docker images. 



## Other instructions

### DIFF

- Want to inspect all the changes we made in a image.

```bash
docker container diff [container_id]
```

### COMMIT

- Commit creates an image locally on the system running the Docker engine. Run the following command in order to commit the container and create an image out of it.

```bash
docker container commit [container_id]
```
 
### TAG

- Add a tag to the image

```bash
docker image tag [image_id] [image_tag]
```

### HISTORY

```bash
docker image history [image_id]
```

### LIST ALL CONTAINER

```bash
docker ps -a -q

## only IDs

docker ps -aq
```

### STOP ALL RUNNING CONTAINERS

```bash
docker stop $(docker ps -aq)
```

### REMOVE ALL CONTAINERS

```bash
docker rm $(docker ps -aq)
```

### REMOVE ALL IMAGES

```bash
docker rmi $(docker images -q)
```

### CP

```bash
docker cp [container_id]:/file/path/within/container /host/path/target
```
