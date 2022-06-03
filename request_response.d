module request_response;

import std.format;
import std.net.curl;
import std.json;
import std.conv;
import std.string;
import std.algorithm;
import std.array;

import asset;
import constants;

const string DEX_REQUEST = URL_STRING ~ "/latest/dex/pairs/%s/%s";
const string PAIR = "pair";
const string PRICE_USD = "priceUsd";
const string PRICE_NATIVE = "priceNative";
const string LIQUIDITY = "liquidity";
const string USD = "usd";

private string _get_request(const Asset asset)
{
    return format(DEX_REQUEST, asset.blockchain, asset.code);
}

string request_data(const Asset asset)
{
    string request;

    request = _get_request(asset);

    return get(request).idup;
}

private string _get_price_usd(const JSONValue j_value)
{
    return strip(j_value[PAIR][PRICE_USD].toPrettyString, "\"");
}

private string _get_price_native(const JSONValue j_value)
{
    return strip(j_value[PAIR][PRICE_NATIVE].toPrettyString, "\"");
}

private string _get_liquidity(const JSONValue j_value)
{
    return strip(j_value[PAIR][LIQUIDITY][USD].toPrettyString, "\"");
}

Asset evaluate_asset(Asset asset)
{
    JSONValue   j_value;
    string      response;

    response = request_data(asset);
    j_value = parseJSON(response);

    asset.price_usd = to!double(_get_price_usd(j_value));
    asset.price_native = to!double(_get_price_native(j_value));
    asset.liquidity = to!double(_get_liquidity(j_value));

    return asset;
}

Asset[] evaluate_assets(Asset[] assets)
{
    return map!(evaluate_asset)(assets).array;
}