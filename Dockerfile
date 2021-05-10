FROM golang:latest as go

WORKDIR /golang

RUN git clone https://github.com/golang/example &&\
   cd example/hello &&\
    go build

 FROM busybox as linux
 WORKDIR /example

COPY --from=go /golang/example/hello/hello .

RUN pwd

RUN ./hello