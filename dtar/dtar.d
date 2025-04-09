module dtar.dtar;

import std.stdio;
import std.string;

/**
 * Non-`tar` based commands for the `dtar` command-line suite. 
 * Includes:
 * - `dtar -help`: Lists all the commands provided by the `dtar` suite.
 * - `dtar -version`: Displays the version of the `dtar` suite.
 *
 * @param args Command-line arguments
 */
void main(string[] args) {
    // Check if the correct number of arguments is provided
    if (args.length != 2) {
        writeln("Usage: dtar <command>");
        return;
    }

    // Extract the command argument
    string command = args[1].toLower();

    if (command == "-help") {
        // dtar Command Flag Information
        writeln(title("dtar commands:"));
        writeln(comm("dtar") ~ " " ~ required("-help") ~ ": Lists all the commands provided by the dtar suite.");
        writeln(comm("dtar") ~ " " ~ required("-version") ~ ": Displays the version of the dtar suite.");

        // dtar Suite Commands
        writeln(title ("Available commands:"));
        writeln(comm("taradd") ~ " " ~ required("<archive>") ~ " " ~ required("<file>") ~ 
                ": Adds a file to the specified tarball (tar archive).");
        writeln(comm("tarball") ~ " " ~ required("<path>") ~ " " ~ optional("[output]") ~ 
                ": Creates a tarball from the specified directory or file.");
        writeln(comm("tarballex") ~ " " ~ required("<archive>") ~ " " ~ optional("[path]") ~ 
                ": Extracts the contents of a tarball to the specified path.");
        writeln(comm("tarbzip") ~ " " ~ required("<path>") ~ " " ~ optional("[output]") ~ 
                ": Creates a bzip2-compressed tarball from the specified directory or file.");
        writeln(comm("tarbzipex") ~ " " ~ required("<archive>") ~ 
                ": Extracts the contents of a bzip2-compressed tarball.");
        writeln(comm("targzip") ~ " " ~ required("<path>") ~ " " ~ optional("[output]") ~ 
                ": Creates a gzip-compressed tarball from the specified directory or file.");
        writeln(comm("targzipex") ~ " " ~ required("<archive>") ~
                ": Extracts the contents of a gzip-compressed tarball.");
        writeln(comm("tarlist") ~ " " ~ required("<archive>") ~ 
                ": Lists the contents of a tarball (tar archive).");
        writeln(comm("tarxzip") ~ " " ~ required("<path>") ~ " " ~ optional("[output]") ~ 
                ": Creates a xz-compressed tarball from the specified directory or file.");
        writeln(comm("tarxzipex") ~ " " ~ required("<archive>") ~
                ": Extracts the contents of a xz-compressed tarball.");
        writeln(comm("tarzip") ~ " " ~ required("<path>") ~ required("<compression_type>") ~ 
                " " ~ optional("[output]") ~ 
                ": Creates a tarball from the specified directory or file with the specified compression type.");
    } else if (command == "-version") {
        writeln("dtar version: " ~ ver("0.0.2"));
        writeln("Release date: 2025-04-08");
    } else {
        writeln("Unknown command: ", command);
        writeln("Use 'dtar -help' for a list of available commands.");
    }
}

/**
 * Set the color of text for a title section.
 * The selected color for the title is green.
 *
 * @param str The string to be colored.
 * @return The colored string.
 */
string title(string str) {
    return "\033[32m" ~ str ~ "\033[0m";
}

/**
 * Set the color of text for a version section.
 * The selected color for the version is red.
 *
 * @param str The string to be colored.
 * @return The colored string.
 */
string ver(string str) {
    return "\033[31m" ~ str ~ "\033[0m";
}

/**
 * Set the color of text for a command section.
 * The selected color for the command is blue.
 *
 * @param str The string to be colored.
 * @return The colored string.
 */
string comm(string str) {
    return "\033[34m" ~ str ~ "\033[0m"; 
}

/** 
 * Set the color of text for a required section.
 * The selected color for the required section is cyan.
 *
 * @param str The string to be colored.
 * @return The colored string.
 */
string required(string str) {
    return "\033[36m" ~ str ~ "\033[0m"; 
}
/**
 * Set the color of text for an optional section.
 * The selected color for the optional section is yellow.
 *
 * @param str The string to be colored.
 * @return The colored string.
 */
string optional(string str) {
    return "\033[33m" ~ str ~ "\033[0m";
}
