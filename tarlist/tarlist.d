module tarlist.tarlist;

import std.array;
import std.process;
import std.stdio;

/**
 * Lists the contents of a tarball (tar archive) using the `tar` command-line utility.
 *
 * Parameters:
 * - archive: The path to the archive file to be listed.
 * 
 * @param args Command-line arguments
 */
void main(string[] args) {
    // Check if the correct number of arguments is provided
    if (args.length != 2) {
        writeln("Usage: tarlist <archive>");
        return;
    }

    // Extract the archive argument
    string archive = args[1];
    archive = args[1].replace("\\", "/"); // Normalize to forward slashes

    // List the contents of the tarball using the tar command
    string command = "tar -tvf " ~ archive;
    try {
        auto result = executeShell(command);
        if (result.status != 0) {
            writeln("Error listing tarball: ", result.status);
            writeln("Command output: ", result.output);
            return;
        } else {
            writeln("Contents of the tarball: ");
            writeln(result.output);
        }
    } catch (Exception e) {
        writeln("Failed to execute command: ", e.msg);
    }
}