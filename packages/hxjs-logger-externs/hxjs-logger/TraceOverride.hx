package hxjslogger;

import haxe.PosInfos;
import haxe.Log;

class TraceOverride {
    public static function init() {
        Log.trace = (v:Dynamic, ?infos:PosInfos) -> {
            HxJsLogger.trace(v, infos);
        }
    }

    public static function error(cl:Class<Log>, v:Dynamic, ?infos:PosInfos) {
        HxJsLogger.error(v, infos);
    }
}