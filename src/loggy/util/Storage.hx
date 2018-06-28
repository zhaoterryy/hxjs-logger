package loggy.util;

import haxe.Json;

@:expose
@:keep
class Storage {
    public static var log:Array<Dynamic> = [];

    public static function getJSONLog() {
        return Json.stringify(log);
    }
}