#!/bin/sh

usage() {
    echo "Usage: $0 <version>"
    exit 1
}

if [ "$#" -ne 1 ]; then
    usage
fi

version="$1"

host_root_src_dir="$(cd "$(dirname "$0")" && pwd)"

docker run -v "${host_root_src_dir}:/go/src/github.com/mcandre/go-ios7crypt" mcandre/docker-gox:musl sh -c "cd /go/src/github.com/mcandre/go-ios7crypt && gox -output=\"/go/src/github.com/mcandre/go-ios7crypt/bin/{{.Dir}}-${version}/{{.OS}}-musl/{{.Arch}}/{{.Dir}}\" -os=linux -arch=\"amd64 ppc64\" ./cmd/..."