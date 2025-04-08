module tarballex.tarballex;

import std.array;
import std.file;
import std.process;
import std.stdio;

/**
 * Extracts the contents of a .tar file using the `tar` utility.
 * 
 * Parameters:
 * - archive: The path to the archive file to be extracted.
 * - path (optional): Destination path for the extracted files. Defaults to the current working directory.
 * 
 * @param args Command-line arguments
 */
void main(string[] args) {
    // Check if the correct number of arguments is provided
    if (args.length < 2 || args.length > 3) {
        writeln("Usage: tarballex <archive> [path]");
        return;
    }

    // Extract the archive and path arguments
    string archive = args[1];
    archive = args[1].replace("\\", "/"); // Normalize to forward slashes
    string path;
    if (args.length == 3) path = args[2].replace("\\", "/"); // Normalize to forward slashes
    else path = "."; // If no path is provided, use the current working directory

    // Extract the contents of the tarball using the tar command
    string command = "tar -xvf " ~ archive ~ " -C " ~ path;
    try {
        auto result = executeShell(command);
        if (result.status != 0) {
            writeln("Error extracting tarball: ", result.status);
            writeln("Command output: ", result.output);
            return;
        } else {
            writeln("Contents extracted successfully to: ", path);
        }
    } catch (Exception e) {
        writeln("Failed to execute command: ", e.msg);
    }
}