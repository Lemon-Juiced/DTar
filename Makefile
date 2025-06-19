# Compiler and flags
DC = dmd
DFLAGS = -O -release

# List of utilities
UTILS = dtar taradd tarball tarballex tarbzip tarbzipex targzip targzipex tarlist tarxzip tarxzipex tarzip

# Output directories for binaries
BIN_DIR = bin
WIN_DIR = $(BIN_DIR)/windows
LINUX_DIR = $(BIN_DIR)/linux

# Archive names
ZIP_ARCHIVE = $(BIN_DIR)/DTar.zip
TAR_ARCHIVE = $(BIN_DIR)/DTar.tar.gz

# Default target: Build all utilities for both platforms and create archives
all: $(WIN_DIR) $(LINUX_DIR) windows linux archive

# Create the bin directories if they don't exist
$(WIN_DIR) $(LINUX_DIR):
	mkdir -p $@

# Build all utilities for Windows
windows: $(UTILS:%=$(WIN_DIR)/%.exe)

# Build all utilities for Linux
linux: $(UTILS:%=$(LINUX_DIR)/%)

# Rule to build a utility for Windows
$(WIN_DIR)/%.exe: %.d | $(WIN_DIR)
	$(DC) $(DFLAGS) -of=$@ $<
	rm -f $(WIN_DIR)/$*.obj

# Rule to build a utility for Linux
$(LINUX_DIR)/%: %.d | $(LINUX_DIR)
	$(DC) $(DFLAGS) -of=$@ $<
	rm -f $(LINUX_DIR)/$*.obj

# Create archives (zip and tar.gz)
archive: $(ZIP_ARCHIVE) $(TAR_ARCHIVE)

$(ZIP_ARCHIVE): $(WIN_DIR)
	powershell -Command "Compress-Archive -Path $(WIN_DIR)\* -DestinationPath $@"

$(TAR_ARCHIVE): $(LINUX_DIR)
	tar -cvzf $@ -C $(LINUX_DIR) .

# Clean up build artifacts and archives
clean:
	rm -rf $(BIN_DIR)