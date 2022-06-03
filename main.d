import std.stdio;
import std.parallelism;
import std.net.curl;

//
import input;
import asset_info;
import asset;
import request_response;
import program;
import constants;
import output;
import mode_default;

const string _FILE = "price.txt";

void main(string[] args)
{
    Program program;

    if (args.length < 2)
        return error(USAGE_MSG);

    program = new Program(args);

    if (program.is_default)
        return default_mode(args[1]);
}



