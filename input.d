module input;

import std.string;
import std.stdio;
import std.file;

import asset_info;
import asset;
import constants;


const string    CODE_PREFIX = "0x";
enum int        NOT_FOUND = -1;
const string    LINE_MSG = "Couldn't process line: ";

private int _find_code(const string[] lines)
{
    int index;

    while (index < lines.length)
    {
        if (startsWith(lines[index], CODE_PREFIX))
            return index;
        ++ index;
    }

    return -1;
}

private string _merge_tag(const string[] tokens, int left, int right)
{
    if (right <= left)
        return null;

    return join(tokens[left + 1 .. right], " ");
}

private AssetInfo _line_to_result(const string line)
{
    string[]    tokens;
    string      tag;
    string      code;
    string      extra;
    int         index;

    tokens = split(line);

    if (tokens.length < 2)
        return null;
    
    index = _find_code(tokens);
    if (index == NOT_FOUND)
        return null;

    tag = _merge_tag(tokens, 0, index);
    code = tokens[index];
    extra = index + 1 == tokens.length ? null : tokens[index + 1];

    return new AssetInfo(line, tokens[0], tag, code, extra);
}

private AssetInfo[] _parse_file(const string file_name)
{
    string        content;
    string[]      lines;
    AssetInfo[]   results;
    AssetInfo     result;

    content = readText(file_name);
    lines = splitLines(content);

    foreach (line; lines)
    {
        if (startsWith(line, COMMENT))
            continue ;

        result = _line_to_result(line);

        if (!result)
            stderr.writeln(LINE_MSG, line);
        results ~= result;
    }

    return results;
}

private Asset[] _get_assets_from_info(AssetInfo[] info)
{
    Asset[] assets;

    foreach (_info; info)
    {
        if (_info)
            assets ~= new Asset(_info);
    }

    return assets;
}

Asset[] get_assets_from_file(const string file_name)
{
    AssetInfo[] info;

    info = _parse_file(file_name);

    return _get_assets_from_info(info);
}