package main

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"regexp"
	"time"
)

// HandleDate handles a folio query and returns a JSON object containing sarum hymnal hymn metadata
// Response served as application/JSON with format (eg):
//	{
//		"h1": {
//			"meta": "bla"
//		}
//	},
//
// Any errors generated will be returned to client
func HandleDate(w http.ResponseWriter, r *http.Request) {
	log.Println(r.Header.Get("date")+"Date request received with param:", mux.Vars(r)["date"])
	var err error
	if easter := r.URL.Query()["easter"]; len(easter) > 0 {
		if e, err := time.Parse(time.RFC3339, easter[0]); err == nil {
			if t, err := time.Parse(time.RFC3339, mux.Vars(r)["date"]); err == nil {
				h, err := QueryDatePsalter(&t)
				_ = e
				if err != nil {
					log.Println(err)
					w.WriteHeader(http.StatusInternalServerError)
					return
				}
				w.Header().Set("Content-Type", "application/json")
				en := json.NewEncoder(w)
				en.Encode(h)
				return
			}
		}
		w.WriteHeader(http.StatusInternalServerError)
		log.Println(err)
		return
	}
	log.Println("No Easter supplied")
	w.WriteHeader(http.StatusBadRequest)
	return
}

// HandleFolio handles a folio query and returns a JSON object containing sarum hymnal hymn metadata
// Response served as application/JSON with format (eg):
//	{
//		"h1": {
//			"meta": "bla"
//		}
//	},
//
// Any errors generated will be returned to client
func HandleFolio(w http.ResponseWriter, r *http.Request) {
	log.Println(r.Header.Get("date")+"Page request received with param:", mux.Vars(r)["folio"])

	if m, _ := regexp.MatchString("[0-9]{3}[r|v]{1}", mux.Vars(r)["folio"]); m != true {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("400 - Invalid folio query!"))
		return
	}
	h, err := QueryFolio(mux.Vars(r)["folio"])
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte("500 - Something bad happened!"))
		return
	}
	w.Header().Set("Content-Type", "application/json")
	en := json.NewEncoder(w)
	en.Encode(h)
}
