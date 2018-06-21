package;

import haxe.PosInfos;
import js.Browser;

@:expose
@:keep
class HxJsLogger {
    static function trace (v:Dynamic, ?infos:PosInfos) {
        var args:Array<Dynamic> = (infos != null) ? [infos.fileName, infos.lineNumber, v] : [v];

        if (infos != null) {
            LogStorage.log.push({
                level: 'log',
                fileName: infos.fileName,
                lineNumber: infos.lineNumber,
                msg: v
             });
        } else {
            LogStorage.log.push({
                level: 'log',
                msg: v
            });
        }

        LogOverride.ogLog.apply(Browser.window.console, args);
    }
}