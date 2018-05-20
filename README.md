# go-ios7crypt - a Go port of IOS7Crypt

# EXAMPLE

```
$ ios7crypt -encrypt monkey
020b0b55000316

$ ios7crypt -decrypt 020b0b55000316
monkey

$ ios7crypt -help
  -decrypt string
        Decrypt a hash
  -encrypt string
        Encrypt a password
  -help
        Show usage information
  -version
        Show version information
```

# ABOUT

IOS7Crypt is an educational resource illustrating some fundamentals of introductory practical cryptography:

* An example of building a larger crypto algorithm out of XOR
* Constant vs Variable keys
* Instructions for compiling and running an example encryption program

# DOWNLOAD

https://github.com/mcandre/go-ios7crypt/releases

# DOCUMENTATION

https://godoc.org/github.com/mcandre/go-ios7crypt

# RUNTIME REQUIREMENTS

(None)

# BUILDTIME REQUIREMENTS

* [Go](https://golang.org/) 1.9+

## Recommended

* [Docker](https://www.docker.com/)
* [Mage](https://magefile.org/) (e.g., `go get github.com/magefile/mage`)
* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports) (e.g. `go get golang.org/x/tools/cmd/goimports`)
* [golint](https://github.com/golang/lint) (e.g. `go get github.com/golang/lint/golint`)
* [errcheck](https://github.com/kisielk/errcheck) (e.g. `go get github.com/kisielk/errcheck`)
* [nakedret](https://github.com/alexkohler/nakedret) (e.g. `go get github.com/alexkohler/nakedret`)
* [goxcart](https://github.com/mcandre/goxcart) (e.g., `github.com/mcandre/goxcart/...`)
* [zipc](https://github.com/mcandre/zipc) (e.g. `go get github.com/mcandre/zipc/...`)
* [karp](https://github.com/mcandre/karp) (e.g., `go get github.com/mcandre/karp/...`)

# INSTALL FROM REMOTE GIT REPOSITORY

```
$ go get github.com/mcandre/go-ios7crypt/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone https://github.com/mcandre/go-ios7crypt.git $GOPATH/src/github.com/mcandre/go-ios7crypt
$ cd $GOPATH/src/github.com/mcandre/go-ios7crypt
$ git submodule update --init --recursive
$ go install ./...
```

# TEST REMOTELY

```
$ go test github.com/mcandre/go-ios7crypt/...
```

# TEST LOCALLY

```
$ go test
```

# COVERAGE

```
$ mage coverageHTML
$ karp cover.html
```

# PORT

```
$ mage port
```

# LINT

Keep the code tidy:

```
$ mage lint
```
