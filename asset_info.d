module asset_info;

import std.format;

class AssetInfo
{
    string _raw_string;
    string _blockchain;
    string _tag;
    string _code;
    string _extra;

    this(const string raw_string, const string blockchain, const string tag,
            const string code, const string extra)
    {
        this._raw_string = raw_string;
        this._blockchain = blockchain;
        this._tag = tag;
        this._code = code;
        this._extra = extra;
    }

    override string toString() const
    {
        return format("%s\t%s\t%s\t%s\t", _blockchain, _tag, _code, _extra);
    }
}