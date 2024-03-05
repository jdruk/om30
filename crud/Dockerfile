# syntax = docker/dockerfile:1
ARG RAILS_ENV="development"
ARG RUBY_VERSION=3.0.6
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base
RUN mkdir /app
WORKDIR /app
COPY . .

ENV RAILS_ENV="$RAILS_ENV" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" 
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential curl git libvips node-gyp pkg-config python-is-python3 libpq-dev libpq5 curl libpq-dev libpq5 libmagickwand-dev imagemagick

ARG NODE_VERSION=18.19.1
ARG YARN_VERSION=1.22.21
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master
RUN bundle install 
COPY package.json yarn.lock ./
RUN yarn install 

RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile
RUN rm -rf /var/lib/apt/lists /var/cache/apt/archives
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /app
USER rails:rails

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
