# DTar
DTar, or "tar for dummies" written in D, is a suite of free and open-source command-line tools for working with tar archives. It simplifies common tasks like creating, extracting, and listing tarballs, while supporting multiple compression formats (gzip, bzip2, xz).

Whether you're a developer, system administrator, or just someone who frequently works with tar archives, DTar provides an easy-to-use and consistent interface for managing your files.

## Tools
1. **dtar**: The non-tar based housekeeping commands for the suite.
2. **taradd**: Adds a file or directory to a tarball.
3. **tarball**: Creates a tarball from a given file or directory.
4. **tarballex**: Extracts the contents of a given tarball.
5. **tarbzip**: Creates a tarball from a given file or directory with bzip2 compression.
6. **tarbzipex**: Extracts the contents of a given tarball with bzip2 compression.
7. **targzip**: Creates a tarball from a given file or directory with gzip compression.
8. **targzipex**: Extracts the contents of a given tarball with gzip compression.
9. **tarlist**: Lists the contents of a given tar archive to the console.
10. **tarxzip**: Creates a tarball from a given file or directory with xz compression.
11. **tarxzipex**: Extracts the contents of a given tarball with xz compression.
12. **tarzip**: Creates a tarball from a given file or directory with a user specified compression.

## Usage
### dtar
```bash
dtar -help
dtar -version
```

### taradd
```bash
taradd <archive> <file>
```

### tarball
```bash
tarball <path> [output]
```

### tarballex
```bash
tarballex <archive> [path]
```

### tarbzip
```bash
tarbzip <path> [output]
```

### tarbzipex
```bash
tarbzipex <archive> [path]
```

### targzip
```bash
targzip <path> [output]
```

### targzipex
```bash
targzipex <archive> [path]
```

### tarlist
```bash
tarlist <archive> 
```

### tarxzip
```bash
tarxzip <path> [output]
```

### tarxzipex
```bash
tarxzipex <archive> [path]
```

### tarzip
```bash
tarzip <path> [compression] [output]
```

## System Requirements
- `tar` must be installed and accessible in your system's `PATH`.
- Compatible with:
  - Windows (requires PowerShell for `.zip` creation).
  - Linux.
  - macOS.
- The DMD compiler is required to build the tools from source.

## Prebuilt Binaries
Prebuilt binaries are available for download:  
- [Releases](https://github.com/Lemon-Juiced/DTar/releases/)

These archives contain:
- Windows binaries in `bin/windows/`
- Linux binaries in `bin/linux/`
  
You can download and extract the appropriate archive for your platform.

## Building the Tools
To build all utilities and create archives, ensure you have the DMD compiler, Make, and zip installed and run:
```bash
make
```

This will generate:
- Windows binaries in bin/windows/
- Linux binaries in bin/linux/
- Archives: bin/DTar.zip and bin/DTar.tar.gz

To clean up all build artifacts and archives, run:
```bash
make clean
```