//Package restful provides a RESTful service for handling data requests
//This package makes use of Gorilla mux
package restful

import (
	"github.com/gorilla/mux"
	"log"
	"net/http"
)

//Init creates a new URL path and attaches required handlers
func Init() {
	r := mux.NewRouter()
	r.HandleFunc("/page/{page}", handleSarumHymnalPage).Methods("GET")
	r.HandleFunc("/date/{date}", handleSarumHymnalDate).Methods("GET")
	log.Fatal(http.ListenAndServe(":8080", r))
}
