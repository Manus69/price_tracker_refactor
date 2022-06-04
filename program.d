module program;

import std.getopt;

import constants;

class Program
{
    bool _default;
    bool _log;
    bool _target;
    bool _sound;

    uint _interval;
    uint _threshold;

    this(string[] args)
    {
        getopt(args, LOG_MODE, &_log, TARGET_MODE, &_target,
                INTERVAL, &_interval, THRESHOLD, &_threshold);
        
        if (!_log && !_target)
            _default = true;

        if (!_interval)
            _interval = INTERVAL_DEFAULT;

        if (!_threshold)
            _threshold = THRESHOLD_DEFAULT;

        _sound = true;
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

    uint threshold() const @property
    {
        return _threshold;
    }

    bool sound() const @property
    {
        return _sound;
    }
}