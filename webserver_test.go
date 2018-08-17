package main_test

import (
	"fmt"
	"github.com/gorilla/mux"
	sarum "github.com/mattnolf/sarumhymnal"
	"log"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHandleFolio(t *testing.T) {
	sarum.SetupConfig()
	tt := []struct {
		routeVariable string
		shouldPass    bool
	}{
		{"001r", true},
		{"010v", true},
		{"990l", false},
	}

	for _, tc := range tt {
		t.Run(tc.routeVariable, func(t *testing.T) {
			path := fmt.Sprintf("/folio/%v", tc.routeVariable)
			req, err := http.NewRequest("GET", path, nil)
			if err != nil {
				t.Fatal(err)
			}

			w := httptest.NewRecorder()
			r := mux.NewRouter()
			r.HandleFunc("/folio/{folio}", sarum.HandleFolio)
			r.ServeHTTP(w, req)

			if w.Code != http.StatusOK && tc.shouldPass {
				t.Errorf("handler on routeVariable %s: got %v want %v",
					tc.routeVariable, w.Code, http.StatusOK)
			}

			if w.Code == http.StatusOK && !tc.shouldPass {
				t.Errorf("handler on routeVariable %s: got %v want %v",
					tc.routeVariable, w.Code, http.StatusInternalServerError)
			}
		})
	}
}

func TestHandleDate(t *testing.T) {
	sarum.SetupConfig()
	tt := []struct {
		routeVariable string
		easter        string
		shouldPass    bool
	}{
		{"2006-01-02T15:04:05Z", "2006-01-02T15:04:05Z", true},
		{"2006-01-02T15:04:05Z", "2006-01-02T15:04:05Zbla", false},
		{"bla", "2006-01-02T15:04:05Z", false},
	}

	for _, tc := range tt {
		t.Run(tc.routeVariable, func(t *testing.T) {
			path := fmt.Sprintf("/date/%v?easter=%v", tc.routeVariable, tc.easter)
			log.Println(path)
			req, err := http.NewRequest("GET", path, nil)
			if err != nil {
				t.Fatal(err)
			}

			w := httptest.NewRecorder()
			r := mux.NewRouter()
			r.HandleFunc("/date/{date}", sarum.HandleDate)
			r.ServeHTTP(w, req)

			if w.Code != http.StatusOK && tc.shouldPass {
				t.Errorf("handler on routeVariable %s: got %v want %v",
					tc.routeVariable, w.Code, http.StatusOK)
			}

			if w.Code == http.StatusOK && !tc.shouldPass {
				t.Errorf("handler on routeVariable %s: got %v want %v",
					tc.routeVariable, w.Code, http.StatusInternalServerError)
			}
		})
	}
}
