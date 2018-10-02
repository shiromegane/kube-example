FROM node:alpine
MAINTAINER Shiromegane

RUN apk upgrade --no-cache && apk add --update --no-cache git
RUN npm install -g yarn
RUN yarn gloal add vue-cli
RUN yarn gloal add nuxt
RUN yarn gloal add create-nuxt-app

WORKDIR /client
