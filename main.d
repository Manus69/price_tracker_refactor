import input;
import asset_info;
import asset;
import request_response;
import program;
import constants;
import output;
import mode_default;
import mode_target;
import mode_log;

import std.net.curl;

void run(const string[] args, const Program program)
{
    if (program.is_default)
        return default_mode(args[1]);
    if (program.is_target)
        return target_mode(args[1], program);
    if (program.is_log)
        return log_mode(args[1], program);
}

void main(string[] args)
{
    Program program;

    if (args.length < 2)
        return error(USAGE_MSG);

    try
    {
        program = new Program(args);
    }
    catch (Exception e)
    {
        return error(e.msg);
    }

    try
    {
        return run(args, program);
    }
    catch (CurlException e)
    {
        error(CURL_ERROR);

        return run(args, program);
    }
    catch (Exception e)
    {
        return error(e.msg);
    }
}
