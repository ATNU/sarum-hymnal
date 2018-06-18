//Package psql provides primitives for establishing & managing connections to PostgreSQL
//and querying
package psql

import (
	"database/sql"
	_ "github.com/lib/pq" //Drivers required for postgres
	"log"
	"time"
	"webserver/cfg"
)

var db *sql.DB //Shared database connection

//Usable constrains data types to be retrieved from postgres
//and returnes as JSON to client
type Usable interface {
	QueryNew(d *sql.DB)
	MarshalJSON() ([]byte, error)
}

//Init initialises a connection to postgres.
//Testing that the database is fine to use.
//Arguments: string reprsentatin of connection params, attempt number (default 0)
func Init(apt int) {
	if apt > 0 {
		if apt >= cfg.ValueInt("postgres.timeoutattempt") {
			log.Fatal("Max attempts exceeded, shutting down")
		}
		log.Println("Attempting to reconnect to postgres: attempt", apt)
	}

	var err error
	log.Println("Attempting to connect to postgres")
	db, err = sql.Open("postgres", cfg.ConnString())
	if err != nil {
		log.Println(err)
		time.Sleep(5 * time.Second)
		Init(apt + 1)
	}
	err = db.Ping()
	if err != nil {
		log.Println(err)
		time.Sleep(5 * time.Second)
		Init(apt + 1)
	} else {
		log.Println("Successfully connected to postgres")
	}
}

//Query makes sure it is safe to query postgres, and then executes
//sql query.
//Resultant rows are returned
func Query(q string) *sql.Rows {
	if db == nil {
		Init(1)
	}
	err := db.Ping()
	if err != nil {
		log.Println(err)
		time.Sleep(5 * time.Second)
		Init(1)
	}

	rows, err := db.Query(q)
	if err != nil {
		log.Println(err)
	}

	return rows
}
