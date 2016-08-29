# go-ios7crypt - a Go port of IOS7Crypt

# EXAMPLE

```
$ make
go build -o bin/ios7crypt cli.go

$ bin/ios7crypt -e monkey
12140a19190e15

$ bin/ios7crypt -d 07022e42450c00
monkey
```

# ABOUT

IOS7Crypt is an educational resource illustrating some fundamentals of introductory practical cryptography:

* An example of building a larger crypto algorithm out of XOR
* Constant vs Variable keys
* Instructions for compiling and running an example encryption program

# REQUIREMENTS

* [Go](https://golang.org/) 1.7+

## Optional

* [make](https://www.gnu.org/software/make/)


# DEPENDENCIES

Set the environment variable `GOPATH` to some directory like `$HOME/go`, then:

```
$ go get github.com/docopt/docopt-go
```
