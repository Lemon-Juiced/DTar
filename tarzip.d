module tarzip;

import std.array;
import std.file;
import std.process;
import std.stdio;
import std.string;

/**
 * Creates a tarball and compresses a given file or directory with a specified compression type using the `tar` command-line utility.
 * 
 * Parameters:
 * - path: Path to the directory or file to archive.
 * - compression: Compression type to use (gzip (or gz), bzip2 (or bz2), xz). Defaults to gzip.
 * - output (optional): Destination path for the tarball. Defaults to `<path>.tar.xz`.
 * 
 * @param args Command-line arguments
 */
void main(string[] args) {
    // Check if the correct number of arguments is provided
    if (args.length < 2 || args.length > 4) {
        writeln("Usage: tarzip <path> [compression] [output]");
        return;
    } 

    // Extract the path and compression arguments
    string path = args[1];
    path = args[1].replace("\\", "/"); // Normalize to forward slashes
    string compression = "gzip"; // Default compression type
    if (args.length >= 3) {
        compression = args[2].toLower();
        if (compression == "bz2") compression = "bzip2"; // Normalize bz2 to bzip2 (redundant)
    }
    string output;
    if (args.length == 4) output = args[3].replace("\\", "/"); // Normalize to forward slashes
    else {
        if (compression == "gzip") output = path ~ ".tar.gz";
        else if (compression == "bzip2") output = path ~ ".tar.bz2";
        else if (compression == "xz") output = path ~ ".tar.xz";
        else output = path ~ ".tar." ~ compression; // Fallback for other compression types
    }

    // Check if the path exists
    if (!exists(path)) {
        writeln("Error: The specified path does not exist: ", path);
        return;
    }

    // Create the tarball using the tar command with the specified compression type
    string command = "tar -cvf " ~ output ~ " --use-compress-program=" ~ compression ~ " " ~ path;
    try {
        auto result = executeShell(command);
        if (result.status != 0) {
            writeln("Error creating tarball: ", result.status);
            writeln("Command output: ", result.output);
            return;
        } else {
            writeln("Tarball created successfully at: ", output);
        }
    } catch (Exception e) {
        writeln("Failed to execute command: ", e.msg);
    }
}