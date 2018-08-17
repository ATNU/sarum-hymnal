# Sarum Hymnal

Service to calculate and retreive sarum hymnal data from [PostgreSQL]

## Installation
Requires [go] to build
Install dependancies and build binary

```sh
$ go get 
    "github.com/lib/pq"             \
	"github.com/fsnotify/fsnotify"	\
    "github.com/gorilla/mux"        \
	"github.com/spf13/viper"
$ go build
```

Configuration found in '.cfg.json'


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