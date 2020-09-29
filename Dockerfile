FROM golang:buster
RUN apt-get update && \
    apt-get install gcc git && \
    mkdir $HOME/src && \
    cd $HOME/src && \
    git clone https://github.com/gohugoio/hugo.git && \
    cd hugo && \
    CGO_ENABLED=1 && \
    go install --tags extended 
