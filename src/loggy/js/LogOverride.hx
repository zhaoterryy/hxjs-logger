package loggy.js;

import js.Error;
import js.Browser;
import loggy.js.Loggy;
import loggy.util.Storage as LogStorage;

@:allow(loggy.Loggy)
class LogOverride {
    public static var ogLog = untyped window.console.log;
    public static var ogError = untyped window.console.error;
    public static var ogWarn = untyped window.console.warn;

    private static function init() {
        untyped window.console.warn = function() {
            var msgs:Array<Dynamic> = Array.from(untyped __js__('arguments'));
            var stack = new Error().stack;
            LogStorage.log.push({ level:'warn', msg:msgs.toString(), stack:stack });

            ogWarn.apply(Browser.window.console, msgs);
        }

        untyped window.console.error = function() {
            var msgs:Array<Dynamic> = Array.from(untyped __js__('arguments'));
            var stack = new Error().stack;
            LogStorage.log.push({ level:'error', msg:msgs.toString(), stack:stack });

            ogError.apply(Browser.window.console, msgs);

        }

        untyped window.console.log = function() {
            var msgs:Array<Dynamic> = Array.from(untyped __js__('arguments'));
            LogStorage.log.push({ level:'log', msg:msgs.toString() });

            ogLog.apply(Browser.window.console, msgs);
        }
    }
}
