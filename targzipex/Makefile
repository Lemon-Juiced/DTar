# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = targzipex.d

# Output binaries
BIN_WIN = targzipex.exe
BIN_LINUX = targzipex

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f targzipex.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f targzipex.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) targzipex.obj