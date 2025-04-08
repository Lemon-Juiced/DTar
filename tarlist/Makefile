# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = tarlist.d

# Output binaries
BIN_WIN = tarlist.exe
BIN_LINUX = tarlist

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f tarlist.obj

# Build for Linux
linux: $(SRC)
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f tarlist.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) tarlist.obj