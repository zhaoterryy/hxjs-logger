package;

import haxe.PosInfos;
import js.Browser;

@:expose
@:keep
class HxJsLogger {
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
}