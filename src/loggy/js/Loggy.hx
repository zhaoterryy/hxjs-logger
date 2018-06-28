package loggy.js;

import js.Error;
import haxe.PosInfos;
import js.Browser;
import loggy.util.Storage as LogStorage;

@:expose("Loggy")
@:keep
class Loggy {
    static function trace (v:Dynamic, ?infos:PosInfos) {
        var msg = v;
        if (infos != null && infos.customParams != null) {
            msg += " " + infos.customParams.toString();
        }

        var args:Array<Dynamic> = (infos != null) ? ['${infos.fileName}:${infos.lineNumber}:', msg] : [msg];

        if (infos != null) {
            LogStorage.log.push({
                level: 'log',
                fileName: infos.fileName,
                lineNumber: infos.lineNumber,
                msg: msg.toString()
             });
        } else {
            LogStorage.log.push({
                level: 'log',
                msg: msg.toString()
            });
        }

        LogOverride.ogLog.apply(Browser.window.console, args);
    }

    static function error (v:Dynamic, ?infos:PosInfos) {
        var msg = v;
        if (infos != null && infos.customParams != null) {
            msg += " " + infos.customParams.toString();
        }

        var args:Array<Dynamic> = (infos != null) ? ['${infos.fileName}:${infos.lineNumber}:', msg] : [msg];
        var stack = new Error().stack;

        if (infos != null) {
            LogStorage.log.push({
                level: 'error',
                fileName: infos.fileName,
                lineNumber: infos.lineNumber,
                msg: msg.toString(),
                stack: stack
             });
        } else {
            LogStorage.log.push({
                level: 'error',
                msg: msg.toString(),
                stack: stack
            });
        }

        LogOverride.ogError.apply(Browser.window.console, args);
    }
}