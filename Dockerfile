FROM node:lts-alpine3.9
RUN apk add --no-cache git && \
    git clone https://github.com/kubernetes/website.git && \
    cd website && \
    npm install -g yarn --force && \
    yarn && \
    git submodule update --init --recursive --depth 1
