# Containerizing an express.js simple app

This is just an example to learn more about Docker. 

First we create an express app that just serves a static web page in html.

## Dockerfile explained

Then we create a _Dockerfile_, which is the configuration file for building docker images. Thus, in this file we have to instruct the image every step it needs to execute in order to run this app. The steps are:

- Mention the base layer (OS) on which our app is going to run. In this case, the image is called __node__, which is an [official image](https://hub.docker.com/_/node/) from Docker Hub, based on Debian. There are other lightweight layers based on Alpine Linux.
- Copy all the files at the root of the proyect and put them into a /src folder.
- Establish the /src as the root directory.
- Install npm dependencies.
- Expose the port where the app is listening (3000).
- Execute the app (run node). 

## Build the image

In order to build the docker image in our docker host, we can run the following command:

```
docker image build -t my_app:latest .
```

_my_app:latest_ follows the <_repo_name_>:<_tag_> format.

## Run the container

Once the image is built, we can check it was properly done by listing the available images in the host:

```
docker image ls
```

Now we can create and run a container from our image with the following command:

```
docker container run -d --name some_container -p 80:3000 my_app:latest
```

_some\_container_ is the name I chose for the container. _-d_ runs the container in the background (doesn't attach to terminal) and 80:3000 means that the host will redirect its request in the 80 port to the container 3000 port.

We can check our container was created and running with this command:

```
docker container ls
```

Finally, just go to [localhost](127.0.0.1) and check that the web page is displaying =).

In order to stop the container, just run 

```
docker container stop some_container
```
