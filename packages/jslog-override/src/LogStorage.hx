package;

import haxe.Json;

@:expose
@:keep
class LogStorage {
    public static var log:Array<Dynamic> = [];

    public static function getJSONLog() {
        return Json.stringify(log);
    }
}