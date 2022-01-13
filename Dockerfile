FROM jekyll/builder:3.8
RUN apk add --update --no-cache nodejs npm
RUN gem install kramdown-math-katex bundler
