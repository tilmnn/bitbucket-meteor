FROM mhart/alpine-node:latest

RUN apk add --update bash curl && \
    rm -rf /var/cache/apk/*

RUN curl https://install.meteor.com/ | sh
