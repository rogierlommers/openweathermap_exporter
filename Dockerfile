# BUILD PHASE
FROM golang:alpine as builder

RUN apk update && apk add git
COPY . $GOPATH/src/github.com/rogierlommers/openweathermap_exporter/
WORKDIR $GOPATH/src/github.com/rogierlommers/openweathermap_exporter/
RUN go get -d -v
RUN go build -o /go/bin/openweathermap_exporter

# RUN PHASE
FROM alpine
EXPOSE 2112
COPY --from=builder /go/bin/openweathermap_exporter /bin/openweathermap_exporter
ENTRYPOINT ["/bin/openweathermap_exporter"]
