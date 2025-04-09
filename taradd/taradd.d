module taradd.taradd;

import std.array;
import std.file;
import std.process;
import std.stdio;

/**
 * Adds a file or directory to a tarball using the `tar` command-line utility.
 * 
 * Parameters:
 * - archive: The path to the archive file to be extracted.
 * - file: The file to be added to the archive.
 * 
 * @param args Command-line arguments
 */
void main(string[] args) {
    // Check if the correct number of arguments is provided
    if (args.length != 3) {
        writeln("Usage: taradd <archive> <file>");
        return;
    }

    // Extract the archive and file arguments
    string archive = args[1];
    archive = args[1].replace("\\", "/"); // Normalize to forward slashes
    string file = args[2];
    file = args[2].replace("\\", "/"); // Normalize to forward slashes

    // Check if the archive exists
    if (!exists(archive)) {
        writeln("Error: The specified archive does not exist: ", archive);
        return;
    }

    // Check if the file exists
    if (!exists(file)) {
        writeln("Error: The specified file does not exist: ", file);
        return;
    }

    // Add the file to the tarball using the tar command
    string command = "tar -rvf " ~ archive ~ " " ~ file;
    try {
        auto result = executeShell(command);
        if (result.status != 0) {
            writeln("Error adding file to tarball: ", result.status);
            writeln("Command output: ", result.output);
            return;
        } else {
            writeln("File added successfully to the tarball: ", archive);
        }
    } catch (Exception e) {
        writeln("Failed to execute command: ", e.msg);
    }
}