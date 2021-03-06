// Generated by Haxe 4.0.0-preview.4+1e3e5e0
(function ($hx_exports) { "use strict";
var $hxEnums = {};
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var Main = function() { };
Main.__name__ = true;
Main.main = function() {
	loggy_Loggy.init();
	var btnLog = window.document.getElementById("btnLog");
	var btnWarn = window.document.getElementById("btnWarn");
	var btnError = window.document.getElementById("btnError");
	btnLog.onclick = function() {
		haxe_Log.trace("this log is from a trace",{ fileName : "src/Main.hx", lineNumber : 16, className : "Main", methodName : "main"});
		return;
	};
	btnWarn.onclick = function() {
		window.console.warn("warn");
		return;
	};
	btnError.onclick = function() {
		loggy_Loggy.error("this error is from Loggy.error()",{ fileName : "src/Main.hx", lineNumber : 24, className : "Main", methodName : "main"});
		return;
	};
};
Math.__name__ = true;
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
var haxe_Log = function() { };
haxe_Log.__name__ = true;
haxe_Log.formatOutput = function(v,infos) {
	var str = Std.string(v);
	if(infos == null) {
		return str;
	}
	var pstr = infos.fileName + ":" + infos.lineNumber;
	if(infos != null && infos.customParams != null) {
		var _g = 0;
		var _g1 = infos.customParams;
		while(_g < _g1.length) {
			var v1 = _g1[_g];
			++_g;
			str += ", " + Std.string(v1);
		}
	}
	return pstr + ": " + str;
};
haxe_Log.trace = function(v,infos) {
	var str = haxe_Log.formatOutput(v,infos);
	if(typeof(console) != "undefined" && console.log != null) {
		console.log(str);
	}
};
var js__$Boot_HaxeError = function(val) {
	Error.call(this);
	this.val = val;
	if(Error.captureStackTrace) {
		Error.captureStackTrace(this,js__$Boot_HaxeError);
	}
};
js__$Boot_HaxeError.__name__ = true;
js__$Boot_HaxeError.wrap = function(val) {
	if((val instanceof Error)) {
		return val;
	} else {
		return new js__$Boot_HaxeError(val);
	}
};
js__$Boot_HaxeError.__super__ = Error;
js__$Boot_HaxeError.prototype = $extend(Error.prototype,{
});
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__string_rec = function(o,s) {
	if(o == null) {
		return "null";
	}
	if(s.length >= 5) {
		return "<...>";
	}
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) {
		t = "object";
	}
	switch(t) {
	case "function":
		return "<function>";
	case "object":
		if(o.__enum__) {
			var e = $hxEnums[o.__enum__];
			var n = e.__constructs__[o._hx_index];
			var con = e[n];
			if(con.__params__) {
				s += "\t";
				var tmp = n + "(";
				var _g = [];
				var _g1 = 0;
				var _g2 = con.__params__;
				while(_g1 < _g2.length) {
					var p = _g2[_g1];
					++_g1;
					_g.push(js_Boot.__string_rec(o[p],s));
				}
				return tmp + _g.join(",") + ")";
			} else {
				return n;
			}
		}
		if((o instanceof Array)) {
			var l = o.length;
			var i;
			var str = "[";
			s += "\t";
			var _g11 = 0;
			var _g3 = l;
			while(_g11 < _g3) {
				var i1 = _g11++;
				str += (i1 > 0 ? "," : "") + js_Boot.__string_rec(o[i1],s);
			}
			str += "]";
			return str;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e1 ) {
			var e2 = (e1 instanceof js__$Boot_HaxeError) ? e1.val : e1;
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") {
				return s2;
			}
		}
		var k = null;
		var str1 = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str1.length != 2) {
			str1 += ", \n";
		}
		str1 += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str1 += "\n" + s + "}";
		return str1;
	case "string":
		return o;
	default:
		return String(o);
	}
};
var loggy_Loggy = function() { };
loggy_Loggy.__name__ = true;
loggy_Loggy.init = function() {
	haxe_Log.trace = function(v,infos) {
		Loggy.trace(v,infos);
	};
	loggy_js_LogOverride.init();
};
loggy_Loggy.error = function(v,infos) {
	Loggy.error(v,infos);
};
var loggy_js_LogOverride = function() { };
loggy_js_LogOverride.__name__ = true;
loggy_js_LogOverride.init = function() {
	window.console.warn = function() {
		var msgs = Array.from(arguments);
		var stack = new Error().stack;
		loggy_util_Storage.log.push({ level : "warn", msg : msgs.toString(), stack : stack});
		loggy_js_LogOverride.ogWarn.apply(window.console,msgs);
	};
	window.console.error = function() {
		var msgs1 = Array.from(arguments);
		var stack1 = new Error().stack;
		loggy_util_Storage.log.push({ level : "error", msg : msgs1.toString(), stack : stack1});
		loggy_js_LogOverride.ogError.apply(window.console,msgs1);
	};
	window.console.log = function() {
		var msgs2 = Array.from(arguments);
		loggy_util_Storage.log.push({ level : "log", msg : msgs2.toString()});
		loggy_js_LogOverride.ogLog.apply(window.console,msgs2);
	};
};
var loggy_js_Loggy = $hx_exports["Loggy"] = function() { };
loggy_js_Loggy.__name__ = true;
loggy_js_Loggy.trace = function(v,infos) {
	var msg = v;
	if(infos != null && infos.customParams != null) {
		msg += " " + infos.customParams.toString();
	}
	var args = infos != null ? ["" + infos.fileName + ":" + infos.lineNumber + ":",msg] : [msg];
	if(infos != null) {
		loggy_util_Storage.log.push({ level : "log", fileName : infos.fileName, lineNumber : infos.lineNumber, msg : msg.toString()});
	} else {
		loggy_util_Storage.log.push({ level : "log", msg : msg.toString()});
	}
	loggy_js_LogOverride.ogLog.apply(window.console,args);
};
loggy_js_Loggy.error = function(v,infos) {
	var msg = v;
	if(infos != null && infos.customParams != null) {
		msg += " " + infos.customParams.toString();
	}
	var args = infos != null ? ["" + infos.fileName + ":" + infos.lineNumber + ":",msg] : [msg];
	var stack = new Error().stack;
	if(infos != null) {
		loggy_util_Storage.log.push({ level : "error", fileName : infos.fileName, lineNumber : infos.lineNumber, msg : msg.toString(), stack : stack});
	} else {
		loggy_util_Storage.log.push({ level : "error", msg : msg.toString(), stack : stack});
	}
	loggy_js_LogOverride.ogError.apply(window.console,args);
};
var loggy_util_Storage = $hx_exports["LogStorage"] = function() { };
loggy_util_Storage.__name__ = true;
loggy_util_Storage.getJSONLog = function() {
	return JSON.stringify(loggy_util_Storage.log);
};
String.__name__ = true;
Array.__name__ = true;
Object.defineProperty(js__$Boot_HaxeError.prototype,"message",{ get : function() {
	return String(this.val);
}});
loggy_js_LogOverride.ogLog = window.console.log;
loggy_js_LogOverride.ogError = window.console.error;
loggy_js_LogOverride.ogDebug = window.console.debug;
loggy_js_LogOverride.ogInfo = window.console.info;
loggy_js_LogOverride.ogWarn = window.console.warn;
loggy_util_Storage.log = [];
Main.main();
})(typeof exports != "undefined" ? exports : typeof window != "undefined" ? window : typeof self != "undefined" ? self : this);
