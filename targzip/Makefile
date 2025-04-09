# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = targzip.d

# Output binaries
BIN_WIN = targzip.exe
BIN_LINUX = targzip

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f targzip.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f targzip.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) targzip.obj