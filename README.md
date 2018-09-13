## Apache Hadoop 2.7.7 Docker images
**[See all here](https://hub.docker.com/r/brpedromaia/hadoop/)**
# Sqoop docker image

***Note: This docker image requires *docker network running* and the following containers running: ***
    01. Namenode
    02. Yarn
    03. Datanode
    04. Oracle
   
# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build  -t brpedromaia/hadoop-sqoop:latest sqoop/
```

# Pull the image

The image is also released as an official Docker image from Docker's automated build repository - you can always pull or refer the image when launching containers.

```
docker pull brpedromaia/hadoop-sqoop
```


# Start a container

***In order to use the Docker image you have just build or pulled use:***

```
docker run -itd --net=dockerlan --hostname=sqoop --name=sqoop brpedromaia/hadoop-sqoop
```

***To enter in container***

```
docker exect -it sqoop bash
```

**Make sure that SELinux is disabled on the host. If you are using boot2docker you don't need to do anything.**

```
docker run -it --net=dockerlan --hostname=sqoop --name=sqoop brpedromaia/hadoop-sqoop -bash
```

**You would like to have a tunnel port exposed to localhost.**

```
docker run -itd --net=dockerlan --hostname=sqoop --name=sqoop -p 4422:22 brpedromaia/hadoop-sqoop
```

# Testing

You can run:

```
sqoop eval --connect jdbc:oracle:thin:@oracle:1521:xe --username sqoop --password sqoop --query "select * from SQOOP.TESTE"
```

# Ssh

You can use password = "sqoop":

```
ssh sqoop@localhost -p 4422

```

# Automate everything

To automate everything add code into sqoop-entrypoint.sh 
