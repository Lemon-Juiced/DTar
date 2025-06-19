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

# Man page files
MANPAGES = dtar.1 taradd.1 tarball.1 tarballex.1 tarbzip.1 tarbzipex.1 targzip.1 targzipex.1 tarlist.1 tarxzip.1 tarxzipex.1 tarzip.1

# Default target: Build all utilities for both platforms and create archives
all: $(WIN_DIR) $(LINUX_DIR) windows linux manpages_linux archive

# Create the bin directories if they don't exist
$(WIN_DIR) $(LINUX_DIR):
	mkdir -p $@

# Build all utilities for Windows
windows: $(UTILS:%=$(WIN_DIR)/%.exe)

# Build all utilities for Linux and copy man pages
linux: $(UTILS:%=$(LINUX_DIR)/%) manpages_linux

# Rule to build a utility for Windows
$(WIN_DIR)/%.exe: %.d | $(WIN_DIR)
	$(DC) $(DFLAGS) -of=$@ $<
	rm -f $(WIN_DIR)/$*.obj

# Rule to build a utility for Linux
$(LINUX_DIR)/%: %.d | $(LINUX_DIR)
	$(DC) $(DFLAGS) -of=$@ $<
	rm -f $(LINUX_DIR)/$*.obj

# Copy man pages to Linux bin directory
manpages_linux: $(LINUX_DIR)
	mkdir -p $(LINUX_DIR)/man
	cp $(MANPAGES) $(LINUX_DIR)/man/

# Create archives (zip and tar.gz)
archive: $(ZIP_ARCHIVE) $(TAR_ARCHIVE)

$(ZIP_ARCHIVE): $(WIN_DIR)
	powershell -Command "Compress-Archive -Path $(WIN_DIR)\* -DestinationPath $@"

$(TAR_ARCHIVE): $(LINUX_DIR) manpages_linux
	tar -cvzf $@ -C $(LINUX_DIR) .

# Create Linux tar.gz archive (binaries + man pages)
tarball: linux $(TAR_ARCHIVE)

# Clean up build artifacts and archives
clean:
	rm -rf $(BIN_DIR)