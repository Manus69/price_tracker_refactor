module asset;

import std.format;
import std.conv;

import asset_info;

private double _get_target_price(Asset asset, const AssetInfo info)
{
    string str;

    str = info._extra;
    if (str[0] == '>')
    {
        asset._greater = true;
        str = str[1 .. $];
    }
    else if (str[0] == '<')
        str = str[1 .. $];
    
    return to!double(str);
}

class Asset
{
    AssetInfo   _info;
    double      _price_usd;
    double      _price_native;
    double      _liquidity;
    double      _target_price;
    bool        _greater;

    this(AssetInfo info)
    {
        this._info = info;
        if (info._extra)
        {
            this._target_price = _get_target_price(this, info);
        }
    }

    void price_usd(double price) @property
    {
        this._price_usd = price;
    }

    double price_usd() const @property
    {
        return this._price_usd;
    }

    void price_native(double price) @property
    {
        this._price_native = price;
    }

    void liquidity(double liquidity) @property
    {
        this._liquidity = liquidity;
    }

    double liquidity() const @property
    {
        return this._liquidity;
    }

    void target_price(double target_price) @property
    {
        this._target_price = target_price;
    }

    string blockchain() const @property
    {
        return this._info._blockchain;
    }

    string code() const @property
    {
        return this._info._code;
    }

    string tag() const @property
    {
        return this._info._tag;
    }

    bool price_greater() const @property
    {
        return this._price_native > this._target_price;
    }

    bool price_less() const @property
    {
        return this._price_native < this._target_price;
    }

    bool price_diff() const @property
    {
        return this._greater ? this.price_greater : this.price_less;
    }

    int opCmp(const Asset asset) const
    {
        if (this._price_usd > asset._price_usd)
            return 1;
        if (this._price_usd < asset._price_usd)
            return -1;
        
        return 0;
    }

    string raw_string() const @property
    {
        return this._info._raw_string;
    }

    override string toString() const
    {
        return format("%s %s %s %s %s", _price_usd, _price_native,
                        _liquidity, _target_price, _info);
    }
}

double AssetPercentDiff(const Asset lhs, const Asset rhs)
{
    double max;
    double min;

    if (lhs > rhs)
    {
        max = lhs._price_usd;
        min = rhs._price_usd;
    }
    else
    {
        max = rhs._price_usd;
        min = lhs._price_usd;
    }

    return ((max - min) / min) * 100;
}
