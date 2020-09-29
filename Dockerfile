FROM node:lts-alpine3.9
RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    build-base \
    libc6-compat \
    npm && \
    npm install -G autoprefixer postcss-cli
    git clone https://github.com/kubernetes/website.git && \
    cd website && \
    npm install -g yarn --force && \
    yarn && \
    git submodule update --init --recursive --depth 1

RUN mkdir -p /usr/local/src && \
    cd /usr/local/src && \
    curl -L https://github.com/gohugoio/hugo/releases/download/v0.74.3/hugo_extended_0.74.3_Linux-64bit.deb | tar -xz && \
    mv hugo /usr/local/bin/hugo && \
    addgroup -Sg 1000 hugo && \
    adduser -Sg hugo -u 1000 -h /website hugo
WORKDIR /website

EXPOSE 1313
