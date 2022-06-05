module output;

import std.string;
import std.stdio;
import std.process;
import std.file;

import constants;
import asset;
import program;

const string[]  HEADER_ARRAY = ["Price(USD) ", "Liquidity(USD)  ",
                                "Blockchain  ", "Tag    "];
const string    HEADER = join(HEADER_ARRAY);
const string    INVALID_VALUE = "Invalid Value";
const string    FMT = "%-*.*f%-*.*f%-*.*s%-*s";
const uint      DECIMAL_DIGITS = 4;
const uint      MAX_FIELD_LENGTH = 10;
const string    TAB = "  ";

version (linux)
{
    string SOUND_COMMAND = "open " ~ SOUND_ALARM;
}
version (Windows)
{
    string SOUND_COMMAND = "start " ~ SOUND_ALARM;
}

void display_asset(const Asset asset)
{
    if (asset && asset.price_usd !is double.nan)
    {
        writefln(FMT, HEADER_ARRAY[0].length, DECIMAL_DIGITS, asset.price_usd,
                    HEADER_ARRAY[1].length, 0,  asset.liquidity,
                    HEADER_ARRAY[2].length, MAX_FIELD_LENGTH, asset.blockchain,
                    HEADER_ARRAY[3].length, asset.tag);
    }
    else
    {
        writeln(INVALID_VALUE);
    }
}

void display_assets(const Asset[] assets)
{
    writeln(HEADER, "\n");

    foreach (asset; assets)
    {
        display_asset(asset);
    }
}

void display_assets_raw(const Asset[] assets)
{
    foreach (asset; assets)
    {
        writeln(asset.raw_string);
    }
}

void play_sound(const Program program)
{
    if (program.sound)
        executeShell(SOUND_COMMAND);
}

void error(const string message)
{
    stderr.writeln(message);
}

void display_diff(File file, const Asset lhs, const Asset rhs, double diff)
{
    file.writefln("%.2f %s %s", diff, lhs.tag, rhs.tag);
}