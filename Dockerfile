FROM golang:latest

WORKDIR /go/src/webserver

RUN go get github.com/spf13/viper &&        \
    go get github.com/spf13/cobra &&        \
    go get github.com/gorilla/mux &&        \
    go get github.com/lib/pq      &&        \
    go get github.com/fsnotify/fsnotify

COPY . .

EXPOSE 8080:8080

RUN go install -v ./

CMD ["webserver"]