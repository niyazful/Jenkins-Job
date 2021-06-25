FROM golang:1.16.0-alpine3.12 AS build
RUN apk add --no-cache git build-base
RUN git clone https://github.com/niyazful/Jenkins-Job/
RUN go build -o /job ./Jenkins-Job/main.go

FROM alpine:latest
COPY --from=build /job /usr/local/bin/job


ENTRYPOINT ["job"]

