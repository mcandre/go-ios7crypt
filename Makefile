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

bashate:
	find . \( -wholename '*/.git/*' -o -wholename '*/node_modules*' -o -name '*.bat' \) -prune -o -type f \( -wholename '*/lib/*' -o -wholename '*/hooks/*' -o -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs bashate

shlint:
	find . \( -wholename '*/.git/*' -o -wholename '*/node_modules*' -o -name '*.bat' \) -prune -o -type f \( -wholename '*/lib/*' -o -wholename '*/hooks/*' -o -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs shlint

checkbashisms:
	find . \( -wholename '*/.git/*' -o -wholename '*/node_modules*' -o -name '*.bat' \) -prune -o -type f \( -wholename '*/lib/*' -o -wholename '*/hooks/*' -o -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs checkbashisms -n -p

shellcheck:
	find . \( -wholename '*/.git/*' -o -wholename '*/node_modules*' -o -name '*.bat' \) -prune -o -type f \( -wholename '*/lib/*' -o -wholename '*/hooks/*' -o -name '*.sh' -o -name '*.bashrc*' -o -name '.*profile*' -o -name '*.envrc*' \) -print | xargs shellcheck

editorconfig:
	find . \( -wholename '*/bin/*' -o -name '*.clj' -o -wholename '*/vendor/*' -o -wholename '*/perl/Makefile' -o -wholename '*/CMakeFiles/*' -o -name '*.cmake' -o -name '*.lock' -o -name '*.cm[io]' -o -name '*.hi' -o -name '*.o' -o -name '*.beam' -o -name '*.dump' -o -name '*.pyc' -o -name '*.jar' -o -name '*.class' -o -name '*.bin' -o -wholename '*/tmp/*' -o -name .gitmodules -o -wholename '*/.git/*' -o -wholename '*/node_modules/*' -o -wholename '*/.cabal/*' -o -name '*.ttf' -o -name '*.plist' -o -name .DS_Store -o -name Thumbs.db \) -prune -o -type f -print | xargs node_modules/.bin/editorconfig-tools check

lint: govet gofmt goimport bashate shlint checkbashisms shellcheck editorconfig

port: archive-ports

archive-ports: bin
	zipc -C bin "ios7crypt-$(VERSION).zip" "ios7crypt-$(VERSION)"

bin:
	gox -output="bin/{{.Dir}}-$(VERSION)/{{.OS}}/{{.Arch}}/{{.Dir}}" ./cmd/...

clean: clean-ports

clean-ports:
	rm -rf bin
