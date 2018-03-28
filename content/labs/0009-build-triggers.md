---
layout: lab
title: Adding Build Triggers
permalink: /lab/dockerfiles/buildtrigger/
module: Dockerfiles
---

Navigate to the **Builds** area of the `anothernewrepo` repo.

Select **Create Build Trigger** and click **Github Repository Push**.

Provide your GitHub credentials.

The UI should present the variety organizations you're GitHub account is associated with.  Select the organization that contains the repo with your Dockerfile.

Select your repository.

Configure the GitHub webhook to trigger for any change made to all branches or tags in the repo **or** configure to trigger only on specific branches and tags.

Choose the Dockerfile you want to build and select the context for the Docker build.

If any of the images referenced in your Dockerfile require authentication, you must create a Robot Account that has access to the image's repository. This Robot Account token will be provided to the build worker via the Quay API during the time of build execution.

Select **Continue**.

Go to your Dockerfile on GitHub and commit a change to your Dockerfile. At the time of commit:

1) GitHub sends a webhook to the Quay API.
2) A build worker currently connected to Quay will receive the GitHub repository public ssh-key and will clone down the repository containing the Dockerfile.
3) The build worker builds the Dockerfile. If any layers of the current build currently exist within the current build Quay repo, the build worker will use them to speed up the build process.
4) After the image has been built, the build worker pushes the image to the Quay API via the Repository Build Token initially received from the Quay/build worker handshake.