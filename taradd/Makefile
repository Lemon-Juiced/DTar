# Compiler and flags
DC = dmd
DFLAGS = -O -release

# Source file
SRC = taradd.d

# Output binaries
BIN_WIN = taradd.exe
BIN_LINUX = taradd

# Default target
all: windows linux

# Build for Windows
windows: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_WIN) $(SRC)
	rm -f taradd.obj

# Build for Linux
linux: $(SRC)
	rm -f *.tar
	$(DC) $(DFLAGS) -of=$(BIN_LINUX) $(SRC)
	rm -f taradd.obj

# Clean up build artifacts
clean:
	rm -f $(BIN_WIN) $(BIN_LINUX) taradd.obj