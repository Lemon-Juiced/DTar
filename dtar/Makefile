# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = dtar.d

# Output binaries
BIN_WIN = dtar.exe
BIN_LINUX = dtar

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f dtar.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f dtar.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) dtar.obj