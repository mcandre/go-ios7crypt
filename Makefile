all: test

test:
	ios7crypt -e monkey
	ios7crypt -d 07022e42450c00

govet:
	go vet -v

gofmt:
	gofmt -s -w .

lint: govet gofmt
