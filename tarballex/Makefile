# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = tarballex.d

# Output binaries
BIN_WIN = tarballex.exe
BIN_LINUX = tarballex

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f tarballex.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f tarballex.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) tarballex.obj