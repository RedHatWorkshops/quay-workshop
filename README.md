# Container Linux Essentials

This repository contains the artifacts for the Container Linux Essentials course.

## Overview

This course is designed as an introduction to Container Linux. Participants will learn to master the key elements of this technology and gain an understanding of the concepts, components and tools.

[Course Outline](https://docs.google.com/a/coreos.com/document/d/1LQfkH4FWcQUasaJsu2nH9sPS3204g4lgMQOU20l0FhQ/edit?usp=sharing)

## Slide Decks

  0. [Intro](https://drive.google.com/open?id=1B60Ix7LGZriwpXc0WYEKAxXkzmP6wPIZXH4ryz0jKes)
  0. [Overview](https://drive.google.com/open?id=1FQUOCK0sNr4BgOi6s5cpogslJHrOlO61aUX3yhalnBI)
  0. [Architecture](https://drive.google.com/open?id=1FKZ4R9bpGWni76Wfl4ASFd7UUng__9LhbG-wRj9xzuU)
  0. [Update Pattern](https://drive.google.com/open?id=1MS2jScq0rpUylOLW9gm7_ynvl2lZualAVchfysV_ik8)
  0. [systemd](https://drive.google.com/open?id=1x6K0_-UL0vGvMQH-4Mcsu0qa2g2mIMKKWjNYaNPYEpU)
  0. [Configuration Overview](https://drive.google.com/open?id=1YdbJF2kvJ7wXttDxouyhf_BzFslmOFVneLNK80UCXj0)
  0. [Users and Groups](https://drive.google.com/open?id=1oDMVm6sroHODlql46Pf158Ru2-cUxelTVBzUhw9EaG8)
  0. [Storage](https://drive.google.com/open?id=1il_OTc5EAclUtHPvoq9xBAI8zkJwn1Q35P-HF2mH0Kk)
  0. [Container Runtime](https://drive.google.com/open?id=18KjoCSVAUik3s_H1ncP72U3NL8FAx9A_DibcCOZYtXo)
  0. [Cluster Coordination](https://drive.google.com/open?id=1iUTChfRVd46pDfvTOvpz01cU5WpX-PIoTiqMm4WE5ew)
  0. [Networking](https://drive.google.com/open?id=1KLjLgGYZ9XYZ0_kc-mXzkWzj2x1V5ebUUQXUiGm40Pw)
  0. [Configuring Updates](https://drive.google.com/open?id=1xCyn1WeOLFpohC9u2pkpxKyp_iJsiP3tQsxZ0OtFvOE)
  0. [Security](https://drive.google.com/open?id=1Fa3GjCySsHgIHB9xZQ5Eoh5k9g3qeNadCtIzoM1Iy7M)
  0. [Troubleshooting](https://drive.google.com/open?id=18lWGZDlOss5qk1u4Dmy68fp6VHATVsQ-ZgyizSVy10Q)
  0. [Conclusion](https://drive.google.com/open?id=1tbGsYO7MvXOEXIyht-XonmjWx3nQ2_5u3sCkW4rLrsU)

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
