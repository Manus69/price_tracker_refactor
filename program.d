module program;

import std.getopt;

import constants;

class Program
{
    bool _default;
    bool _log;
    bool _target;

    uint _interval;

    this(string[] args)
    {
        getopt(args, LOG_MODE, &_log, TARGET_MODE, &_target,
                INTERVAL, &_interval);
        
        if (!_log && !_target)
            _default = true;

        if (!_interval)
            _interval = INTERVAL_DEFAULT;
    }

    bool is_default() const @property
    {
        return _default;
    }

    bool is_log() const @property
    {
        return _log;
    }

    bool is_target() const @property
    {
        return _target;
    }

    uint interval() const @property
    {
        return _interval;
    }
}