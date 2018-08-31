[![Build Status](https://travis-ci.org/ATNU/sarum-hymnal-webserver.svg?branch=master)](https://travis-ci.org/ATNU/sarum-hymnal-webserver) [![GoDoc](https://godoc.org/github.com/golang/gddo?status.svg)](https://godoc.org/github.com/ATNU/sarum-hymnal-webserver) [![Go Report Card](https://goreportcard.com/badge/github.com/ATNU/sarum-hymnal-webserver)](https://goreportcard.com/report/github.com/ATNU/sarum-hymnal-webserver)

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

Requires a running instance of [PostgreSQL] that sarum can access.
```sh
{
    "postgres":{
        "maxtimeoutattempt": 1,
        "account": {
            "user": "postgres",
            "password": "pass",
            "dbname": "sarumhymnal",
            "schema": "sarumhymnal"
        },
        "conn": {
            "host": "localhost",
            "port": "5432",
            "sslmode":"disable"
        }
    },
    "host":{
        "timeout": {
            "write": 15,
            "read": 15,
            "idle": 60,
            "cancel": 60 
        },
        "domain": "localhost",
        "port": ":8080"
    }
}
```

## Usage
```sh
$ ./sarumhymnal
```
Initialises webserver with the following routes:

##### GET /folio/{folio}
Query a specific folio to retreive hymns described on that folio. Valid folio must be of form ``` [0-9]{3}[r|v]{1} ```
Invalid folio requests will return ```400``` response.

###### Response:
```sh
{
    "[name]": {
        "image": "[image]"
        "folio": "[folio"
        "staves": "[staves]"
        "hymn": "[hymn]"
        "clef": "[clef]" 
        "firstLine" "[firstline" 
        "melody": "[melody]"
        "cycle": "[cycle]"
    },
    ...
}
```

##### GET /date/{date}?easter={easter}
Query a specific date to retreive hymns chanted on that date. Valid date must be of form ```yyyy-mm-ddThh:mm:ss.ffffff```.
Date of easter on specified year must also be provided in same form.
Invalid date requests will return ```400``` response.

###### Response:
```sh
{
    "matins": {
        "image": "[image]"
        "folio": "[folio]"
        "staves": "[staves]"
        "hymn": "[hymn]"
        "clef": "[clef]" 
        "firstLine" "[firstline]" 
        "melody": "[melody]"
        "cycle": "[cycle]"
    },
    "lauds": {
        "image": "[image]"
        "folio": "[folio]"
        "staves": "[staves]"
        "hymn": "[hymn]"
        "clef": "[clef]" 
        "firstLine" "[firstline]" 
        "melody": "[melody]"
        "cycle": "[cycle]"
    },
    "prime": {
        "image": "[image]"
        "folio": "[folio]"
        "staves": "[staves]"
        "hymn": "[hymn]"
        "clef": "[clef]" 
        "firstLine" "[firstline]" 
        "melody": "[melody]"
        "cycle": "[cycle]"
    },
    "terce": {
        "image": "[image]"
        "folio": "[folio]"
        "staves": "[staves]"
        "hymn": "[hymn]"
        "clef": "[clef]" 
        "firstLine" "[firstline]" 
        "melody": "[melody]"
        "cycle": "[cycle]"
    },
    "sext": {
        "image": "[image]"
        "folio": "[folio]"
        "staves": "[staves]"
        "hymn": "[hymn]"
        "clef": "[clef]" 
        "firstLine" "[firstline]" 
        "melody": "[melody]"
        "cycle": "[cycle]"
    },
    "none": {
        "image": "[image]"
        "folio": "[folio]"
        "staves": "[staves]"
        "hymn": "[hymn]"
        "clef": "[clef]" 
        "firstLine" "[firstline]" 
        "melody": "[melody]"
        "cycle": "[cycle]"
    },
    "vespers1": {
        "image": "[image]"
        "folio": "[folio]"
        "staves": "[staves]"
        "hymn": "[hymn]"
        "clef": "[clef]" 
        "firstLine" "[firstline]" 
        "melody": "[melody]"
        "cycle": "[cycle]"
    },
    "vespers2": {
        "image": "[image]"
        "folio": "[folio]"
        "staves": "[staves]"
        "hymn": "[hymn]"
        "clef": "[clef]" 
        "firstLine" "[firstline]" 
        "melody": "[melody]"
        "cycle": "[cycle]"
    }
}
```

### A note on Postgres

A SQL dump ```db.sql``` is provided to rebuild schema containing some sample data that may be used.

To reload the script into a fresh Postgres DB use:
```sh
psql -d newdb -f db.sql
```


###### Relational Diagram:
[Here is a link to relational diagram]



[Here is a link to relational diagram]:https://mermaidjs.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBlbnRyeVxuICAgIGltYWdlXG4gICAgaHltbiAtLT4gcHNhbHRlclxuICAgIGh5bW4gLS0-IGNvbW1vblxuICAgIGh5bW4gLS0-IHNhbmN0b3JhbFxuICAgIFxuICAgIFxuIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifX0
[PostgreSQL]: https://www.postgresql.org/
[go]: https://golang.org/