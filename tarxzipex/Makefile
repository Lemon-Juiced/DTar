# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = tarxzipex.d

# Output binaries
BIN_WIN = tarxzipex.exe
BIN_LINUX = tarxzipex

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f tarxzipex.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f tarxzipex.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) tarxzipex.obj