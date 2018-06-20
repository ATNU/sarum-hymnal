//Package cfg provides utlities to manage and retrieve configuration values
package cfg

import (
	"fmt"
	fsnotify "github.com/fsnotify/fsnotify"
	vp "github.com/spf13/viper"
	"log"
)

const cfgName string = "cfg"

//Init attempts to read in config file
//If no config found defaults will be used
func Init() {
	vp.SetConfigName(cfgName)
	vp.AddConfigPath(".")
	err := vp.ReadInConfig()
	if err != nil {
		log.Println("Unable to find configuration file%nAttempting to use defaults")
		return
	}
	log.Println("Found config " + cfgName)

	vp.WatchConfig()
	vp.OnConfigChange(func(e fsnotify.Event) {
		log.Println("Configuration file modified%nRestarting connection...")
	})
}

//ConnString returns a string representation of connection key value pairs.
//Returned string should be used when creating new connection
func ConnString() string {
	return fmt.Sprintf("host=%s port=%s sslmode=%s user=%s password=%s dbname=%s",
		vp.GetString("postgres.conn.host"), vp.GetString("postgres.conn.port"), vp.GetString("postgres.conn.sslmode"),
		vp.GetString("postgres.account.user"), vp.GetString("postgres.account.password"),
		vp.GetString("postgres.account.dbname"))
}

//Value retreives a string single config value
func Value(key string) string {
	return vp.GetString(key)
}

//ValueInt retreives a int single config value
func ValueInt(key string) int {
	return vp.GetInt(key)
}

//Values returns a slice of config values corresponding to the keys provided
func Values(keys ...string) []string {
	s := make([]string, len(keys))
	for i, key := range keys {
		s[i] = vp.GetString(key)
	}
	return s
}
