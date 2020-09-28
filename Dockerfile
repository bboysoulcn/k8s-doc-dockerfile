FROM node:lts-alpine3.9
RUN git clone https://github.com/kubernetes/website.git && \
    cd website && \
    npm install -g yarn && \
    yarn && \
    git submodule update --init --recursive --depth 1
