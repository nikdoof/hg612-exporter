FROM golang:alpine as build
WORKDIR /build
COPY . .
RUN go get -d -v .
RUN go build -v -o hg612-exporter .

FROM alpine:3.15.0
WORKDIR /service
COPY --from=build /build/hg612-exporter .
ENTRYPOINT ["./hg612-exporter"]