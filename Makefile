VERSION=0.0.4
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
	find . -path "*/vendor*" -prune -o -name "*.go" -type f -exec go tool vet -shadow {} \;

golint:
	find . -path '*/vendor/*' -prune -o -name '*.go' -type f -exec golint {} \;

gofmt:
	find . -path '*/vendor/*' -prune -o -name '*.go' -type f -exec gofmt -s -w {} \;

goimport:
	find . -path '*/vendor/*' -prune -o -name '*.go' -type f -exec goimports -w {} \;

errcheck:
	errcheck -blank

bashate:
	find . \( -wholename '*/.git/*' -o -wholename '*/node_modules*' -o -name '*.bat' \) -prune -o -type f \( -wholename '*/lib/*' -o -wholename '*/hooks/*' -o -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs bashate

shlint:
	find . \( -wholename '*/.git/*' -o -wholename '*/node_modules*' -o -name '*.bat' \) -prune -o -type f \( -wholename '*/lib/*' -o -wholename '*/hooks/*' -o -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs shlint

checkbashisms:
	find . \( -wholename '*/.git/*' -o -wholename '*/node_modules*' -o -name '*.bat' \) -prune -o -type f \( -wholename '*/lib/*' -o -wholename '*/hooks/*' -o -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs checkbashisms -n -p

shellcheck:
	find . \( -wholename '*/.git/*' -o -wholename '*/node_modules*' -o -name '*.bat' \) -prune -o -type f \( -wholename '*/lib/*' -o -wholename '*/hooks/*' -o -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs shellcheck

editorconfig:
	flcl . | xargs -n 100 editorconfig-cli check

lint: govet golint gofmt goimport errcheck bashate shlint checkbashisms shellcheck editorconfig

port: archive-ports

archive-ports: bin
	zipc -chdir bin "ios7crypt-$(VERSION).zip" "ios7crypt-$(VERSION)"

bin-glibc:
	sh crosscompile-glibc.sh $(VERSION)

bin-musl:
	sh crosscompile-musl.sh $(VERSION)

bin-dragonfly:
	sh crosscompile-dragonfly.sh $(VERSION)

bin-nacl:
	sh crosscompile-nacl.sh $(VERSION)

bin-most:
	sh crosscompile-most.sh $(VERSION)

bin: bin-glibc bin-musl bin-dragonfly bin-nacl bin-most

clean: clean-ports

clean-ports:
	rm -rf bin
