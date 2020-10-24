---
layout:            post
title:             "Jekyll on Github Pages"
subtitle:          "A quick note when starting my blog with Jekyll"
date:              2020-10-10 12:00:00
author:            "Rong"
banner:            "img/2020-10-10-jekyll-github-pages/bg.jpg"
categories:        "jekyll"
tags:              "jekyll"

---

I recently tried to find a new home for my blog posts. But setting up a blog post site is very 
taxing - There are so many options out there and so many posts just describing the pros and 
cons. However as a long term Github/OSS contributor, I landed on using Github Pages with Jekyll.

## A Quick Setup

Github Pages actually has a pretty nice [startup guide][github_quickstart] to get you off the ground.
Similarly Jekyll also have a [quick start][jekyll_quickstart] page that you can used as your first
page. 

After following the instruciton above, you should land on a Github page similar to this:
![Insert Image]({{site.baseurl}}/img/2020-10-10-jekyll-github-pages/example_scaffold.png)

Now let's customize and make it look more like a blog post.


## Understand the scaffold

First let's understand the scaffolding result of the Jekyll new page. The simple scaffolding 
should provide you with the following contents:
![Insert Image]({{site.baseurl}}/img/2020-10-10-jekyll-github-pages/scaffold_content.png)

* A `Gemfile` is used, in this case by bundle, to download the necessary dependency Gem for 
Jekyll before the compilation. 
* A `_config.yml` contents the configuration for your Jekyll pages via site-wide variables.
* Scaffolding contents such as an `index.md` file that serves as your main page; an `about.md`
 page that's hyperlinked from your main page (top right corner); and a post markdown inside the 
 `_post` directory.


However these are not directly served: A compiled version of the website will be generated when
executing `jekyll serve`. The content should look like this once compiled:
![Insert Image]({{site.baseurl}}/img/2020-10-10-jekyll-github-pages/scaffold_compile.png)

As you can see, the site is constructed with many extra asserts that are not part of your scaffold
blog directory. These are coming from your Gemfile dependencies, but let's focus on one of the most 
customizable piece - the Jekyll theme.


## Using a theme

The first change I did to the scaffolding page is making it more suitable for blog posting. 

Your page is simply scaffolded with a default theme call [Minima][jekyll_theme_minima]. Github Pages
already have a [configuration for theming][github_jekyll_theme] option. However, I found that there 
are many limitations for Github themes that I decided to go with the official 
[Jekyll themes][jekyll_theme] support instead.

There are 2 types of themes you can choose:
* Direct theme: Theme files are downloaded into your blog post directory and compiled together with 
your blog post markdown contents.

* Gem-based theme: Theme files are packaged into a Gem and Jekyll will treat it as a compile time
dependency when building/serving the blog post website. I choosed to use the Gem-based theme because
of one simple reason: It is more convenient to receive upstream bug fixes & other contributions on
the theme itself. You will have to do it manually if using direct theme.

When choosing a theme to use, it is always convenient to use something that is open source & have lots 
of sample posts, customizations and demos. It is super easy to used those as a reference your website.

As an example, my page is depending on a Jekyll theme: [Yat][jekyll_theme_yat]
* It is a Gem-based theme;
* It contains many posts as well as demo pages for your tasting;
* It has a variaty of customization demos to showcase how the page can be tuned to fit your need.


## Build, preview, and deploy

Now that we chose a theme to work with, it is always nice to be able to preview what you wrote in 
real-time. Now, I wasn't an expert in Ruby, npm, Gem, etc. In fact I hardly use these tools in my
day-to-day work. Thus I actually spend some time building a script to serve this purpose.

### Incremental serving
There are many ways to setup local serving that mirrors what you will be deploying in Github Pages.
However, as a blogger I want to spend most of my time actually working on the blog contents, 
fine-tuning the presentation of the blog posts instead of fiddling with the framework.

Therefore I built a self-contained [build script][github_build_script] to manage Jekyll. Simply
running 
```bash
build.sh <your_blog_directory> -p
```
will create an incremental Jekyll serving that automatically rebuilds your blog post content while
you edit your markdown pages. You don't have to worry about managing Ruby dependencies. Gem package
downloading, or messing with user vs. system rubygem conflicts and such. Please feel free to copy
it for your own use.

### Deploy
Noted that Github Pages actulaly supports [publishing source options][github_publish_source] in your
repository setting by automatically compiling & serving your page out of a particular subfolder of 
the repo:
![Insert Image]({{site.baseurl}}/img/2020-10-10-jekyll-github-pages/github_page_publish_source.png)

If you set the folder to be the same as your Jekyll scaffolding root directory inside your repo, you
are done! Everything you saw during the Jekyll incremental serving will be displayed as-is on your
Github Pages!


## Follow Ups
This blog post was only created as my first post after migrating to Github Pages. By no means it serves
as a guide to in-dept Jekyll usage. There are many I explored but not yet formulated in this post. 

To list a few for follow ups in the future:
* Serving multiple pages out of a single repository - [`build.sh`][github_build_script] was designed 
for this purpose.
* `npm deploy` instead of relying on Github repo config - checkout my [fork][github_pytorch_ci_hud] of 
another github page.
* Serving contents outside of Github pages. 






[github_quickstart]: https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll
[github_publish_source]: https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site
[github_jekyll_theme]: https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/adding-a-theme-to-your-github-pages-site-using-jekyll
[github_build_script]: https://github.com/walterddr/walterddr.github.io/blob/master/build.sh
[github_pytorch_ci_hud]: https://https://walterddr.github.io/pytorch-ci-hud/
[jekyll_quickstart]: https://jekyllrb.com/docs/
[jekyll_theme]: https://jekyllrb.com/docs/themes/
[jekyll_theme_minima]: https://github.com/jekyll/minima
[jekyll_theme_yat]: https://github.com/jeffreytse/jekyll-theme-yat
[markdown_wiki]: https://en.wikipedia.org/wiki/Markdown

