BIN=bin/ios7crypt

all: test

test: $(BIN)
	$(BIN) -e monkey
	$(BIN) -d 07022e42450c00

$(BIN): cli.go
	go build -o $(BIN) cli.go

clean:
	-rm -rf bin
