package restful

import (
	"log"
	"net/http"
)

//handlePage handles a page request
func handlePage(w http.ResponseWriter, r *http.Request) {
	logRequest(r)
	log.Println("Queryvalue")

}

//handleUnfiltered handles unrouted request
func handleUnRouted(w http.ResponseWriter, r *http.Request) {
	log.Println("Unrouted request received")
	logRequest(r)
}

func methodNotAllowedHandler(w http.ResponseWriter) {

}
