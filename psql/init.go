//Package psql provides primitives for establishing & managing connections to PostgresSQL
package psql

import (
	"database/sql"
	"fmt"
	pq "github.com/lib/pq"
	vp "github.com/spf13/viper"
	"log"
)

//Init initialises a connection to the Postgres server
func Init(cfg string) {
	vp.Get("host")
	db, err := sql.Open("postgres", cfg)
	if err != nil {
		log.Fatal(err)
	}

	conn, err := pq.NewConnector("name")
	_ = conn

	err = db.Ping()
	if err != nil {
		panic(err)
	} else {
		log.Println("Connection established")
	}
}
