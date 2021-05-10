FROM golang:latest as go

COPY . /go/src

RUN cd src &&\
   go mod init hello &&\
    unset GOPATH &&\
    go build

FROM busybox as linux

WORKDIR /example

COPY --from=go /go/src/hello .

RUN pwd

ENTRYPOINT [ "./hello" ]