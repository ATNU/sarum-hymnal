package main

import (
	"fmt"
	fsnotify "github.com/fsnotify/fsnotify"
	vp "github.com/spf13/viper"
	"log"
	psql "webserver/psql"
)

const cfgName string = "cfg"

//CfgInit attempts to read in config file
//If no config found defaults will be used
func CfgInit() {
	vp.SetConfigName(cfgName)
	vp.AddConfigPath(".")
	err := vp.ReadInConfig()
	if err != nil {
		log.Fatal(err)
		log.Println("Attempting to use defaults")
	}

	vp.WatchConfig()
	vp.OnConfigChange(func(e fsnotify.Event) {
		log.Println("WARNING: Configuration file modified%nRestarting connection...")
		psql.Init(CfgConnString())
	})
}

//CfgConnString returns a string representation of connection key value pairs.
//Returned string should be used when creating new connection
func CfgConnString() string {
	return fmt.Sprintf("host=%s port=%s sslmode=%s user=%s password=%s dbname=%s",
		vp.GetString("postgres.conn.host"), vp.GetString("postgres.conn.port"), vp.GetString("postgres.conn.sslmode"),
		vp.GetString("postgres.account.user"), vp.GetString("postgres.account.password"),
		vp.GetString("postgres.account.dbname"))
}

//CfgValue retreives a single config value
func CfgValue(key string) string {
	return vp.GetString(key)
}

//CfgValues returns a slice of config values corresponding to the keys provided
func CfgValues(keys ...string) []string {
	s := make([]string, len(keys))
	for i, key := range keys {
		s[i] = vp.GetString(key)
	}
	return s
}
