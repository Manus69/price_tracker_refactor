module constants;

enum string LOG_FILE = "log.txt";
enum string URL_STRING = "https://api.dexscreener.io";
enum string REQUEST_MSG = "Requesting data from " ~ URL_STRING;
enum string SOUND_ALARM = "alarm.wav";
enum string LOG_MODE = "log";
enum string TARGET_MODE = "target";
enum string THRESHOLD = "threshold";
enum string INTERVAL = "interval";
enum string SOUND = "sound";
enum string USAGE_MSG = "Usage: ./tracker [file_name] [optional args]"
                        ~ "\nOptions: " ~ "--" ~ LOG_MODE ~ " --" ~ TARGET_MODE
                        ~ " --" ~ THRESHOLD ~ " --" ~ SOUND ~ "=off";
enum string CURL_ERROR = "Unexpected network error occured\n" ~
                            "Resuming in a bit";
enum string COMMENT = "//";
enum uint INTERVAL_DEFAULT = 1;
enum uint THRESHOLD_DEFAULT = 5;