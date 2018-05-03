# allow overriding of go version
# default to 1.10.x version
ARG GO_VERSION='1.10'

# allow setting the major alpine version, default to 3.6
ARG ALPINE_MAJOR='3.6'

# use the AS <name> functionality to copy the binary to the runtime container
# later
FROM golang:$GO_VERSION-alpine AS build_container

# allow overriding of root import path
# provide a sane default (this project)
# (you should change this!!)
ARG PACKAGE_IMPORT='github.com/theckman/go-docker-skeleton'

WORKDIR /go/src/$PACKAGE_IMPORT

COPY . /go/src/$PACKAGE_IMPORT

RUN go version && \
    go env && \
    pwd && \
    go vet ./... && \
    go test -v ./... && \
    go build -o example ./cmd/example/

FROM alpine:$ALPINE_MAJOR

ARG PACKAGE_IMPORT='github.com/theckman/go-docker-skeleton'

COPY --from=build_container /go/src/$PACKAGE_IMPORT/example /usr/local/bin/example

ENTRYPOINT "/usr/local/bin/example"
