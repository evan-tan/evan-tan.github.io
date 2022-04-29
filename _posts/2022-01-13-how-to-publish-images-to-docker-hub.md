---
title: How to publish images to Docker Hub
layout: post
description: Notes on how to create/pull docker images, potentially customize them with different packages/configurations and push to Docker Hub for easily pulling elsewhere from the CLI.
tags:
- docker
---

# Getting the docker image
## Method 1: using Dockerfile
Create a file named `Dockerfile` and write the contents below

<div class="filename">Dockerfile</div>

```Dockerfile
FROM jekyll/builder:3.8
RUN apk add --update --no-cache nodejs npm
RUN gem install kramdown-math-katex bundler
```
Then build the docker image from Dockerfile using `docker build . -t image_name:tag_name`, where the tag is _optional_

## Method 2: pull docker image
```bash
# format: docker pull image_name:tag_name
docker pull jekyll/builder:3.8
```

# Run the docker image & run configurations
```bash
docker run --rm -it jekyll/builder:3.8 bash
mkdir test-directory/
exit
```
__NOTE:__
- `docker run ... -i image_name:tag_name bash -c "command_name"` to execute commands through the container
- use `--rm` for automatic clean up of containers upon exiting the container

# Grab the container ID
```bash
docker ps -a

# example output
CONTAINER ID   IMAGE            COMMAND                  CREATED        ...
d96a67fbc97f   jekyll-builder   "/usr/jekyll/bin/ent…"   21 hours ago   ...
ba05b0a4b940   b5dd64e479c8     "/usr/jekyll/bin/ent…"   22 hours ago   ...
```
where you will see a 12 character string under _CONTAINER ID_

**Before proceeding**, ensure that you are logged into docker hub by running `docker login`

# Run docker commit
```bash
docker commit container_id dockerhub_username/repository:tag_name
# for example
docker commit d96a67fbc97f evantancy/test-repo:latest
```

# Run docker push
```bash
docker push evantancy/test-repo:latest
```

Now head on over to [Docker Hub](https://hub.docker.com/){: target="_blank"} and your custom image is there! I've managed to find a great video on this [here.](https://www.youtube.com/watch?v=fdQ7MmQNTa0){: target="_blank"}
