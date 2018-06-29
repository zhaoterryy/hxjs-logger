package loggy.util;

#if nodejs
import js.node.Fs;
import js.Promise;
#end

import haxe.Json;

@:expose("LogStorage")
@:keep
class Storage {
    public static var log:Array<Dynamic> = [];

    public static function getJSONLog() {
        return Json.stringify(log);
    }

    public static function push(x:Dynamic) {
        log.push(x);
    }

    #if nodejs
    public static function saveToFile(path:String):Promise<Dynamic> {
        return new Promise(function(success, reject) {
            Fs.writeFile(path, getJSONLog(), function(err) {
                if (err != null) reject(err);
                success(null);
            });
        });
    }
    #end

}