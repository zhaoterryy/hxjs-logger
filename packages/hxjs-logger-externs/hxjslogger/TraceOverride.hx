package hxjslogger;

import haxe.PosInfos;
import haxe.Log;

class TraceOverride {
    public static function init() {
        Log.trace = (v:Dynamic, ?infos:PosInfos) -> {
            HxJsLogger.trace(v, infos);
        }
    }
}