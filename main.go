package main

import (
	"github.com/fsnotify/fsnotify"
	"github.com/spf13/viper"
	"log"
)

const cfgName string = ".cfg"

func main() {
	SetupConfig()
	ConnDB(0)
	WebServer()
}

// SetupConfig handles finding and loading config values
// Any
func SetupConfig() {
	viper.SetConfigName(cfgName)
	viper.AddConfigPath(".")
	err := viper.ReadInConfig()
	if err != nil {
		log.Println("Unable to find configuration file")
		return
	}
	log.Println("Found config " + cfgName)

	viper.WatchConfig()
	viper.OnConfigChange(func(e fsnotify.Event) {
		log.Println("Configuration file modified - Restarting connection...")
		ConnDB(0)
	})
}
