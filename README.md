# go-ios7crypt - a Go port of IOS7Crypt

# EXAMPLE

```
$ ios7crypt -e monkey
12140a19190e15

$ ios7crypt -d 07022e42450c00
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
$ git submodule init
$ git submodule update
```

# INSTALL

```
$ go get github.com/mcandre/go-ios7crypt/...
```

(Yes, include the ellipsis as well, it's the magic Go syntax for downloading, building, and installing all components of a package, including any libraries and command line tools.)
