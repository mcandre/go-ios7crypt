VERSION=0.0.1
COVER_PROFILE=cover.out
COVER_HTML=cover.html
ZIP_EXCLUDES=-x '*.DS_Store' -x '*Thumbs.db'

.PHONY: $(COVER_PROFILE) $(COVER_HTML) port clean clean-ports

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

port: archive-ports

archive-ports: bin
	sh -c "cd bin && zip -r ios7crypt-$(VERSION).zip ios7crypt-$(VERSION) $(ZIP_EXCLUDES)"

bin:
	gox -output="bin/ios7crypt-$(VERSION)/{{.OS}}/{{.Arch}}/{{.Dir}}" ./cmd/...

clean: clean-ports

clean-ports:
	rm -rf bin
