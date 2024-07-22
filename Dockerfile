FROM golang:1.18.4-alpine3.16 as build
WORKDIR /build
COPY . .
RUN go get -d -v .
RUN go build -v -o hg612-exporter .

FROM alpine:3.20.2
WORKDIR /service
COPY --from=build /build/hg612-exporter .
ENTRYPOINT ["./hg612-exporter"]