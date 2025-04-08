module tarball.tarball;

import std.array;
import std.file;
import std.process;
import std.stdio;

/**
 * Creates a tarball from the specified directory or file using the `tar` utility.
 * 
 * Parameters:
 * - path: Path to the directory or file to archive.
 * - output (optional): Destination path for the tarball. Defaults to `<path>.tar`.
 * 
 * @param args Command-line arguments
 */
void main(string[] args) {
    // Check if the correct number of arguments is provided
    if (args.length < 2 || args.length > 3) {
        writeln("Usage: tarball <path> [output]");
        return;
    }

    // Extract the path and output arguments
    string path = args[1];
    path = args[1].replace("\\", "/"); // Normalize to forward slashes
    string output;
    if (args.length == 3) output = args[2].replace("\\", "/"); // Normalize to forward slashes
    else output = path ~ ".tar"; // If no output is provided, use the current working directory and the name of the input path

    // Check if the path exists
    if (!exists(path)) {
        writeln("Error: The specified path does not exist: ", path);
        return;
    }

    // Create the tarball using the tar command
    string command = "tar -cvf " ~ output ~ " " ~ path;
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