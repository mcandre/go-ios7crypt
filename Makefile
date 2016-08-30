# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/ios7crypt$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) -e monkey
	$(BIN) -d 07022e42450c00

$(BIN): cli.go
	go build -o $(BIN) cli.go

clean:
	-$(RM) bin
