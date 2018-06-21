//Package datatypes implements data types available to be retrieved and returned
//to client
package datatypes

import (
	"fmt"
	"log"
	"time"
	"webserver/psql"
)

const (
	stdReturn int = 20
)

//SarumHymnal data stucture representation
//of a sarum hymnal hymn
type SarumHymnal struct {
	ID            int      `json:"id,omitempty"`
	Name          string   `json:"name,omitempty"`
	Image         []string `json:"image,omitempty"`
	Folio         string   `json:"folio,omitempty"`
	Staves        string   `json:"staves,omitempty"`
	Clef          string   `json:"clef,omitempty"`
	FirstLine     string   `json:"first_line,omitempty"`
	Melody        string   `json:"melody,omitempty"`
	Cycle         string   `json:"cycle,omitempty"`
	FeastOrSeason string   `json:"feast_or_season,omitempty"`
	Grade         string   `json:"grade,omitempty"`
	Day           string   `json:"day,omitempty"`
	Office        string   `json:"office,omitempty"`
	Notes         string   `json:",omitempty"`
}

//ToString returns a string reprsentation of SarumHymnal
func (s *SarumHymnal) ToString() string {
	return fmt.Sprintf("ID%dFolio%sMelody%s", s.ID, s.FirstLine, s.Melody)
}

//QueryNew initializes a new SarumHynmal struct
//by executing a number of sql queries
func (s *SarumHymnal) QueryNew() {

}

//GetByDate retreives all hymns from postgres that may be chanted on that date
func (*SarumHymnal) GetByDate(date string) ([]SarumHymnal, error) {
	t, err := time.Parse(time.RFC3339, date)
	if err != nil {
		return nil, err
	}

	day := t.Weekday()

	log.Println(day)

	/*
		tempDate :=
			`SELECT * FROM webserver.hymn WHERE cycle='temporal' AND date=$1`

		temporalDate :=
			`SELECT * FROM webserver.hymn WHERE cycle='temporal'AND EXISTS (SELECT name FROM webserver.chanted WHERE hymn=webserver.hymn.id AND name=(SELECT name FROM webserver.event WHERE '11/04/18' BETWEEN event.start_date AND event.end_date))`

		temporalNoDate :=
			`SELECT * FROM webserver.hymn WHERE cycle='temporal'AND day=$1 AND NOT EXISTS (SELECT name FROM webserver.chanted WHERE hymn=webserver.hymn.name)`

		sanctoralDate :=
			`SELECT * FROM webserver.hymn WHERE cycle='sanctoral'AND EXISTS (SELECT name FROM webserver.chanted WHERE hymn=webserver.hymn.id AND name=(SELECT name FROM webserver.event WHERE '11/04/18' BETWEEN event.start_date AND event.end_date))`

		sanctoralNoDate :=
			``
	*/

	return nil, nil
}

//GetByPage retreives all hymns from postgres that may be chanted on that date
func (*SarumHymnal) GetByPage(page string) []SarumHymnal {
	query := `
		SELECT sarumhymnal.hymn."ID", sarumhymnal.hymn.name, sarumhymnal.hymn.day, sarumhymnal.hymn.office, sarumhymnal.hymn.note
		FROM sarumhymnal.hymn
		INNER JOIN sarumhymnal.hymnentry ON sarumhymnal.hymn."ID"=sarumhymnal.hymnentry.hymn
		INNER JOIN sarumhymnal.entry ON sarumhymnal.entry."ID"=sarumhymnal.hymnentry.entry
		WHERE sarumhymnal.entry.folio=$1
	`

	//Query and check for errors
	r, err := psql.Query(query, page)
	if err != nil {
		log.Println(err)
		return nil
	}
	defer r.Close()

	//Parse results into slice and return it
	s := make([]SarumHymnal, 0, stdReturn)
	for r.Next() {
		tmp := new(SarumHymnal)
		r.Scan(&tmp.ID, &tmp.Name, &tmp.Day, &tmp.Office, &tmp.Notes)
		s = append(s, *tmp)
	}
	return s
}
