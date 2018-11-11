package main_test

import (
	"database/sql"
	sarum "github.com/mattnolf/sarumhymnal"
	"gopkg.in/DATA-DOG/go-sqlmock.v1"
	"testing"
)

func TestQueryDate(t *testing.T) {

}

// - Attempts to reconnect to Postgres if connection closed
// - Returns error if no Postgres connection available
// - Returns error if row columns invalid
func TestQueryFolio(t *testing.T) {
	sarum.SetupConfig()

	db, mock, err := sqlmock.New()
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}
	defer db.Close()
	c := []string{"image", "folio", "stave", "hymn", "first_line", "melody", "cycle"}

	tt := []struct {
		db         *sql.DB
		folio      string
		columns    *sqlmock.Rows
		shouldPass bool
	}{
		{db, "001r", sqlmock.NewRows(c).FromCSVString("image, folio, stave, hymn, first_line, melody, cycle"), true},
		{db, "010v", sqlmock.NewRows(c).FromCSVString("1"), false},
		{nil, "010v", sqlmock.NewRows(c).FromCSVString("image, folio, stave, hymn, first_line, melody, cycle"), false},
	}
	for _, tc := range tt {
		t.Run(tc.folio, func(t *testing.T) {
			mock.ExpectQuery("[SELECT * FROM sarumhymnal.entry WHERE sarumhymnal.entry.folio = ](.*)").
				WithArgs(tc.folio).WillReturnRows(tc.columns)
			_, err := sarum.QueryFolio(tc.db, tc.folio)
			if err != nil && tc.shouldPass {
				t.Errorf(err.Error())
			}
		})
	}
}

func TestQueryPsalter(t *testing.T) {

}

func TestQuerySanctoral(t *testing.T) {

}
