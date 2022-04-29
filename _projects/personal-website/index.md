---
title: Creating a personal website
layout: project
description: Why I created this website in the first place and how I did it.
order: 3
date: 25-01-2022
links:
    github: https://github.com/evantancy/evantancy.github.io
references: False
tags:
- jekyll
- github-pages
---

# Rationale
I just graduated from university and have done quite a few interesting projects either from coursework, [Monash Motorsport](https://www.monashmotorsport.com/), or my internship with [AIDrivers](https://www.aidrivers.ai/). However, I didn't have a place to really showcase these projects and document my thought process. With GitHub Pages building a portfolio website is extremely easy and just by [following their guide](https://docs.github.com/en/pages/quickstart) you can get up and running super quickly without any knowledge on HTML, CSS and Jekyll.

However, GitHub pages limits the Jekyll plugins to [this list](https://pages.github.com/versions/) which isn't ideal. Furthermore, many themes are overly styled and the focus is not on the content & writing. With some luck, I chanced upon [this blog](https://gregorygundersen.com/blog/) and loved how simple and minimal it was, with the main focus being technical writing instead of flashy visuals. I wanted to explore building the site to have __full customization options.__

# Building the site
Taking a lot of inspiration from that blog, I built the base of my website which uses KaTeX for LaTeX rendering, and uses nothing but HTML, CSS and Jekyll. I soon realized that I may want to include references through `jekyll-scholar` on project or blog posts, but this Jekyll plugin was not officially supported. Being a cheapskate, I didn't want to pay for hosting etc so I was determined to use GitHub for hosting.

Through [this suggestion](https://github.com/inukshuk/jekyll-scholar/issues/337#issuecomment-1008274226), I managed to find [a guide](https://martinopilia.com/posts/2020/02/22/migration.html) on building the website locally and deploying it automatically with the help of GitHub Actions. _(I've documented the process and necessary tweaks in [this blog post](/blog/2022-01-14-using-jekyll-scholar-with-github-pages))_ It was rather tedious and I managed to set it up, but this has allowed full customization and is fully customizable. Additionally I had to revisit [how to build & publish Docker images to Docker Hub](/blog/2022-01-13-how-to-publish-images-to-docker-hub), and learnt how to deploy with GitHub Actions.

All code for this website can be found [in this repository.](https://github.com/evantancy/evantancy.github.io)
