FROM golang:latest as go

COPY . /go/src

RUN cd src &&\
   go mod init hello &&\
    unset GOPATH &&\
    go build

FROM scratch as linux

WORKDIR /example

COPY --from=go /go/src/hello .

ENTRYPOINT [ "./hello" ]