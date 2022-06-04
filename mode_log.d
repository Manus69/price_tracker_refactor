module mode_log;

import std.stdio;
import std.file;
import std.algorithm;
import core.thread;

import asset;
import program;
import constants;
import request_response;
import input;
import output;

enum string ASSET_N_ERROR = "Not enough assets";

void log_mode(const string file_name, const Program program)
{
    Asset[] assets;
    File    log_file;
    double  diff;

    assets = get_assets_from_file(file_name);
    log_file = File(LOG_FILE, "w");

    while (true)
    {
        evaluate_assets(assets);
        sort(assets);

        if (assets.length < 2)
            return error(ASSET_N_ERROR);

        diff = AssetPercentDiff(assets[0], assets[$ - 1]);
        display_diff(log_file, assets[0], assets[$ - 1], diff);
        log_file.flush();

        if (diff >= program.threshold)
            play_sound(program);

        Thread.sleep(program.interval.minutes);
    }
}