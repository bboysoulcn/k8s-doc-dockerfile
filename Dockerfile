FROM golang:alpine3.12
RUN apk add --no-cache git && \
    mkdir $HOME/src && \
    cd $HOME/src && \
    git clone https://github.com/gohugoio/hugo.git && \
    cd hugo && \
    CGO_ENABLED=1 && \
    go install --tags extended 
