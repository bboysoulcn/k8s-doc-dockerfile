FROM node:lts-alpine3.9
RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    build-base \
    libc6-compat && \
    git clone --depth 1 https://github.com/kubernetes/website.git && \
    cd website && \
    npm install -G autoprefixer postcss-cli && \
    yarn && \
    git submodule update --init --recursive --depth 1
COPY --from=bboysoul/hugo-extended:latest /go/bin/hugo /usr/local/bin
WORKDIR /website
EXPOSE 1313
