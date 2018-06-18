package psql

import (
	"encoding/json"
	"fmt"
	"log"
)

//SarumHymnal data stucture representation
//of a sarum hymnal hymn
type SarumHymnal struct {
	ID            int
	Folio         string
	Staves        string
	Clef          string
	FirstLine     string
	Melody        string
	Cycle         string
	FeastOrSeason string
	Grade         string
	Day           string
	Office        string
	Notes         string `json:",omitempty"`
}

//ToString returns a string reprsentation of SarumHymnal
func (s *SarumHymnal) ToString() string {
	return fmt.Sprintf("ID%dFolio%s", s.ID, s.Folio)
}

//QueryNew initializes a new SarumHynmal struct
//by executing a number of sql queries
func (s *SarumHymnal) QueryNew() {
	r := Query("f")
	for r.Next() {
		//Do all our parsing here...
		var name string
		if err := r.Scan(&name); err != nil {
			log.Fatal(err)
		}
	}
}

//MarshalJSON packs the struct into a JSON byte array
func (s *SarumHymnal) MarshalJSON() ([]byte, error) {
	return json.Marshal(s)
}
