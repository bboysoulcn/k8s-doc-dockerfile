FROM node:lts-alpine3.9
RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    build-base \
    libc6-compat \
    hugo && \
    npm install -G autoprefixer postcss-cli && \
    git clone https://github.com/kubernetes/website.git && \
    cd website && \
    npm install -g yarn --force && \
    yarn && \
    git submodule update --init --recursive --depth 1
WORKDIR /website
EXPOSE 1313
