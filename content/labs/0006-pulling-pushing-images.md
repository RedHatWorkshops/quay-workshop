---
layout: lab
title: Pulling and Pushing Images
permalink: /lab/pullingpushing/
module: Interacting with Quay
---

Navigate to the Quay dashboard and create a new repository under the `admin` namespace. Call the new repository `mypublicrepo`.

Explore the Repository Settings area and verify the admin user has full admin access.

Let's first attempt to contact the repository by using the docker pull command.

```
docker pull $QUAY/admin/mypublicrepo
```

We have yet to host an image, so there will be nothing there.

Let's push an image to the repository. Begin by pulling down a fresh alpine image.

```
docker pull alpine
```

Verify the image has been pulled.

```
docker images
```

View the history of the image.

```
docker history alpine
```

Inspect the image.

```
docker inspect alpine
```

Tag the image.

```
docker tag alpine $QUAY/admin/mypublicrepo:v1
```

Attempt to push the image to the repository.

```
docker push $QUAY/admin/mypublicrepo:v1
```

Verify the image appears in the Quay Enterprise dashboard.


#### For Advanced Users

The Quay.io API is a full OAuth 2, RESTful API.

You can explore the API by navigating to http://petstore.swagger.io/ and providing your Swagger definition file.

The file can be accessed by appending `/api/v1/discovery` to the hostname.

```
echo $QUAY/api/v1/discovery
curl $QUAY/api/v1/discovery
```

Here is an example of an API call for creating a new public repo.

```
curl -H "Content-Type: application/json" -X POST http://a73d7f7fe2e6511e8875c069e2081a5e-397847376.us-east-1.elb.amazonaws.com/api/v1/repository -d '{"namespace":"admin","repository":"new_repo_via_api","description":"this repo was created via the API","visibility":"public"}' -H 'Authorization: Bearer <YOUR_API_TOKEN>' -v
```

More information on the Quay API can be found here: 
