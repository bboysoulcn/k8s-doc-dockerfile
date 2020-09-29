FROM golang:buster as builder
RUN apt-get update && \
    apt-get install gcc git && \
    mkdir $HOME/src && \
    cd $HOME/src && \
    git clone https://github.com/gohugoio/hugo.git && \
    cd hugo && \
    CGO_ENABLED=1 && \
    go install --tags extended 

FROM node:lts-alpine3.9
RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    build-base \
    libc6-compat && \
    git clone https://github.com/kubernetes/website.git && \
    cd website && \
    npm install -g yarn  && \
    npm install -G autoprefixer postcss-cli && \
    yarn && \
    git submodule update --init --recursive --depth 1
COPY --from=0 /go/bin/hugo /usr/local/bin
WORKDIR /website
EXPOSE 1313
