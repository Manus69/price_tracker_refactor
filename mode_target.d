module mode_target;

import core.thread;
import std.algorithm;
import std.array;
import std.stdio;

import asset;
import input;
import request_response;
import output;
import program;
import constants;

private bool _diff(Asset asset)
{
    return asset.price_diff();
}

void target_mode(const string file_name, const Program program)
{
    Asset[] assets;

    while (true)
    {
        assets = get_assets_from_file(file_name);
        writeln(REQUEST_MSG);
        evaluate_assets(assets);
        assets = filter!(_diff)(assets).array;

        if (assets.length)
        {
            play_sound(program);
            display_assets_raw(assets);
        }

        Thread.sleep(program.interval.minutes);
    }
}