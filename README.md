[![Build Status](https://travis-ci.org/ATNU/sarum-hymnal-webserver.svg?branch=master)](https://travis-ci.org/ATNU/sarum-hymnal-webserver)

[![GoDoc](https://godoc.org/github.com/golang/gddo?status.svg)](https://godoc.org/github.com/ATNU/sarum-hymnal-webserver)

[![Go Report Card](https://goreportcard.com/badge/github.com/ATNU/sarum-hymnal-webserver)](https://goreportcard.com/report/github.com/ATNU/sarum-hymnal-webserver)

# Sarum Hymnal

A digital edition of The Sarum Hymnal, a 16th-century part-book.
Service to calculate and retreive sarum hymnal data from [PostgreSQL] and serve via a RESTful API

## Installation
Requires [go].

Install dependancies and build binary:

```sh
$ go get 
    "github.com/lib/pq"             \
	"github.com/fsnotify/fsnotify"	\
    "github.com/gorilla/mux"        \
	"github.com/spf13/viper"
$ go build
```

Requires a connection to Postgres: use configuration to setup
* Ip & Port
* Authentication


## Usage


```sh
$ ./sarumhymnal
```
To initialise a RESTful API service with the following routes:

#### GET /folio/{folio}
Returns JSON object containing an array of sarum hymnal hymns described on {folio}
```sh
 [0-9]{3}[r|v]{1}
```

#### GET /date/{date}?easter={easter}
Returns JSON object containing an array of sarum hymnal hymns that should be chanted on {date} with
{easter} as the date that easter falls on the year of the query
```sh
yyyy-mm-ddThh:mm:ss.ffffff
```


[PostgreSQL]: https://www.postgresql.org/
[go]: https://golang.org/