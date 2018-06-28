package loggy;

import haxe.PosInfos;
import haxe.Log;

class TraceOverride {
    public static function init() {
        Log.trace = function(v:Dynamic, ?infos:PosInfos) {
            Loggy.trace(v, infos);
        }
    }
}