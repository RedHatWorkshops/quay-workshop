---
layout: lab
title: Creating Dockerfiles
permalink: /lab/dockerfiles/creating/
module: Dockerfiles
---

Create a new directory for a Dockerfile.

```
mkdir -p dockerfiles/alpine
```

Create the Dockerfile.

```
cat > ~/dockerfiles/alpine/Dockerfile <<EOF
FROM alpine:3.4

RUN apk update

RUN apk add vim

RUN apk add curl

ENTRYPOINT ["/usr/bin/curl","-L"]
CMD ["coreos.com"]

EOF
```

Build the file.

```
cd ~/dockerfiles/alpine/
docker build .
```

Observe the created image and associated history.

```
docker images
docker history <image-id>
```

Try running the image and ensure we get a response back from `coreos.com` by default.

```
docker run <image-id>
```

Tag the newly bult image with a new repository name that does not exist yet.

```
docker tag <image-id> $QUAY/admin/anewrepo:v1
```

Push the image to Quay Enterprise. Quay will automatically created a new private repostitory for your image.

```
docker push $QUAY/admin/anewrepo:v1
```

Let's create one more Dockerfile. This time we wil try a multi-stage build. Multi-stage builds are a new feature in Docker 17.05, so be sure to check your version.

```
cd ..
git clone https://github.com/madorn/testsha
cd testsha
docker build .
```

Tag the new image.

```
docker tag <image-id> $QUAY/admin/anothernewrepo:v1
```

Push the image to Quay.

```
docker push <image-id> $QUAY/admin/anothernewrepo:v1
```