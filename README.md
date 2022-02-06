# evantancy.github.io
All code and files for [my personal website.](https://evantancy.github.io/)

# Running Locally
To preview locally, first install bundle, ruby-dev and jekyll
```bash
# install dependencies
sudo apt install ruby-dev
gem install bundler jekyll
# run and preview
bundle exec jekyll serve
```

# LaTeX Support
KaTeX is used here, thanks to blog posts [here](https://www.xuningyang.com/blog/2021-01-11-katex-with-jekyll/) for the initial setup and [here](https://trass3r.github.io/coding/2019/02/01/KaTeX-and-Jekyll.html) for enabling inline math (also check out **_includes/katex.html**)

# Syntax Highlighting
You will need a .css file with the theme. Locally, you can generate this by installing rouge, then using rougify to generate the stylesheet of choice (in the code below I am selecting the github style). Then link the stylesheet in your HTML file header with `<link rel="stylesheet" href="path-to-stylesheet.css">`

```bash
gem install rouge
rougify help style
rougify style github > ./path/style.css
```
# Credits
- [Gregory Gundersen's blog](https://gregorygundersen.com/) which focuses on simplicity and technical writing instead of style.
- [Jekyll ToC](https://github.com/allejo/jekyll-toc) for automated generation of table of contents with no plugins.

# TODO
- ~~enable jekyll-scholar for bibliography~~
