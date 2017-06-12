// Package main provides an ios7crypt executable.
package main

import (
	"flag"
	"fmt"
	"log"
	"os"

	"github.com/mcandre/go-ios7crypt"
)

var flagPassword = flag.String("encrypt", "", "Encrypt a password")
var flagHash = flag.String("decrypt", "", "Decrypt a hash")
var flagHelp = flag.Bool("help", false, "Show usage information")
var flagVersion = flag.Bool("version", false, "Show version information")

// main is the entrypoint for this application.
func main() {
	flag.Parse()

	switch {
	case *flagPassword != "":
		fmt.Println(ios7crypt.Encrypt(*flagPassword))
	case *flagHash != "":
		p, err := ios7crypt.Decrypt(*flagHash)

		if err != nil {
			log.Panic(err)
		}

		fmt.Println(p)
	case *flagVersion:
		fmt.Println(ios7crypt.Version)
	default:
		flag.PrintDefaults()
		os.Exit(1)
	}
}
