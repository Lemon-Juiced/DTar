# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = tarxzip.d

# Output binaries
BIN_WIN = tarxzip.exe
BIN_LINUX = tarxzip

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f tarxzip.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f tarxzip.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) tarxzip.obj