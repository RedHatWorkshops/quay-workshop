# Quay Essentials

This repository contains the artifacts for the Quay Essentials course.

## Overview

This course is designed for individuals interested in using and operating the Quay Enterprise Container Registry. Quay Enterprise is on-premise software for building, storing and distributing your private containers to your server. This course is designed to quickly build competence around using Quay Enterprise and operating the Quay infrastructure. 

[Course Outline](https://docs.google.com/document/d/1MXKcwluYN5MhKXrJYJaj4TH6csRAVR1yqa3JJOgk00A/edit?usp=sharing)

## Slide Decks

[Intro](https://drive.google.com/open?id=1-FkSzGtqRNf6D_Ru5IcAWs7eg6PIzraPdBaShbZQaEQ)

[Quay Explained](https://drive.google.com/open?id=1RzCxq7WJ5CMQlxPI62lB5JMGfco78vqHjjSozJ8wDvI)

[Container Image Workflow](https://drive.google.com/open?id=1zI4x0k2LfbxrRhRYKa9w1mD1_EaON65XEH4EOkwvfsI)

[Working with Tags](https://drive.google.com/open?id=1eR411wgxjgPtjriwrdSlCzUHBqVYNmA3vhSiZQ8gPYA)

[Quay Security](https://drive.google.com/open?id=1ppmLWwiwP3A3-OB_Dw8Sgc2e0ZrKQMhVXu8lzG2VAN0)

[Build Triggers](https://drive.google.com/open?id=1qpcaaUux3WsREKfn5wqwEPj5BtnIA-tHgHdKLWsJ0GY)

[Notifications](https://drive.google.com/open?id=1HmAGpCZZeStY_MJdwQaw-tQGz3QESVsr77yC-IxQXh0)



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
