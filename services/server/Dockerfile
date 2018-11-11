FROM golang:latest as builder

WORKDIR /go/src/webserver

RUN go get github.com/spf13/viper &&        \
    go get github.com/gorilla/mux &&        \
    go get github.com/lib/pq      &&        \
    go get github.com/fsnotify/fsnotify

ADD ./services/server ./

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix nocgo -o /app .

FROM alpine:3.8

COPY --from=builder /app ./
COPY ./services/server/.cfg.json ./

EXPOSE 4100:4100

ENTRYPOINT [ "./app" ]