package main

import (
	"encoding/json"
	"log"
	"net/http"
	"regexp"
	"time"

	"github.com/gorilla/mux"
)

// HandleDate handles a folio query and returns JSON data of each hymn described on folio
// Response served as application/JSON with format (eg):
// {
//    "[name]": {
//        "image": "[image]"
//        "folio": "[folio"
//        "staves": "[staves]"
//        "hymn": "[hymn]"
//        "clef": "[clef]"
//        "firstLine" "[firstline"
//        "melody": "[melody]"
//        "cycle": "[cycle]"
//    },
//    ...
// }
//
// Any errors generated will be returned to client
func HandleDate(w http.ResponseWriter, r *http.Request) {

	enableCors(&w)

	log.Println("Date request received with param:", mux.Vars(r)["date"])
	var err error
	if easter := r.URL.Query()["easter"]; len(easter) > 0 {
		log.Println("In")
		if e, err := time.Parse(time.RFC3339, easter[0]); err == nil {
			if t, err := time.Parse(time.RFC3339, mux.Vars(r)["date"]); err == nil {
				db, err := ConnDB(0)
				if err != nil {
					log.Println(err)
					w.WriteHeader(http.StatusInternalServerError)
					return
				}
				h, err := QueryDate(db, &t, &e)
				if err != nil {
					log.Println(err)
					w.WriteHeader(http.StatusInternalServerError)
					return
				}
				db.Close()
				w.Header().Set("Content-Type", "application/json")
				en := json.NewEncoder(w)
				en.Encode(h)
				return
			}
		}
		log.Println(err)
	}
	w.WriteHeader(http.StatusBadRequest)
	return
}

// HandleFolio handles a folio query and returns a JSON object containing sarum hymnal hymn metadata
// Response served as application/JSON with format (eg):
// {
//    "matins": {
//        "image": "[image]"
//        "folio": "[folio"
//        "staves": "[staves]"
//        "hymn": "[hymn]"
//        "clef": "[clef]"
//        "firstLine" "[firstline"
//        "melody": "[melody]"
//        "cycle": "[cycle]"
//    },
//    "lauds": {
//        "image": "[image]"
//        "folio": "[folio"
//        "staves": "[staves]"
//        "hymn": "[hymn]"
//        "clef": "[clef]"
//        "firstLine" "[firstline"
//        "melody": "[melody]"
//        "cycle": "[cycle]"
//    },
//    "prime": {
//        "image": "[image]"
//        "folio": "[folio"
//        "staves": "[staves]"
//        "hymn": "[hymn]"
//        "clef": "[clef]"
//        "firstLine" "[firstline"
//        "melody": "[melody]"
//        "cycle": "[cycle]"
//    },
//    "terce": {
//        "image": "[image]"
//        "folio": "[folio"
//        "staves": "[staves]"
//        "hymn": "[hymn]"
//        "clef": "[clef]"
//        "firstLine" "[firstline"
//        "melody": "[melody]"
//        "cycle": "[cycle]"
//    },
//    "sext": {
//        "image": "[image]"
//        "folio": "[folio"
//        "staves": "[staves]"
//        "hymn": "[hymn]"
//        "clef": "[clef]"
//        "firstLine" "[firstline"
//        "melody": "[melody]"
//        "cycle": "[cycle]"
//    },
//    "none": {
//        "image": "[image]"
//        "folio": "[folio"
//        "staves": "[staves]"
//        "hymn": "[hymn]"
//        "clef": "[clef]"
//        "firstLine" "[firstline"
//        "melody": "[melody]"
//        "cycle": "[cycle]"
//    },
//    "vespers1": {
//        "image": "[image]"
//        "folio": "[folio"
//        "staves": "[staves]"
//        "hymn": "[hymn]"
//        "clef": "[clef]"
//        "firstLine" "[firstline"
//        "melody": "[melody]"
//        "cycle": "[cycle]"
//    },
//    "vespers2": {
//        "image": "[image]"
//        "folio": "[folio"
//        "staves": "[staves]"
//        "hymn": "[hymn]"
//        "clef": "[clef]"
//        "firstLine" "[firstline"
//        "melody": "[melody]"
//        "cycle": "[cycle]"
//    }
//}
//
// Any errors generated will be returned to client
func HandleFolio(w http.ResponseWriter, r *http.Request) {
	log.Println("Page request received with param:", mux.Vars(r)["folio"])

	enableCors(&w)

	if m, _ := regexp.MatchString("[0-9]{3}[r|v]{1}", mux.Vars(r)["folio"]); m != true {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("400 - Invalid folio query!"))
		return
	}
	db, err := ConnDB(0)
	if err != nil {
		log.Println(err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
	h, err := QueryFolio(db, mux.Vars(r)["folio"])
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte("500 - Something bad happened!"))
		return
	}
	db.Close()
	w.Header().Set("Content-Type", "application/json")
	en := json.NewEncoder(w)
	en.Encode(h)
}

func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
}
