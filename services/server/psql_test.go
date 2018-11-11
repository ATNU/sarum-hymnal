package main_test

import (
	"database/sql"
	sarum "github.com/mattnolf/sarumhymnal"
	"gopkg.in/DATA-DOG/go-sqlmock.v1"
	"testing"
)

func TestConnDB(t *testing.T) {

}

// TestQueryDB tests that nil or closed postgres connections are handled appropriately by means of reconnecting
// or returning errors as error propagation

func TestQueryDB(t *testing.T) {
	sarum.SetupConfig()

	db, mock, err := sqlmock.New()
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}
	defer db.Close()
	mock.ExpectQuery("SELECT all FROM hymns").WillReturnRows(nil)

	db2, mock2, err := sqlmock.New()
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}
	defer db.Close()
	mock2.ExpectQuery("SELECT all FROM hymns").WillReturnRows(nil)

	tt := []struct {
		db         *sql.DB
		mock       sqlmock.Sqlmock
		query      string
		shouldPass bool
	}{
		{db, mock, "SELECT all FROM hymns", true},
		{db2, mock2, "SELECT all FROM hymns", true},
		{nil, nil, "SELECT all FROM hymns", false},
	}

	for _, tc := range tt {
		t.Run(tc.query, func(t *testing.T) {
			_, err := sarum.QueryDB(tc.db, tc.query)
			if err != nil && tc.shouldPass {
				t.Errorf(err.Error())
			}

			if err := mock.ExpectationsWereMet(); err != nil {
				t.Errorf("there were unfulfilled expectations: %s", err)
			}
		})
	}
}
