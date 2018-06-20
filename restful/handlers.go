package restful

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"webserver/datatypes"
)

//handleSarumHymnalDate handles a page request
//example date string: '2018-06-20T11:04:06+00:00'
func handleSarumHymnalDate(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	log.Println(r.Header.Get("date")+"Date request received with param:", vars["date"])

	h := datatypes.SarumHymnal{}
	all, err := h.GetByDate(vars["date"])
	if err != nil {
		log.Println(err)
		w.Write([]byte("Invalid date"))
	}
	en := json.NewEncoder(w)
	for _, val := range all {
		en.Encode(val)
	}
}

//handleSarumHymnalPage handles a page request
func handleSarumHymnalPage(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	log.Println(r.Header.Get("date")+"Page request received with param:", vars["page"])

	h := datatypes.SarumHymnal{}
	all := h.GetByPage(vars["page"])

	en := json.NewEncoder(w)
	for _, val := range all {
		en.Encode(val)
	}
}

//handleUnfiltered handles unrouted request
func handleUnRouted(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusNotFound)
}

//methodNotAllowed handles any unaccepted http methods received
func methodNotAllowed(w http.ResponseWriter) {
	w.WriteHeader(http.StatusForbidden)
}
