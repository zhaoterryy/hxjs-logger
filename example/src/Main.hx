package;

import loggy.Loggy;
import js.html.Document;
import js.Browser;

class Main {
    public static function main() {
        Loggy.init();

        var btnLog = Browser.document.getElementById("btnLog");
        var btnWarn = Browser.document.getElementById("btnWarn");
        var btnError = Browser.document.getElementById("btnError");

        btnLog.onclick = () -> {
            trace("this log is from a trace");
        }

        btnWarn.onclick = () -> {
            Browser.console.warn("warn");
        }

        btnError.onclick = () -> {
            error("this error is from Loggy.error()");
        }
    }
}