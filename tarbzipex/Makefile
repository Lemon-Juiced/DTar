# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = tarbzipex.d

# Output binaries
BIN_WIN = tarbzipex.exe
BIN_LINUX = tarbzipex

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f tarbzipex.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f tarbzipex.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) tarbzipex.obj