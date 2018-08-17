package main

import (
	"time"
)

// Inference contains
type Inference interface {
	Interpret()
	Store()
}

// Base captures the default precedence
// Ordered sequence of rules that define who the 'winner' is when selectinga
type Base struct {
	Precedence []string
}

// Rule captures modifying precedence behaviour
type Rule struct {
	ID        string
	Condition []string
	Action    []string
}

// RetreiveBase fetches our base precedence
func RetreiveBase() Base {
	return Base{}
}

// RetreiveRuleset fetches active precedence modifiers
func RetreiveRuleset() []Rule {
	return make([]Rule, 0)
}

// Interpret an inference struct
func (b *Base) Interpret() {

}

// Store stores an inference within our database
func (b *Base) Store() {

}

// Interpret an inference struct
func (r *Rule) Interpret() {

}

// Store stores an inference within our database
func (r *Rule) Store() {

}

// Interpret infers a final precedence to be used for hymn selection
// Parameters:
// - []Inference collection of base and rules to be interpreted
// - *time.Time a time to base decisions
//
// Returns a final Base precedence
func Interpret(i []Inference, t *time.Time) Base {
	return Base{}
}

func base() {
	b := Base{}
	b.Precedence = []string{
		"type=psalter && day=$1",
		"type=temporal && date=$2 && easter!=$3",
	}
}
