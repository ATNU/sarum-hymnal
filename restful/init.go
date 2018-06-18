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
	r.HandleFunc("/", handlePage).Methods("GET").Headers("query", "page")

	//TODO: Set MethodNotAllowedHandler and NoPathHandler

	log.Fatal(http.ListenAndServe(":8080", r))
}

//logRequest logs request data
func logRequest(r *http.Request) {
	log.Println(r.Header.Get("date") + "Request received")
}
