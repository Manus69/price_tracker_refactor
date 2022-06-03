module mode_default;

import std.algorithm;
import std.stdio;

import asset;
import input;
import request_response;
import output;
import constants;

void default_mode(const string file_name)
{
    Asset[] assets;

    writeln(REQUEST_MSG);
    assets = get_assets_from_file(file_name);
    evaluate_assets(assets);
    sort(assets);

    display_assets(assets);
}