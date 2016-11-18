VERSION=0.0.1
COVER_PROFILE=cover.out
COVER_HTML=cover.html

.PHONY: $(COVER_PROFILE) $(COVER_HTML) build-ports clean clean-ports

all: coverage

coverage: $(COVER_HTML)

$(COVER_HTML): $(COVER_PROFILE)
	go tool cover -html=$(COVER_PROFILE) -o $(COVER_HTML)

$(COVER_PROFILE):
	go test -coverprofile=$(COVER_PROFILE)

integration-test:
	ios7crypt -e monkey
	ios7crypt -d 07022e42450c00

govet:
	go list ./... | grep -v vendor | xargs go vet -v

gofmt:
	find . -path '*/vendor/*' -prune -o -name '*.go' -type f -exec gofmt -s -w {} \;

goimport:
	find . -path '*/vendor/*' -prune -o -name '*.go' -type f -exec goimports -w {} \;

lint: govet gofmt goimport

build-ports:
	sh -c "cd cmd/ios7crypt && mkdir -p bin/ios7crypt-$(VERSION)/linux/amd64 && env GOOS=linux GOARCH=amd64 go build -o bin/ios7crypt-$(VERSION)/linux/amd64/ios7crypt"
	sh -c "cd cmd/ios7crypt && mkdir -p bin/ios7crypt-$(VERSION)/linux/386 && env GOOS=linux GOARCH=386 go build -o bin/ios7crypt-$(VERSION)/linux/386/ios7crypt"
	sh -c "cd cmd/ios7crypt && mkdir -p bin/ios7crypt-$(VERSION)/darwin/amd64 && env GOOS=darwin GOARCH=amd64 go build -o bin/ios7crypt-$(VERSION)/darwin/amd64/ios7crypt"
	sh -c "cd cmd/ios7crypt && mkdir -p bin/ios7crypt-$(VERSION)/darwin/386 && env GOOS=darwin GOARCH=386 go build -o bin/ios7crypt-$(VERSION)/darwin/386/ios7crypt"
	sh -c "cd cmd/ios7crypt && mkdir -p bin/ios7crypt-$(VERSION)/windows/amd64 && env GOOS=windows GOARCH=amd64 go build -o bin/ios7crypt-$(VERSION)/windows/amd64/ios7crypt.exe"
	sh -c "cd cmd/ios7crypt && mkdir -p bin/ios7crypt-$(VERSION)/windows/386 && env GOOS=windows GOARCH=386 go build -o bin/ios7crypt-$(VERSION)/windows/386/ios7crypt.exe"
	sh -c "cd cmd/ios7crypt/bin && zip -r ios7crypt-$(VERSION).zip ios7crypt-$(VERSION)/"

clean: clean-ports

clean-ports:
	rm -rf cmd/ios7crypt/bin
