FROM ruby:alpine
MAINTAINER Shiromegane

ENV TZ=Asia/Tokyo \
    LANG=C.UTF-8 \
    ROOT_PATH=/api \
    BUILD_PATH=/tmp \
    BUNDLE_PATH=/bundle \
    BUNDLE_JOBS=16 \
    BUNDLE_GEMFILE=/api/Gemfile

RUN apk upgrade --no-cache && apk add --update --no-cache \
      vim \
      mysql-dev \
      libidn-dev \
      nodejs \
      ruby-json \
      tzdata \
      yaml \
      ffmpeg \
      imagemagick \
      git \
      build-base \
      ca-certificates \
      curl-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      ruby-dev \
      yaml-dev \
      zlib-dev && \
    npm install -g yarn && \
    gem install bundler && \
    gem update bundler && \
    bundle config path $BUNDLE_PATH && \
    bundle config jobs $BUNDLE_JOBS && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    rm -rf /var/cache/apk/* && \
    rm -rf /usr/bin/mysql*

WORKDIR $ROOT_PATH
