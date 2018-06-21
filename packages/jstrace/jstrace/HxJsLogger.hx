package jstrace;

import haxe.PosInfos;

@:native("HxJsLogger")
extern class HxJsLogger
{
    static public function trace(v:Dynamic, ?infos:PosInfos):Void;
}