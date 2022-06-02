FROM golang:1.18.3-alpine3.15 as build
WORKDIR /build
COPY . .
RUN go get -d -v .
RUN go build -v -o hg612-exporter .

FROM alpine:3.15.4
WORKDIR /service
COPY --from=build /build/hg612-exporter .
ENTRYPOINT ["./hg612-exporter"]