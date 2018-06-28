package loggy;

import loggy.js.LogOverride;
import haxe.Log;
import haxe.PosInfos;

@:native("Loggy")
extern class Loggy
{
    static public function trace(v:Dynamic, ?infos:PosInfos):Void;
    static public function error(v:Dynamic, ?infos:PosInfos):Void;
}

class LoggyInit 
{
    public function new() {
        Log.trace = function(v:Dynamic, ?infos:PosInfos) {
            Loggy.trace(v, infos);
        }

        #if js
        LogOverride.init();
        #end
    }
}