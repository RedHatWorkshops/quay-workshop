# training-cl-essentials

Artifacts for the Container Linux Essentials Course.


# Container Linux Essentials

This repository contains the artifacts for the Container Linux Essentials course.

## Overview

This course is designed as an introduction to Container Linux. Participants will learn to master the key elements of this technology and gain an understanding of the concepts, components and tools.

[Course Outline](https://docs.google.com/a/coreos.com/document/d/1LQfkH4FWcQUasaJsu2nH9sPS3204g4lgMQOU20l0FhQ/edit?usp=sharing)

## Slide Decks

  0. [Intro](https://drive.google.com/open?id=1B60Ix7LGZriwpXc0WYEKAxXkzmP6wPIZXH4ryz0jKes)

## Exercises

The training content consists of Google Slides, linked above, and lab exercises
that are written in [Markdown](https://daringfireball.net/projects/markdown/).

The lab exercise content is packaged up using [Jekyll](https://jekyllrb.com/), which
renders the Markdown as HTML and creates a static site that can be deployed onto
a web server.

The first step is to preview the content locally using the official Jekyll
container from the root of the project. This will build the site on the preview
server. The following command should make the preview site available at
http://0.0.0.0:4000/.

```
docker run --rm -it -p 4000:4000 -v `pwd`/content:/srv/jekyll jekyll/jekyll /bin/sh -c 'bundle install; jekyll serve'
```

The lab exercises are located in the `content/labs` directory. Any changes made
to the content should be updated while running the preview site in the Jekyll
container.

## Deployment

Once the content is ready to be deployed onto a web server, build the static
site. Run the following command from the root of the project to generate all of
the static assets.

```
docker run --rm -it -v `pwd`/content:/srv/jekyll jekyll/jekyll /bin/sh -c 'bundle install; jekyll build'
```
