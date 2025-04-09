# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = tarbzip.d

# Output binaries
BIN_WIN = tarbzip.exe
BIN_LINUX = tarbzip

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f tarbzip.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f tarbzip.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) tarbzip.obj