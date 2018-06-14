//Gets the ball rolling
package main

import (
	psql "webserver/psql"
	rfl "webserver/restful"
)

//Main begins the following activity
//-Call for config to read in values
//-Establish connection to database
//-Open RESTful API and begin receiving requests
func main() {
	CfgInit()
	psql.Init(CfgConnString())
	rfl.Init()
}
