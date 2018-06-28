package loggy.js;

import js.Error;
import js.Browser;
import loggy.js.Loggy;
import loggy.util.Storage as LogStorage;

@:allow(loggy.LoggyInit)
class LogOverride {
    public static var ogLog = untyped window.console.log;
    public static var ogError = untyped window.console.error;
    static var ogDebug = untyped window.console.debug;
    static var ogInfo = untyped window.console.info;
    static var ogWarn = untyped window.console.warn;

    private static function init() {
        untyped window.console.warn = function() {
            var msgs:Array<Dynamic> = Array.from(arguments);
            var stack = new Error().stack;
            LogStorage.log.push({ level:'warn', msg:msgs.toString(), stack:stack });

            ogWarn.apply(Browser.window.console, msgs);
        }

        untyped window.console.error = function() {
            var msgs:Array<Dynamic> = Array.from(arguments);
            var stack = new Error().stack;
            LogStorage.log.push({ level:'error', msg:msgs.toString(), stack:stack });

            ogError.apply(Browser.window.console, msgs);

        }

        untyped window.console.log = function() {
            var msgs:Array<Dynamic> = Array.from(arguments);
            LogStorage.log.push({ level:'log', msg:msgs.toString() });

            ogLog.apply(Browser.window.console, msgs);
        }
    }
}
