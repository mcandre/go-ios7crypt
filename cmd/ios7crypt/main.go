// Package main provides an ios7crypt executable.
package main

import (
	"fmt"
	"log"

	"github.com/docopt/docopt-go"
	"github.com/mcandre/go-ios7crypt"
)

// Usage is a docopt-formatted specification for this application's command line interface.
const Usage = `Usage:
  ios7crypt -e <password>
  ios7crypt -d <hash>
  ios7crypt -h
  ios7crypt -v

Options:
  -e --encrypt <password>  Encrypt a password
  -d --decrypt <hash>      Decrypt a hash
  -h --help                Show usage information
  -v --version             Show version information`

// main is the entrypoint for this application.
func main() {
	arguments, _ := docopt.Parse(Usage, nil, true, ios7crypt.Version, false)

	password, passwordStatus := arguments["--encrypt"].(string)
	hash, hashStatus := arguments["--decrypt"].(string)
	version := arguments["--version"] != nil

	switch {
	case passwordStatus:
		fmt.Println(ios7crypt.Encrypt(password))
	case hashStatus:
		p, err := ios7crypt.Decrypt(hash)

		if err != nil {
			log.Panic(err)
		}

		fmt.Println(p)
	case version:
		fmt.Println(ios7crypt.Version)
	default:
		fmt.Println(Usage)
	}
}
