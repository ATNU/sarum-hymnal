package main

import (
	"database/sql"
	"fmt"
	_ "github.com/lib/pq" //Drivers required for postgres
	"github.com/spf13/viper"
	"log"
	"time"
)

var db *sql.DB

// ConnDB initialises a new connection to Postgres
// Parameters:
// - int retry attempt
//
// Unsuccessful connection attempts are reattempted by method of exponential backoff
func ConnDB(n int) {
	log.Println(connName())
	if n > 0 {
		if n >= viper.GetInt("postgres.timeoutattempt") {
			log.Fatal("Max attempts exceeded, shutting down")
		}
		log.Println("Attempting to reconnect to postgres: attempt", n)
	}

	var err error
	log.Println("Attempting to connect to postgres")
	db, err = sql.Open("postgres", connName())
	if err != nil {
		log.Println(err)
		time.Sleep(time.Duration(5*n) * time.Second)
		ConnDB(n + 1)
	}
	err = db.Ping()
	if err != nil {
		log.Println(err)
		time.Sleep(5 * time.Second)
		ConnDB(n + 1)
	} else {
		log.Println("Successfully connected to postgres")
	}
}

// QueryDB queries postgres using shared Postgres connection
// If no connection is available, a new Postgres connection request is invoked
// Parameters:
// - string query
// - ...Interface{} query arguments
//
// Returns:
// - sql.Rows retreived rows
// - error any errors propagated by query
func QueryDB(q string, args ...interface{}) (*sql.Rows, error) {
	if db == nil {
		ConnDB(1)
	}
	err := db.Ping()
	if err != nil {
		log.Println(err)
		ConnDB(1)
	}
	return db.Query(q, args...)
}

// connName helper function to build Postgres connection string
func connName() string {
	return fmt.Sprintf("host=%s port=%s sslmode=%s user=%s password=%s dbname=%s",
		viper.GetString("postgres.conn.host"), viper.GetString("postgres.conn.port"), viper.GetString("postgres.conn.sslmode"),
		viper.GetString("postgres.account.user"), viper.GetString("postgres.account.password"),
		viper.GetString("postgres.account.dbname"))
}
