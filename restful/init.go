//Package restful provides a RESTful service for handling data requests
//This package makes use of Gorilla mux
package restful

import (
	"github.com/gorilla/mux"
	"log"
	"net/http"
	//"webserver/psql"
)

//Init creates a new URL path and attaches required handlers
func Init() {
	r := mux.NewRouter()
	r.HandleFunc("/aa", handleRequest)
	log.Fatal(http.ListenAndServe(":8080", r))
}

//Shutdown gracefully closes web router
func Shutdown() {

}

//handleRequest handles page requests and returns json hymn data to client
//This function makes use of the psql package to receive query results
func handleRequest(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("😱"))
	log.Println(r.Header.Get("date") + "Request received")

	//psql.Query("blabla")

	/*
		w.Header().Set("Content-Type", "application/json")
		r, err := json.Marshal(j)
		if err != nil {
			log.Println(j)
			log.Println("ERROR: Unable to return json data")
			log.Println(err)
		}
		w.Write(j)
	*/
}
