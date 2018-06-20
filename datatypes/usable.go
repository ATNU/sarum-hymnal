package datatypes

//Usable constrains data types to be retrieved from postgres
//and returnes as JSON to client
type Usable interface {
	//QueryNew enables a usable object to be retreived from postgres
	QueryNew()

	//GetAll enables a reference struct to return all struct values specified by a parameter
	GetAll()

	//MarshalJSON enables JSON encoder to convert struct to JSON format
	MarshalJSON() ([]byte, error)
}
