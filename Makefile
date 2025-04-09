# Compiler and flags
DC = dmd
DFLAGS = -O -release

# List of utilities
UTILS = dtar taradd tarball tarballex tarbzip tarbzipex targzip targzipex tarlist tarxzip tarxzipex tarzip

# Default target: Build all utilities for both platforms
all: windows linux

# Build all utilities for Windows
windows: $(UTILS:%=%.exe)

# Build all utilities for Linux
linux: $(UTILS)

# Rule to build a utility for Windows
%.exe: %.d
	$(DC) $(DFLAGS) -of=$@ $<
	rm -f $*.obj

# Rule to build a utility for Linux
%: %.d
	$(DC) $(DFLAGS) -of=$@ $<
	rm -f $*.obj

# Clean up build artifacts
clean:
	rm -f $(UTILS:%=%.exe) $(UTILS) *.obj