FROM node:lts-alpine3.9
RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    build-base \
    libc6-compat \
    hugo && \
    git clone https://github.com/kubernetes/website.git && \
    cd website && \
    npm install -g yarn  && \
    npm install -G autoprefixer postcss-cli && \
    yarn && \
    git submodule update --init --recursive --depth 1
WORKDIR /website
EXPOSE 1313
