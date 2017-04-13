# go-ios7crypt - a Go port of IOS7Crypt

# EXAMPLE

```
$ ios7crypt -e monkey
12140a19190e15

$ ios7crypt -d 07022e42450c00
monkey

$ ios7crypt
Usage:
  ios7crypt -e <password>
  ios7crypt -d <hash>
  ios7crypt -h
  ios7crypt -v
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

# DEVELOPMENT REQUIREMENTS

* [Go](https://golang.org) 1.7+ with [$GOPATH configured](https://gist.github.com/mcandre/ef73fb77a825bd153b7836ddbd9a6ddc)

## Optional

* [Docker](https://www.docker.com)
* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)
* [make](https://www.gnu.org/software/make/)
* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports) (e.g. `go get golang.org/x/tools/cmd/goimports`)
* [golint](https://github.com/golang/lint) (e.g. `go get github.com/golang/lint/golint`)
* [errcheck](https://github.com/kisielk/errcheck) (e.g. `go get github.com/kisielk/errcheck`)
* [gox](https://github.com/mitchellh/gox) (e.g. `go get github.com/mitchellh/gox`)
* [zipc](https://github.com/mcandre/zipc) (e.g. `go get github.com/mcandre/zipc/...`)
* [editorconfig-tools](https://www.npmjs.com/package/editorconfig-tools)
* [bashate](https://github.com/openstack-dev/bashate)
* [shlint](https://rubygems.org/gems/shlint)
* [shellcheck](http://hackage.haskell.org/package/ShellCheck)

# INSTALL FROM REMOTE GIT REPOSITORY

```
$ go get github.com/mcandre/go-ios7crypt/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)

# INSTALL FROM LOCAL GIT REPOSITORY

```
$ mkdir -p $GOPATH/src/github.com/mcandre
$ git clone git@github.com:mcandre/go-ios7crypt.git $GOPATH/src/github.com/mcandre/go-ios7crypt
$ cd $GOPATH/src/github.com/mcandre/go-ios7crypt
$ git submodule update --init --recursive
$ sh -c 'cd cmd/ios7crypt && go install'
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
$ make coverage
go test -coverprofile=cover.out
go tool cover -html=cover.out -o cover.html
$ open cover.html
```

# PORT

```
$ docker pull mcandre/docker-gox:musl
$ docker pull mcandre/docker-gox:gnu

$ make port
```

# LINT

Keep the code tidy:

```
$ make lint
```

# GIT HOOKS

See `hooks/`.
