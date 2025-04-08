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
        writeln(green("dtar commands:"));
        writeln(blue("dtar") ~ " " ~ cyan("-help") ~ ": Lists all the commands provided by the dtar suite.");
        writeln(blue("dtar") ~ " " ~ cyan("-version") ~ ": Displays the version of the dtar suite.");
        writeln(green ("Available commands:"));
        writeln(blue("tarball") ~ " " ~ cyan("<path>") ~ " " ~ yellow("[output]") ~ ": Creates a tarball from the specified directory or file.");
        writeln(blue("tarlist") ~ " " ~ cyan("<archive>") ~ ": Lists the contents of a tarball (tar archive).");
    } else if (command == "-version") {
        writeln("dtar version: " ~ red("0.0.1"));
        writeln("Release date: 2025-04-07");
    } else {
        writeln("Unknown command: ", command);
        writeln("Use 'dtar -help' for a list of available commands.");
    }

}

string green(string str) {
    return "\033[32m" ~ str ~ "\033[0m"; // ANSI escape code for green text
}

string red(string str) {
    return "\033[31m" ~ str ~ "\033[0m"; // ANSI escape code for red text
}

string blue(string str) {
    return "\033[34m" ~ str ~ "\033[0m"; // ANSI escape code for blue text
}

string cyan(string str) {
    return "\033[36m" ~ str ~ "\033[0m"; // ANSI escape code for cyan text
}

string yellow(string str) {
    return "\033[33m" ~ str ~ "\033[0m"; // ANSI escape code for yellow text
}
