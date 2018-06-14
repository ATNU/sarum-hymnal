//Gets the ball rolling
package main

import (
	cfg "webserver/cfg"
	psql "webserver/psql"
	//srfl "webserver/restful"
)

//Main begins the following activity
//-Call for config to read in values
//-Establish connection to database
//-Open RESTful API and begin receiving requests
func main() {
	cfg.Init()
	psql.Init(0)
	psql.Query()
}
