package;

import haxe.Json;

@:expose
class LogStorage {
    static var log:Array<Dynamic> = [];

    @:keep
    static function getJSONLog() {
        return Json.stringify(log);
    }
}