---
title: Using Jekyll Scholar with Github Pages
layout: post
description: Notes on how to use an unsupported (by default) Jekyll plugin with GitHub Pages with GitHub Actions.
tags:
- jekyll
- github-pages
---


By default, [Jekyll Scholar](https://github.com/inukshuk/jekyll-scholar) isn't supported by Github Pages based on the [list here.](https://pages.github.com/versions/). This plugin is extremely useful in generating references on your posts as it allows you to place a `references.bib` file inside `_bibliography/` in your Jekyll source code, and use liquid tags {% raw %} `{% bibliography --cited %}` {% endraw %} to automatically generated used citations via the {% raw %} `{% cite article_name %}` {% endraw %} tags in your post. This also allows references to be shared across posts and not have to individually rewrite references.

[This other blog post](https://martinopilia.com/posts/2020/02/22/migration.html) covers everything, and the updated GitHub Action can be found [here](https://martinopilia.com/posts/2020/02/22/migration.html) but I've personally had to make changes as I was running into errors for not following it exactly.

# Docker image

First you need a Docker image to build Jekyll locally and I decided not to use [Martino's Docker image](https://hub.docker.com/r/martinopilia/m-pilia.github.io) as I wanted to try creating my own. Luckily it was fairly simple. My docker image was created specifically for jekyll-katex and jekyll-scholar plugins, which is available [here](https://github.com/evantancy/evantancy.github.io/blob/source/Dockerfile) and follow [this guide](/blog/2022-01-13-how-to-publish-images-to-docker-hub).

# Changes to the guide

## Step: Build jekyll site
I needed to use jekyll-katex and jekyll-scholar extensions, and so had to customize the Docker image by using my own [Dockerfile](https://github.com/evantancy/evantancy.github.io/blob/source/Dockerfile) publishing my own on Docker Hub.
```bash
docker run --rm --volume="$PWD:/srv/jekyll" \
--user $(id -u):$(id -g) \
-i evantancy/evantancy.github.io:latest jekyll build
```

## Step: Deploy jekyll site
I ran into errors where the main branch couldn't be found, so a simple `git fetch` solved this. There were also permission errors for the `mv` command, which could be solved with {% raw %}`sudo chown -R $USER:$USER ${{ github.workspace }}`{% endraw %}
{% raw %}
```bash
run: |
    ...
    git config --local user.name "GitHub Action"
    git fetch
    git checkout main
    ls -Q | grep -v _site | xargs rm -rf
    sudo chown -R $USER:$USER ${{ github.workspace }}
    mv _site/* .
    rm -rf _site
    rm -rf .jekyll-cache
    ...
```
{% endraw %}

# Pros and Cons
It's a lot more to manage than simply pushing changes to your remote repository and letting GitHub take care of the building etc. By letting GitHub handle the build, you don't need to touch Docker, GitHub Actions, but are limited to a set of plugins and specific versions. However, after a somewhat tedious setup the Jekyll plugins that can be used are no longer restricted to [this list](https://pages.github.com/versions/). Personally, I have just started using [jekyll-katex](https://github.com/linjer/jekyll-katex) for LaTeX, [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) for easy referencing, and [jekyll-target-blank](https://github.com/keithmifsud/jekyll-target-blank) for creating external links.
