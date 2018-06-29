package loggy;

import loggy.js.LogOverride;
import haxe.Log;
import haxe.PosInfos;

@:native("Loggy")
extern class LoggyLog
{
    static public function trace(v:Dynamic, ?infos:PosInfos):Void;
    static public function error(v:Dynamic, ?infos:PosInfos):Void;
    static public function warn(v:Dynamic, ?infos:PosInfos):Void;
}

class Loggy
{
    public static function init() {
        Log.trace = function(v:Dynamic, ?infos:PosInfos) {
            LoggyLog.trace(v, infos);
        }

        #if js
        LogOverride.init();
        #end
    }

    public static function error(cl:Class<Log>, v:Dynamic, ?infos:PosInfos) {
        LoggyLog.error(v, infos);
    }

    public static function warn(cl:Class<Log>, v:Dynamic, ?infos:PosInfos) {
        LoggyLog.warn(v, infos);
    }
}