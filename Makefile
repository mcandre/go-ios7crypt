VERSION=0.0.1
COVER_PROFILE=cover.out
COVER_HTML=cover.html

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

shlint:
	find . \( -wholename '*/node_modules*' \) -prune -o -type f \( -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs shlint

checkbashisms:
	find . \( -wholename '*/node_modules*' \) -prune -o -type f \( -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs checkbashisms -n -p

shellcheck:
	find . \( -wholename '*/node_modules*' \) -prune -o -type f \( -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs shellcheck

lint: govet gofmt goimport shlint checkbashisms shellcheck

port: archive-ports

archive-ports: bin
	zipc -C bin "ios7crypt-$(VERSION).zip" "ios7crypt-$(VERSION)"

bin:
	gox -output="bin/{{.Dir}}-$(VERSION)/{{.OS}}/{{.Arch}}/{{.Dir}}" ./cmd/...

clean: clean-ports

clean-ports:
	rm -rf bin
