module mode_default;

import std.algorithm;

import asset;
import input;
import request_response;
import output;

void default_mode(const string file_name)
{
    Asset[] assets;

    assets = get_assets_from_file(file_name);
    evaluate_assets(assets);
    sort(assets);

    display_assets(assets);
}