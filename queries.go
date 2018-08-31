package main

import (
	"database/sql"
	"log"
	"time"
)

const officeSize = 7
const (
	matins = iota
	lauds
	prime
	terce
	sext
	none
	vespers1
	vespers2
)

var office = map[int]string{
	0: "matins",
	1: "lauds",
	2: "prime",
	3: "terce",
	4: "sext",
	5: "none",
	6: "vespers1",
	7: "vespers2",
}

// SarumHymnal representation of sarumhymnal hymn
type SarumHymnal struct {
	Image     string `json:"image"`
	Folio     string `json:"folio"`
	Staves    string `json:"staves"`
	Hymn      string `json:"name"`
	Clef      string `json:"clef"`
	FirstLine string `json:"first_line"`
	Melody    string `json:"melody"`
	Cycle     string `json:"cycle"`
}

// QueryDate orchestrates a number of queries to determine the hymns chanted at each office
// The basic precedence works as follows: Psalter unless Temporal unless Common unless Sanctoral
// Parameters:
// - string query date
// - string date of easter on queried year
//
// Returns:
// - Response data containing a SarumHymnal struct for each office
// - error any errors encountered are propagated along with empty response
func QueryDate(db *sql.DB, d, e *time.Time) (map[string]SarumHymnal, error) {
	psalter, err := QueryDatePsalter(db, d)
	if err != nil {
		return nil, err
	}
	temporal, err := QueryDateTemporal(db, d)
	if err != nil {
		return nil, err
	}
	sanctoral, err := QueryDateSanctoral(db, d)
	if err != nil {
		return nil, err
	}
	_, err = QueryDateCompline(db, d)
	if err != nil {
		return nil, err
	}

	r := make(map[string]SarumHymnal)
	for i := matins; i < officeSize; i++ {
		if val, ok := sanctoral[i]; ok == true {
			r[office[i]] = val
		} else if val, ok := temporal[i]; ok == true {
			r[office[i]] = val
		} else {
			r[office[i]] = psalter[i]
		}
	}
	log.Println(r)
	return r, nil
}

// QueryFolio retreives all hymns described on a specified folio
// Parameters:
// - string folio to search
//
// Returns:
// - []SarumHymnal Results from hymns described on the specified folio
// - error Any errors received are propagated
func QueryFolio(db *sql.DB, folio string) ([]SarumHymnal, error) {
	query := `
		SELECT * FROM sarumhymnal.entry
		WHERE sarumhymnal.entry.folio = $1
	`

	r, err := QueryDB(db, query, folio)
	if err != nil {
		return nil, err
	}
	defer r.Close()

	s := make([]SarumHymnal, 0)
	for r.Next() {
		h := new(SarumHymnal)
		err := r.Scan(&h.Image, &h.Folio, &h.Staves, &h.Hymn, &h.FirstLine, &h.Melody, &h.Cycle)
		if err != nil {
			return nil, err
		}
		s = append(s, *h)
	}
	return s, nil
}

// QueryDatePsalter performs a query on the Psalter cycle
// Parameters:
// - *sql.DB database connection
// - *time.Time query date
//
// Returns a slice of Hymns and propagates any errors
func QueryDatePsalter(db *sql.DB, t *time.Time) (map[int]SarumHymnal, error) {
	query := `
	SELECT matins, lauds, prime, terce, sext, none, vespers FROM sarumhymnal.psalter
	WHERE sarumhymnal.psalter.desc = $1
	`
	/* for _, val := range checkRange(&t) {
		query = query + ` OR sarumhymnal.psalter.desc = '` + val + `'`
	} */

	r, err := QueryDB(db, query, t.Weekday().String())
	if err != nil {
		return nil, err
	}
	defer r.Close()

	res := make(map[int]SarumHymnal)
	for r.Next() {
		var m, l, p, t, s, n, v string
		r.Scan(&m, &l, &p, &t, &s, &n, &v)
		res[matins] = SarumHymnal{Hymn: m}
		res[lauds] = SarumHymnal{Hymn: l}
		res[prime] = SarumHymnal{Hymn: p}
		res[terce] = SarumHymnal{Hymn: t}
		res[sext] = SarumHymnal{Hymn: s}
		res[none] = SarumHymnal{Hymn: n}
		res[vespers1] = SarumHymnal{Hymn: v}
	}

	query = `
			SELECT * FROM sarumhymnal.entry
			WHERE sarumhymnal.entry.hymn = $1
			`

	for idx := range res {
		log.Println(query)
		log.Println(res[idx].Hymn)

		r, err := QueryDB(db, query, res[idx].Hymn)
		if err != nil {
			return nil, err
		}
		for r.Next() {
			h := res[idx]
			r.Scan(&h.Image, &h.Folio, &h.Staves, &h.Hymn, &h.FirstLine, &h.Melody, &h.Cycle)
			res[idx] = h
		}
		r.Close()
	}
	return res, nil
}

// QueryDateTemporal performs a query on the Temporal cycle
// Parameters:
// - string date
//
// Returns:
// - map[int]SarumHymnal Hymns sung at each office (key)
// - error any errors encountered along with nil map
func QueryDateTemporal(db *sql.DB, t *time.Time) (map[int]SarumHymnal, error) {
	// TODO: Implement
	return map[int]SarumHymnal{}, nil
}

// QueryDateSanctoral performs a query on the Sanctoral cycle
// Parameters:
// - string date
//
// Returns:
// - map[int]SarumHymnal Hymns sung at each office (key)
// - error any errors encountered along with nil map
func QueryDateSanctoral(db *sql.DB, t *time.Time) (map[int]SarumHymnal, error) {
	log.Println("Running query...")
	query := `
	SELECT common, vespers1, matins, lauds, vespers2 FROM sarumhymnal.sanctoral
	WHERE sarumhymnal.sanctoral.month = $1 AND sarumhymnal.sanctoral.day = $2
	`
	r, err := QueryDB(db, query, int(t.Month()), t.Day())
	if err != nil {
		return nil, err
	}
	defer r.Close()

	res := make(map[int]SarumHymnal, 1)
	for r.Next() {
		var sanc = struct {
			Common string
			Office map[int]string
		}{Office: map[int]string{}}
		var v1, m, l, v2 string
		r.Scan(&sanc.Common, &v1, &m, &l, &v2)
		sanc.Office[vespers1] = v1
		sanc.Office[matins] = m
		sanc.Office[lauds] = l
		sanc.Office[vespers2] = v2

		for idx := range sanc.Office {
			if sanc.Office[idx] == "Common" {
				query := `SELECT ` + office[idx] + `
				FROM sarumhymnal.common
				WHERE sarumhymnal.common.abbrev = $1
				`

				//dateRange := CHECK t fits within range start_day-start_month < t < end_day-end_month

				r, err := QueryDB(db, query, sanc.Common)
				if err != nil {
					return nil, err
				}
				for r.Next() {
					var h string
					r.Scan(&h)
					res[idx] = SarumHymnal{Hymn: h}
				}
				r.Close()
			} else {
				res[idx] = SarumHymnal{Hymn: sanc.Office[idx]}
			}
		}
	}

	query = `
			SELECT image, folio, stave, hymn, first_line, cycle FROM sarumhymnal.entry
			WHERE sarumhymnal.entry.hymn = $1
			`
	for idx := range res {
		r, err := QueryDB(db, query, res[idx].Hymn)
		if err != nil {
			return nil, err
		}
		for r.Next() {
			h := res[idx]
			r.Scan(&h.Image, &h.Folio, &h.Staves, &h.Hymn, &h.FirstLine, &h.Cycle)
			res[idx] = h
		}
		r.Close()
	}
	return res, nil
}

// QueryDateCompline performs a query on the Compline cycle
// Parameters:
// - string date
//
// Returns:
// - map[int]SarumHymnal Hymns sung at each office (key)
// - error any errors encountered along with nil map
func QueryDateCompline(db *sql.DB, t *time.Time) (map[int]SarumHymnal, error) {
	// TODO: Implement
	return map[int]SarumHymnal{}, nil
}

func checkRange(t *time.Time) []string {
	// Need to figure out when time is
	return []string{"Saturday, Advent to Lent", "Saturday Trinity to"}
}
