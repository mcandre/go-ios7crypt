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
$ docker pull mcandre/docker-gox:glibc
$ docker pull mcandre/docker-gox:musl

$ make port

$ unzip -t bin/ios7crypt-*.zip
Archive:  bin/ios7crypt-0.0.3.zip
    testing: ios7crypt-0.0.3/darwin/   OK
    testing: ios7crypt-0.0.3/darwin/386/   OK
    testing: ios7crypt-0.0.3/darwin/386/ios7crypt   OK
    testing: ios7crypt-0.0.3/darwin/amd64/   OK
    testing: ios7crypt-0.0.3/darwin/amd64/ios7crypt   OK
    testing: ios7crypt-0.0.3/dragonfly/   OK
    testing: ios7crypt-0.0.3/dragonfly/amd64/   OK
    testing: ios7crypt-0.0.3/dragonfly/amd64/ios7crypt   OK
    testing: ios7crypt-0.0.3/freebsd/   OK
    testing: ios7crypt-0.0.3/freebsd/386/   OK
    testing: ios7crypt-0.0.3/freebsd/386/ios7crypt   OK
    testing: ios7crypt-0.0.3/freebsd/amd64/   OK
    testing: ios7crypt-0.0.3/freebsd/amd64/ios7crypt   OK
    testing: ios7crypt-0.0.3/linux-glibc/   OK
    testing: ios7crypt-0.0.3/linux-glibc/386/   OK
    testing: ios7crypt-0.0.3/linux-glibc/386/ios7crypt   OK
    testing: ios7crypt-0.0.3/linux-glibc/amd64/   OK
    testing: ios7crypt-0.0.3/linux-glibc/amd64/ios7crypt   OK
    testing: ios7crypt-0.0.3/linux-musl/   OK
    testing: ios7crypt-0.0.3/linux-musl/amd64/   OK
    testing: ios7crypt-0.0.3/linux-musl/amd64/ios7crypt   OK
    testing: ios7crypt-0.0.3/nacl/    OK
    testing: ios7crypt-0.0.3/nacl/amd64p32/   OK
    testing: ios7crypt-0.0.3/nacl/amd64p32/ios7crypt   OK
    testing: ios7crypt-0.0.3/nacl/arm/   OK
    testing: ios7crypt-0.0.3/nacl/arm/ios7crypt   OK
    testing: ios7crypt-0.0.3/netbsd/   OK
    testing: ios7crypt-0.0.3/netbsd/386/   OK
    testing: ios7crypt-0.0.3/netbsd/386/ios7crypt   OK
    testing: ios7crypt-0.0.3/netbsd/amd64/   OK
    testing: ios7crypt-0.0.3/netbsd/amd64/ios7crypt   OK
    testing: ios7crypt-0.0.3/openbsd/   OK
    testing: ios7crypt-0.0.3/openbsd/386/   OK
    testing: ios7crypt-0.0.3/openbsd/386/ios7crypt   OK
    testing: ios7crypt-0.0.3/openbsd/amd64/   OK
    testing: ios7crypt-0.0.3/openbsd/amd64/ios7crypt   OK
    testing: ios7crypt-0.0.3/plan9/   OK
    testing: ios7crypt-0.0.3/plan9/386/   OK
    testing: ios7crypt-0.0.3/plan9/386/ios7crypt   OK
    testing: ios7crypt-0.0.3/plan9/amd64/   OK
    testing: ios7crypt-0.0.3/plan9/amd64/ios7crypt   OK
    testing: ios7crypt-0.0.3/solaris/   OK
    testing: ios7crypt-0.0.3/solaris/amd64/   OK
    testing: ios7crypt-0.0.3/solaris/amd64/ios7crypt   OK
    testing: ios7crypt-0.0.3/windows/   OK
    testing: ios7crypt-0.0.3/windows/386/   OK
    testing: ios7crypt-0.0.3/windows/386/ios7crypt.exe   OK
    testing: ios7crypt-0.0.3/windows/amd64/   OK
    testing: ios7crypt-0.0.3/windows/amd64/ios7crypt.exe   OK
No errors detected in compressed data of bin/ios7crypt-0.0.3.zip.
```

# LINT

Keep the code tidy:

```
$ make lint
```

# GIT HOOKS

See `hooks/`.
