package main

import (
	"database/sql"
	_ "log"
	_ "time"
)

//SarumHymnal representation of sarumhymnal hymn
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
	StartDay      string   `json:"start_day,omitempty"`
	EndDay        string   `json:"end_day,omitempty"`
	Office        string   `json:"office,omitempty"`
	Notes         string   `json:",omitempty"`
}

// QueryFolio retreives all hymns noted on a specified folio
// Parameters:
// - string folio to search
//
// Returns JSON data
// {
//	h1": {
//		"name": "Hymn 1"
//		"Melody": "C1"
//	},
//	"h2": {
//		"name": "Hymn 2"
//		"Melody": "C2"
//	}
// }
func QueryFolio(folio string) ([]SarumHymnal, error) {
	/* query := `
		SELECT sarumhymnal.hymn."ID", sarumhymnal.hymn.name, sarumhymnal.hymn.day, sarumhymnal.hymn.office, sarumhymnal.hymn.note
		FROM sarumhymnal.hymn
		INNER JOIN sarumhymnal.hymnentry ON sarumhymnal.hymn."ID"=sarumhymnal.hymnentry.hymn
		INNER JOIN sarumhymnal.entry ON sarumhymnal.entry."ID"=sarumhymnal.hymnentry.entry
		WHERE sarumhymnal.entry.folio=$1
	`

	r, err := QueryDB(query, folio)
	if err != nil {
		log.Println(err)
		return nil, err
	}
	defer r.Close()

	s := make([]SarumHymnal, 0)
	for r.Next() {
		tmp := new(SarumHymnal)
		r.Scan(&tmp.ID, &tmp.Name, &tmp.StartDay, &tmp.EndDay, &tmp.Office, &tmp.Notes)
		s = append(s, *tmp)
	}
	return s, nil */
	return nil, nil
}

// QueryDate retreives all hymns noted on a specified folio
// Parameters:
// - string queried date
// - string date of easter
//
// Returns JSON data
// {
//	h1": {
//		"name": "Hymn 1"
//		"Melody": "C1"
//	},
//	"h2": {
//		"name": "Hymn 2"
//		"Melody": "C2"
//	}
// }
func QueryDate(d, e string) ([]SarumHymnal, error) {

	/* t, err := time.Parse(time.RFC3339, d)
	if err != nil {
		return nil, err
	}

	query := `
			SELECT * FROM sarumhymnal.psalter
			WHERE sarumhymnal.psalter.day = $1
	`
	// Returns all hymns
	// We then need to get the meta data for them -- including which filename they belong to

	r, err := QueryDB(query, t.Day())
	if err != nil {
		log.Println(err)
		return nil, err
	}
	defer r.Close()
	return pack(r), nil */
	return nil, nil
}

// pack provides functionality to parse SQL rows into struct for JSON marshalling
func pack(r *sql.Rows) []SarumHymnal {
	s := make([]SarumHymnal, 0)
	for r.Next() {
		tmp := new(SarumHymnal)
		r.Scan(&tmp.ID, &tmp.Name, &tmp.StartDay, &tmp.EndDay, &tmp.Office, &tmp.Notes)
		s = append(s, *tmp)
	}
	return s
}
