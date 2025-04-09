# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = tarzip.d

# Output binaries
BIN_WIN = tarzip.exe
BIN_LINUX = tarzip

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f tarzip.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f tarzip.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) tarzip.obj