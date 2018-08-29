package main

import (
	"database/sql"
	"errors"
	"fmt"
	_ "github.com/lib/pq" //Drivers required for postgres
	"github.com/spf13/viper"
	"log"
	"time"
)

// ConnDB initialises a new connection to Postgres
// Parameters:
// - int retry attempt
//
// Unsuccessful connection attempts are reattempted by method of exponential backoff
func ConnDB(n int) (*sql.DB, error) {
	if n > 0 {
		if n >= viper.GetInt("postgres.maxtimeoutattempt") {
			log.Println("Could not connect to postgres: Max attempts exceeded")
		}
		log.Println("Attempting to reconnect to postgres: Attempt", n)
		return nil, errors.New("Could not connect to postgres")
	}

	log.Println("Attempting to connect to postgres")
	db, err := sql.Open("postgres", connName())
	if err != nil {
		log.Println(err)
		time.Sleep(time.Duration(5*n) * time.Second)
		ConnDB(n + 1)
	}
	err = db.Ping()
	if err != nil {
		log.Println(err)
		time.Sleep(time.Duration(5*n) * time.Second)
		ConnDB(n + 1)
	} else {
		log.Println("Successfully connected to postgres")
	}
	return db, nil
}

// QueryDB queries postgres, first testing that the connection is valid and invoking a connection request if invalid
// Parameters:
// - *sql.DB postgres database connection
// - string query
// - ...Interface{} query arguments
//
// Returns:
// - sql.Rows retreived rows
// - error any errors propagated by query
func QueryDB(db *sql.DB, q string, args ...interface{}) (*sql.Rows, error) {
	if db == nil {
		log.Println("In")
		var err error
		db, err = ConnDB(0)
		if err != nil {
			return nil, err
		}
	}
	err := db.Ping()
	if err != nil {
		log.Println(err)
		db, err = ConnDB(1)
		if err != nil {
			return nil, err
		}
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
