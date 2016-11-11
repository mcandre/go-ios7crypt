package main

import (
	"fmt"

	"github.com/docopt/docopt-go"
	"github.com/mcandre/go-ios7crypt"
)

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

func main() {
	arguments, err := docopt.Parse(Usage, nil, true, ios7crypt.Version, false)

	if err != nil {
		fmt.Println(Usage)
	}

	password, passwordStatus := arguments["--encrypt"].(string)
	hash, hashStatus := arguments["--decrypt"].(string)
	version := arguments["--version"] != nil

	switch {
	case passwordStatus:
		hash, err := ios7crypt.Encrypt(password)

		if err != nil {
			panic(err)
		}

		fmt.Println(hash)
	case hashStatus:
		password, err := ios7crypt.Decrypt(hash)

		if err != nil {
			panic(err)
		}

		fmt.Println(password)
	case version:
		fmt.Println(ios7crypt.Version)
	default:
		fmt.Println(Usage)
	}
}
