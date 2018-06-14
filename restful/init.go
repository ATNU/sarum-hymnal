//Package restful provides a RESTful service for handling data requests
//This package makes use of Gorilla mux
package restful

import (
	"encoding/json"
	mux "github.com/gorilla/mux"
	"log"
	http "net/http"
	psql "webserver/psql"
)

//Init creates a new URL path and attaches required handlers
func Init() {
	r := mux.NewRouter()
	r.HandleFunc("/aa", handleRequest)
	log.Fatal(http.ListenAndServe(":8000", r))
}

//Shutdown gracefully closes web router
func Shutdown() {

}

//handleRequest handles page requests and returns json hymn data to client
//This function makes use of the psql package to receive query results
func handleRequest(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	//Get the data out

	//Pass it to psql

	rt := psql.Query("fff")

	j, err := json.Marshal(rt)
	if err != nil {
		log.Println("ERROR: Unable to return json data")
		log.Println(err)
	}

	w.Write(j)
}
