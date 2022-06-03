module asset_info;

import std.format;

class AssetInfo
{
    string _blockchain;
    string _tag;
    string _code;
    string _extra;

    this(const string blockchain, const string tag,
            const string code, const string extra)
    {
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