package;

import js.Error;
import js.Browser;

class LogOverride {
    public static var ogLog = untyped window.console.log;
    static var ogDebug = untyped window.console.debug;
    static var ogInfo = untyped window.console.info;
    static var ogWarn = untyped window.console.warn;
    static var ogError = untyped window.console.error;

    public static function init() {
        untyped window.console.warn = () -> {
            var msgs:Array<Dynamic> = Array.from(arguments);
            var stack = new Error().stack;
            LogStorage.log.push({ level:'warn', msg:msgs.toString(), stack:stack });

            ogWarn.apply(Browser.window.console, msgs);
        }

        untyped window.console.error = () -> {
            var msgs:Array<Dynamic> = Array.from(arguments);
            var stack = new Error().stack;
            LogStorage.log.push({ level:'error', msg:msgs.toString(), stack:stack });

            ogError.apply(Browser.window.console, msgs);

        }

        untyped window.console.log = () -> {
            var msgs:Array<Dynamic> = Array.from(arguments);
            LogStorage.log.push({ level:'log', msg:msgs.toString() });

            ogLog.apply(Browser.window.console, msgs);
        }

        untyped window.testerror = () -> {
            Browser.document.getElementById('nah').style.left = '128312px';
        }
    }
}