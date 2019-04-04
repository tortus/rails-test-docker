# Ruby 2.5.5 image with nodejs, yarn, and postgresql client installed
FROM ruby:2.5.5-stretch

ENV RAILS_ENV=test
ENV RACK_ENV=test
ENV PASSENGER_APP_ENV=test
ENV NODE_ENV=test

ENV SECRET_KEY_BASE=TEST_SECRET_KEY_BASE
ENV DEVISE_DECRET_KEY=TEST_DEVISE_SECRET_KEY

ENV BUNDLER_VERSION=2.0.1

RUN apt-get update && apt-get install -y --no-install-recommends apt-transport-https && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
  git \
  libpq-dev \
  nodejs \
  postgresql-client \
  yarn && \
  gem install bundler -v ${BUNDLER_VERSION} && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
