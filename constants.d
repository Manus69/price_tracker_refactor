module constants;

const string URL_STRING = "https://api.dexscreener.io";
const string REQUEST_MSG = "Requesting data from " ~ URL_STRING;
const string SOUND_ALARM = "alarm.wav";
const string LOG_MODE = "log";
const string TARGET_MODE = "target";
const string INTERVAL = "interval";
const string USAGE_MSG = "Usage: ./tracker [file_name] [optional args]"
                        ~ "\nOptions: " ~ "--" ~ LOG_MODE ~ " --" ~ TARGET_MODE;
const uint INTERVAL_DEFAULT = 1;