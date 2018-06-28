package loggy;

import haxe.PosInfos;

@:native("Loggy")
extern class Loggy
{
    static public function trace(v:Dynamic, ?infos:PosInfos):Void;
    static public function error(v:Dynamic, ?infos:PosInfos):Void;
}