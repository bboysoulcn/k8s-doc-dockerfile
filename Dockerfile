FROM yarnpkg/node-yarn:node7 as builder
RUN git clone https://github.com/kubernetes/website.git && \
    cd website && \
    yarn && \
    git submodule update --init --recursive --depth 1
