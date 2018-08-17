//Package datatypes implements data types available to be retrieved and returned
//to client
package datatypes

import ()

const (
	stdReturn int = 20
)

type day int

const (
	null day = iota
	monday
	tuesday
	wednesday
	thursday
	friday
	saturday
	sunday
	daily
	feria
	octave
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
	StartDay      string   `json:"start_day,omitempty"`
	EndDay        string   `json:"end_day,omitempty"`
	Office        string   `json:"office,omitempty"`
	Notes         string   `json:",omitempty"`
}

/*

//ToString returns a string reprsentation of SarumHymnal
func (s *SarumHymnal) ToString() string {
	return fmt.Sprintf("ID%dFolio%sMelody%s", s.ID, s.FirstLine, s.Melody)
}

// GetByDate retreives all hymns chanted on a specific date
// Silently fails with incorrect date format (ISO) requested
// Parameters:
// - string date requested
// Returns a slice of SarumHymnal that may be chanted on provided date,
//	empty if incorrect date request
func (*SarumHymnal) GetByDate(date string) []SarumHymnal {
	t, err := time.Parse(time.RFC3339, date)
	if err != nil {
		log.Println(err)
		return nil
	}

	query := `
		SELECT sarumhymnal.hymn.name, sarumhymnal.hymn.day, sarumhymnal.hymn.office, sarumhymnal.hymn.note
		FROM sarumhymnal.hymn
		INNER JOIN sarumhymnal.event ON sarumhymnal.hymn.event=sarumhymnal.event."ID"
		WHERE
			((sarumhymnal.event.start_day=$1 AND sarumhymnal.event.start_month=$2)
			OR
			(sarumhymnal.event.start_day<$1 AND sarumhymnal.event.start_month<$2
				AND sarumhymnal.event.end_day>=$1 AND sarumhymnal.event.end_month>=$2)
			OR
			(sarumhymnal.event.start_day IS NULL))
			AND
			sarumhymnal.hymn.day IS NULL
				OR sarumhymnal.hymn.day='Daily'
				OR sarumhymnal.hymn.day=$3
				OR sarumhymnal.hymn.day='Feria'`

	if t.Weekday() == time.Sunday {
		log.Print("I went in", t.Weekday())
		query = strings.TrimRight(query, "OR sarumhymnal.hymn.day='Feria'")
	}

	//Query and check for errors
	r, err := psql.Query(query, t.Day(), t.Month(), t.Weekday().String())
	if err != nil {
		log.Println(err)
		return nil
	}
	defer r.Close()

	s := make([]SarumHymnal, 0, stdReturn)
	for r.Next() {
		tmp := new(SarumHymnal)
		r.Scan(&tmp.Name, &tmp.StartDay, &tmp.Office, &tmp.Notes)
		s = append(s, *tmp)
	}
	return s
}

// GetByFolio retreives all hymns noted on a specified folio
// Parameters:
// - string folio to search
// Returns a slice of SarumHymnal structs noted on the provided folio
func (*SarumHymnal) GetByFolio(folio string) []SarumHymnal {
	query := `
		SELECT sarumhymnal.hymn."ID", sarumhymnal.hymn.name, sarumhymnal.hymn.day, sarumhymnal.hymn.office, sarumhymnal.hymn.note
		FROM sarumhymnal.hymn
		INNER JOIN sarumhymnal.hymnentry ON sarumhymnal.hymn."ID"=sarumhymnal.hymnentry.hymn
		INNER JOIN sarumhymnal.entry ON sarumhymnal.entry."ID"=sarumhymnal.hymnentry.entry
		WHERE sarumhymnal.entry.folio=$1
	`

	//Query and check for errors
	r, err := psql.Query(query, folio)
	if err != nil {
		log.Println(err)
		return nil
	}
	defer r.Close()

	//Parse results into slice and return it
	s := make([]SarumHymnal, 0, stdReturn)
	for r.Next() {
		tmp := new(SarumHymnal)
		r.Scan(&tmp.ID, &tmp.Name, &tmp.StartDay, &tmp.EndDay, &tmp.Office, &tmp.Notes)
		s = append(s, *tmp)
	}
	return s
}

// Deprecated
// approveDay returns true if the requested date falls on the specified day of the hymn
// Parameters:
// - int request weekday
// - int hymn weekday
// Returns true if the hymn falls on the requested weekday
func approveDay(req, start, end int) bool {
	if day(start) == daily || day(start) == day(req) {
		return true
	}

	if day(start) == feria && day(req) != sunday {
		return true
	}

	if day(end) != null {
		if (day(req) > day(start) && day(req) <= day(end)) || (day(req) <= day(start) && day(req) > day(end)) {
			return true
		}
	}
	return false
}
*/
