module asset;

import std.format;

import asset_info;

class Asset
{
    AssetInfo   _info;
    double      _price_usd;
    double      _price_native;
    double      _liquidity;
    double      _target_price;

    this(AssetInfo info)
    {
        this._info = info;
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

    int opCmp(const Asset asset) const
    {
        if (this._price_usd > asset._price_usd)
            return 1;
        if (this._price_usd < asset._price_usd)
            return -1;
        
        return 0;
    }

    override string toString() const
    {
        return format("%s %s %s %s %s", _price_usd, _price_native,
                        _liquidity, _target_price, _info);
    }
}
