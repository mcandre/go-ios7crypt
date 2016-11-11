all: test

test:
	ios7crypt -e monkey
	ios7crypt -d 07022e42450c00

govet:
	go list ./... | grep -v vendor | xargs go vet -v

gofmt:
	find . -name vendor -prune -o -name '*.go' -exec gofmt -s -w {} \;

lint: govet gofmt
