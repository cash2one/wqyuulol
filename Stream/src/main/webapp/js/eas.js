if (typeof EAS != "object") {
	var EAS = (function() {
		var fnn = {
			getUrlVars : function(url) {
				var vars = [], hash;
				var hashes = url.slice(url.indexOf("?") + 1).split("&");
				for (var i = 0; i < hashes.length; i++) {
					hash = hashes[i].split("=");
					vars.push(hash[0]);
					vars[hash[0]] = hash[1]
				}
				return vars
			},
			getUrlVar : function(url, name) {
				var _vars = fnn.getUrlVars(url);
				if (_vars[name] == null || _vars[name] == undefined) {
					return 0
				} else {
					return _vars[name]
				}
			},
			loadjs : function(url, callback, charset) {
				var script = document.createElement("script");
				script.type = "text/javascript";
				if (charset) {
					script.setAttribute("charset", charset)
				}
				if (script.readyState) {
					script.onreadystatechange = function() {
						if (script.readyState == "loaded"
								|| script.readyState == "complete") {
							script.onreadystatechange = null;
							callback();
							document.getElementsByTagName("head")[0]
									.removeChild(this)
						}
					}
				} else {
					script.onload = function() {
						callback();
						document.getElementsByTagName("head")[0]
								.removeChild(this)
					}
				}
				script.src = url;
				document.getElementsByTagName("head")[0].appendChild(script)
			},
			loadimg : function(url, callback) {
				var iImgObj = new Image();
				iImgObj.onload = function() {
					iImgObj = null
				};
				iImgObj.onerror = function() {
					iImgObj = null
				};
				iImgObj.src = url
			},
			trim : function(str) {
				return str.replace(/^(\s|\u00A0)+/, "").replace(
						/(\s|\u00A0)+$/, "")
			},
			getEasUrl : function(url) {
				url.toLowerCase();
				if (url.indexOf("?") != -1) {
					var _url = url.substr(0, url.indexOf("?"))
				} else {
					var _url = url
				}
				_url = _url.replace("index.shtml", "")
						.replace("index.html", "").replace("index.htm", "")
						.replace("index.php", "");
				if (_url.indexOf("#") != -1) {
					_url = _url.substr(0, _url.indexOf("#"))
				}
				var arrUrl = _url.split("/");
				var LastStr = arrUrl[arrUrl.length - 1];
				if (LastStr != "" && LastStr != undefined
						&& LastStr.indexOf(".shtml") == -1
						&& LastStr.indexOf(".html") == -1
						&& LastStr.indexOf(".htm") == -1
						&& LastStr.indexOf(".php") == -1) {
					_url = _url + "/"
				}
				return _url
			},
			trimStr : function(s) {
				if (typeof s != "string") {
					s = s.toString()
				}
				if (s.indexOf("%") != -1) {
					s = s.substr(0, s.indexOf("%"))
				}
				if (s.indexOf("#") != -1) {
					s = s.substr(0, s.indexOf("#"))
				}
				rs = s.replace(/\/|'|#|@|\<|\>|\?|\&|\^|\"/g, "");
				return rs
			},
			urlEncode : function(param, key, encode) {
				if (param == null) {
					return ""
				}
				var paramStr = "";
				var t = typeof (param);
				if (t == "string" || t == "number" || t == "boolean") {
					paramStr += "&"
							+ key
							+ "="
							+ ((encode == null || encode) ? encodeURIComponent(param)
									: param)
				} else {
					for ( var i in param) {
						var k = key == null ? i : key
								+ (param instanceof Array ? "[" + i + "]" : "."
										+ i);
						paramStr += fnn.urlEncode(param[i], k, encode)
					}
				}
				return paramStr
			}
		};
		var el = document, LogCgi = "//apps.game.qq.com/eas/comm/eas.php?", LogCgiGo = "//apps.game.qq.com/easnew/go/eas.php?", sendClickUrl = "http://apps.game.qq.com/adw_sendclick/api/send_click.php?", GODMkUrl = "http://apps.game.qq.com/fifa/qiyehao/index.php?m=GODMLogin", UrlPathName = window.location.pathname, UrlHost = window.location.host, UrlHref = window.location.href, ReferrerUrl = document.referrer, http_type = document.location.protocol, LogUrl = fnn
				.getEasUrl(UrlHref), e_code = 0, g_code = 0, ad_id = 0, o2_mid = 0, eas_type = 0, RandNum = Math
				.floor(Math.random() * 10), hasAMS = false, hasSend = false, EasADTAG = "EAS-ADTAG", ADShowArr = {}, ECMSysName = "", ECMCode = "", ECMCookie = "", GODM_user = "", GODM_serviceType = "", GODM_sysName = "", Sys_userId = "", Sys_openId = "", Sys_channel = "", Sys_serviceType = "", Sys_sysName = "", AmsId = "", adtagArr = new Array(), Close = false, TimeOut = false, StartTime = new Date()
				.getTime();
		if (http_type == "https:") {
			LogCgiGo = http_type + "//logs.game.qq.com/easnew/go/eas.php?"
		}
		var addEvent = function(obj, name, func) {
			var isIE11 = !!navigator.userAgent.match(/Trident\/7\./);
			if (isIE11) {
				obj["on" + name] = func
			} else {
				if (window.attachEvent) {
					obj.attachEvent("on" + name, func)
				} else {
					obj.addEventListener(name, func, false)
				}
			}
		};
		var browser = {
			versions : function() {
				var u = navigator.userAgent, app = navigator.appVersion;
				return {
					trident : u.indexOf("Trident") > -1,
					presto : u.indexOf("Presto") > -1,
					webKit : u.indexOf("AppleWebKit") > -1,
					gecko : u.indexOf("Gecko") > -1 && u.indexOf("KHTML") == -1,
					mobile : !!u.match(/AppleWebKit.*Mobile.*/),
					ios : !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
					android : u.indexOf("Android") > -1
							|| u.indexOf("Linux") > -1,
					iPhone : u.indexOf("iPhone") > -1 || u.indexOf("Mac") > -1,
					iPad : u.indexOf("iPad") > -1,
					webApp : u.indexOf("Safari") == -1,
					google : u.indexOf("Chrome") > -1
				}
			}()
		};
		var CheckAMS = function() {
			var a = {};
			a: {
				var c = document.getElementsByTagName("script");
				for (d = 0; d < c.length; d++) {
					var e = c[d].src;
					if (e && 0 <= e.toLowerCase().indexOf("reporting.js")) {
						AmsId = fnn.getUrlVar(e, "action");
						if (AmsId < 50398 && AmsId != 0) {
							hasAMS = true
						}
						break a
					}
				}
				d = ""
			}
		};
		var GetEasSid = function() {
			var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			var maxPos = chars.length;
			var pwd = "";
			var timer = (new Date()).getTime().toString();
			if (typeof timer != "string") {
				timer = Math.floor(
						Math.random() * (9999999999999 - 1000000000000)
								+ 1000000000000).toString()
			}
			if (timer == undefined || timer == null) {
				var timerArr = Math.random().toString().split(".");
				timer = timerArr[1]
			}
			if (timer) {
				timer = timer.split("")
			}
			for (i = 0; i < 13; i++) {
				var rank = Math.floor(Math.random() * maxPos);
				pwd += chars.charAt(rank) + timer[i]
			}
			return pwd
		};
		var GetTrackCode = function() {
			e_code = fnn.getUrlVar(UrlHref, "ad_id");
			if (e_code == null || e_code == undefined || e_code == 0) {
				e_code = fnn.getUrlVar(UrlHref, "e_code");
				if (e_code == null || e_code == undefined) {
					e_code = 0
				}
			} else {
				e_code = "o2." + e_code
			}
			o2_mid = fnn.getUrlVar(UrlHref, "mtr_id");
			if (o2_mid == null || o2_mid == undefined) {
				o2_mid = 0
			}
			g_code = fnn.getUrlVar(UrlHref, "g_code");
			if (g_code == null || g_code == undefined) {
				g_code = 0
			}
			e_code = fnn.trimStr(e_code);
			g_code = parseInt(g_code);
			o2_mid = parseInt(o2_mid)
		};
		var GetECode = function(clickurl) {
			var _e_code = fnn.getUrlVar(clickurl, "ad_id");
			if (_e_code == null || _e_code == undefined || _e_code == 0) {
				_e_code = fnn.getUrlVar(clickurl, "e_code");
				if (_e_code == null || _e_code == undefined) {
					_e_code = 0
				}
			} else {
				_e_code = "o2." + _e_code
			}
			return fnn.trimStr(_e_code)
		};
		var SendLog = function(_LogCgi, param, _callback) {
			var SendLogUrl = _LogCgi + param + "&r=" + (new Date()).getTime();
			if (typeof (_callback) === "function") {
				fnn.loadimg(SendLogUrl, function() {
				});
				_callback()
			} else {
				fnn.loadimg(SendLogUrl, function() {
				})
			}
		};
		var PingTcssHot = function(TagName) {
			fnn.loadjs("http://pingjs.qq.com/tcss.ping.js", function() {
				if (typeof (pgvSendClick) === "function") {
					pgvSendClick({
						hottag : TagName
					})
				}
			})
		};
		var Init = function() {
			if (!hasAMS && !hasSend) {
				hasSend = true;
				var eas_sid = EASCookie("eas_sid");
				if (eas_sid == undefined || eas_sid == null) {
					eas_sid = GetEasSid();
					EASCookie;
					EASCookie("eas_sid", eas_sid, {
						expires : 525600,
						path : "/",
						domain : "qq.com"
					})
				}
				var param = "click_type=3&e_code=" + e_code + "&o2_mid="
						+ o2_mid + "&Url=" + encodeURIComponent(LogUrl)
						+ "&ReferrerUrl=" + encodeURIComponent(ReferrerUrl);
				SendLog(LogCgiGo, param)
			}
		};
		var ADTAGPop = function() {
			if (UrlHost == "x5.qq.com" || UrlHost == "lol.qq.com") {
				var AllEls = el.getElementsByTagName("*"), AllElsLength = AllEls.length, oCurrEl, ShowTAGList = new Array(), index = 0;
				while (AllElsLength--) {
					oCurrEl = AllEls[AllElsLength];
					var oAttribute = "", HrefValue = "", HrefCode = "", e_param = "", param = "";
					HrefValue = oCurrEl.getAttribute
							&& oCurrEl.getAttribute("href");
					if (typeof HrefValue == "string" && HrefValue.length > 0) {
						HrefCode = parseInt(fnn.getUrlVar(HrefValue, "e_code"));
						if (HrefCode != null && HrefCode != undefined
								&& HrefCode != 0) {
							ShowTAGList.push(HrefCode);
							e_param = {
								e_c : HrefCode,
								c_d : HrefValue,
								c_t : 102
							}
						}
					}
					oAttribute = oCurrEl.getAttribute
							&& oCurrEl.getAttribute(EasADTAG);
					if (typeof oAttribute == "string" && oAttribute.length > 0) {
						ShowTAGList.push(oAttribute);
						e_param = {
							e_c : oAttribute,
							c_t : 102
						}
					}
					if (e_param || param) {
						(function(i, j) {
							EAS.addEvent(oCurrEl, "click", function() {
								if (typeof i == "object") {
									SendClick(i, function() {
									})
								}
								if (typeof j == "object") {
									SendClick(j, function() {
									})
								}
							})
						})(e_param, param)
					}
					if (AllElsLength == 0) {
						if (ShowTAGList.length > 0) {
							var ShowTAGStr = ShowTAGList.join("|");
							var param = {
								e_c : ShowTAGStr,
								c_t : 101
							};
							SendClick(param, function() {
							})
						}
					}
				}
			}
		};
		var SendClick = function(param, _callback) {
			if (typeof param == "object") {
				var _p = param, _c_t = 0, _e_c = 0, _e_cArray = "", _e_code = 0, _clickurl = "", l_p = "", l_p_go = "", _areaid = 0, _roleid = 0, _c_p = 0;
				if (_p.e_c !== null && _p.e_c !== undefined) {
					_e_c = _p.e_c
				} else {
					return false
				}
				if (_p.c_p !== null && _p.c_p !== undefined) {
					_c_p = _p.c_p
				}
				if (_p.c_t !== null && _p.c_t !== undefined) {
					_c_t = _p.c_t
				}
				if (_p.c_d !== null && _p.c_d !== undefined) {
					if (typeof _p.c_d == "object") {
						if (_p.c_d.href !== null && _p.c_d.href !== undefined) {
							_clickurl = _p.c_d.href
						}
					} else {
						_clickurl = _p.c_d
					}
				}
				if (_clickurl) {
					_clickurl = fnn.getEasUrl(_clickurl)
				}
				if (parseInt(_c_t) == 1) {
					l_p_go = "show_ads=" + _e_c + "&Url="
							+ encodeURIComponent(LogUrl) + "&click_type=1"
				}
				if (parseInt(_c_t) == 2) {
					l_p_go = "show_ads=" + _e_c + "&ad_url="
							+ encodeURIComponent(_clickurl) + "&ReferrerUrl="
							+ encodeURIComponent(LogUrl) + "&click_type=2";
					_callback = function() {
					}
				}
				if (parseInt(_c_t) == 4) {
					if (UrlHost == "x5.qq.com") {
						if (Close == false && _e_c != "close") {
							adtagArr.push(_e_c)
						}
						if (adtagArr.length == 1) {
							setTimeout(function() {
								if (adtagArr.length > 0) {
									var _e_c = adtagArr.join("|");
									l_p_go = "click_type=4&adtag=" + _e_c
											+ "&e_code=" + e_code + "&o2_mid="
											+ o2_mid + "&Url="
											+ encodeURIComponent(LogUrl)
											+ "&ReferrerUrl="
											+ encodeURIComponent(ReferrerUrl);
									adtagArr = new Array();
									if (l_p_go) {
										if (typeof (_callback) === "function") {
											SendLog(LogCgiGo, l_p_go,
													function() {
														_callback()
													})
										} else {
											SendLog(LogCgiGo, l_p_go)
										}
									}
								}
							}, 5000)
						}
						if (adtagArr.length == 5 || Close == true) {
							var _e_c = adtagArr.join("|");
							l_p_go = "click_type=4&adtag=" + _e_c + "&e_code="
									+ e_code + "&o2_mid=" + o2_mid + "&Url="
									+ encodeURIComponent(LogUrl)
									+ "&ReferrerUrl="
									+ encodeURIComponent(ReferrerUrl);
							adtagArr = new Array()
						}
					} else {
						l_p_go = "click_type=4&adtag=" + _e_c + "&e_code="
								+ e_code + "&o2_mid=" + o2_mid + "&Url="
								+ encodeURIComponent(LogUrl) + "&ReferrerUrl="
								+ encodeURIComponent(ReferrerUrl)
					}
				}
				if (parseInt(_c_t) == 99 || parseInt(_c_t) == 100) {
					l_p_go = "click_type=" + parseInt(_c_t) + "&e_code=" + _e_c
							+ "&Url=" + encodeURIComponent(LogUrl)
							+ "&ReferrerUrl=" + encodeURIComponent(ReferrerUrl)
				}
				if (parseInt(_c_t) == 101) {
					if (_e_c.indexOf("|") != -1) {
						tmp_codeArr = _e_c.split("|")
					}
					l_p_go = "click_type=101&e_code=" + _e_c + "&c_p=" + _c_p
							+ "&Url=" + encodeURIComponent(LogUrl)
							+ "&ReferrerUrl=" + encodeURIComponent(ReferrerUrl)
				}
				if (parseInt(_c_t) == 102) {
					if (_clickurl) {
						l_p_go = "click_type=102&e_code=" + _e_c + "&c_p="
								+ _c_p + "&Url="
								+ encodeURIComponent(_clickurl)
								+ "&ReferrerUrl=" + encodeURIComponent(LogUrl)
					} else {
						l_p_go = "click_type=102&e_code=" + _e_c + "&c_p="
								+ _c_p + "&Url=" + encodeURIComponent(LogUrl)
								+ "&ReferrerUrl=" + encodeURIComponent(LogUrl)
					}
				}
				if (l_p_go) {
					if (typeof (_callback) === "function") {
						SendLog(LogCgiGo, l_p_go, function() {
							_callback()
						})
					} else {
						SendLog(LogCgiGo, l_p_go)
					}
				}
			}
		};
		var GetADShowCodeList = function(ADArr) {
			var result = [], tmp_code;
			for (var i = 0, _url; (_url = ADArr[i]) != null; i++) {
				tmp_code = GetECode(_url);
				if (tmp_code != null && tmp_code != undefined && tmp_code != 0) {
					if (!ADShowArr[tmp_code]) {
						result.push(tmp_code);
						ADShowArr[tmp_code] = true
					}
				}
			}
			return result
		};
		var ADShow = function(param) {
			var ADList = new Array(), ADShowCodeArr = "", ADShowCodeStr = "";
			if (typeof param == "object") {
				if (param.href !== null && param.href !== undefined) {
					ADList.push(param.href)
				}
			} else {
				if (typeof param == "string") {
					if (param.indexOf("|") != -1) {
						ADList = param.split("|")
					} else {
						ADList.push(param)
					}
				}
			}
			if (ADList.length > 0) {
				ADShowCodeArr = GetADShowCodeList(ADList);
				if (ADShowCodeArr.length > 0) {
					ADShowCodeStr = ADShowCodeArr.join("|");
					SendClick({
						"e_c" : ADShowCodeStr,
						"c_t" : 101
					}, function() {
					})
				}
			}
		};
		var ADClick = function(param) {
			var tmp_code, click_url;
			if (typeof param == "object") {
				if (param.href !== null && param.href !== undefined) {
					click_url = param.href
				}
			} else {
				if (typeof param == "string") {
					click_url = param
				}
			}
			tmp_code = GetECode(click_url);
			if (tmp_code != null && tmp_code != undefined) {
				click_url = fnn.getEasUrl(click_url);
				SendClick({
					"e_c" : tmp_code,
					"c_d" : click_url,
					"c_t" : 102
				}, function() {
				})
			}
		};
		var VShow = function(param, _callback) {
			var _UrlParam = "", click_url = "";
			if (typeof param == "object") {
				if (typeof param.VUrl == "object") {
					if (param.VUrl.href !== null
							&& param.VUrl.href !== undefined) {
						param.Url = param.VUrl.href
					}
				} else {
					if (typeof param.VUrl == "string") {
						param.Url = param.VUrl
					} else {
						if (param.VUrl == null || param.VUrl == undefined) {
							param.Url = UrlHref
						}
					}
				}
				param.VUrl = null;
				if (param.e_code == null || param.e_code == undefined) {
					if (param.VType == "click") {
						param.e_code = GetECode(param.Url)
					} else {
						if (param.VType == "play") {
							param.e_code = GetECode(UrlHref)
						}
					}
				}
				if (param.Vid == null || param.Vid == undefined) {
					if (param.VType == "click") {
						param.Vid = fnn.getUrlVar(param.Url, "id")
					} else {
						if (param.VType == "play") {
							param.Vid = fnn.getUrlVar(UrlHref, "id")
						}
					}
				}
				if (param.Url) {
					param.Url = fnn.getEasUrl(param.Url)
				}
				if (param.VType == "click") {
					param.ReferrerUrl = encodeURIComponent(LogUrl);
					param.click_type = 202
				} else {
					if (param.VType == "play") {
						param.ReferrerUrl = encodeURIComponent(fnn
								.getEasUrl(ReferrerUrl));
						param.click_type = 203
					}
				}
				param.VType = null;
				for ( var i in param) {
					if (param[i] != null && param[i] != undefined) {
						_UrlParam += i + "=" + param[i] + "&"
					}
				}
				_UrlParam += "m=SendLog"
			} else {
				return false
			}
			if (_UrlParam != null && _UrlParam != undefined) {
				if (typeof (_callback) === "function") {
					SendLog(LogCgi, _UrlParam, function() {
						_callback()
					})
				} else {
					SendLog(LogCgi, _UrlParam)
				}
			}
		};
		var GShow = function(param, _callback) {
			var _UrlParam = "", click_url = "";
			if (typeof param == "object") {
				if (typeof param.gameid == null || param.gameid == undefined) {
					return false
				}
				param.Url = LogUrl;
				param.ReferrerUrl = encodeURIComponent(fnn
						.getEasUrl(ReferrerUrl));
				param.click_type = 301;
				for ( var i in param) {
					if (param[i] != null && param[i] != undefined) {
						_UrlParam += i + "=" + param[i] + "&"
					}
				}
				_UrlParam += "m=SendLog"
			} else {
				return false
			}
			if (_UrlParam != null && _UrlParam != undefined) {
				if (typeof (_callback) === "function") {
					SendLog(LogCgi, _UrlParam, function() {
						_callback()
					})
				} else {
					SendLog(LogCgi, _UrlParam)
				}
			}
		};
		var EASCookie = function(name, value, options) {
			if (typeof value != "undefined") {
				options = options || {};
				if (value === null) {
					value = "";
					options.expires = -1
				}
				var expires = "";
				if (options.expires
						&& (typeof options.expires == "number" || options.expires.toUTCString)) {
					var date;
					if (typeof options.expires == "number") {
						date = new Date();
						date.setTime(date.getTime()
								+ (options.expires * 60 * 1000))
					} else {
						date = options.expires
					}
					expires = "; expires=" + date.toUTCString()
				}
				var path = options.path ? "; path=" + options.path : "";
				var domain = options.domain ? "; domain=" + options.domain : "";
				var secure = options.secure ? "; secure" : "";
				document.cookie = [ name, "=", encodeURIComponent(value),
						expires, path, domain, secure ].join("")
			} else {
				var cookieValue = null;
				if (document.cookie && document.cookie != "") {
					var cookies = document.cookie.split(";");
					for (var i = 0; i < cookies.length; i++) {
						var cookie = fnn.trim(cookies[i]);
						if (cookie.substring(0, name.length + 1) == (name + "=")) {
							cookieValue = decodeURIComponent(cookie
									.substring(name.length + 1));
							break
						}
					}
				}
				return cookieValue
			}
		};
		var GODMLogin = function(redirect_url) {
			window.location.href = GODMkUrl + "&redirect_url=" + redirect_url
		};
		var GODMInit = function(param) {
			if (typeof param == "object") {
				if (param.user != null && param.user != undefined) {
					GODM_user = param.user
				}
				if (param.serviceType != null && param.serviceType != undefined) {
					GODM_serviceType = param.serviceType
				}
				if (param.sysName != null && param.sysName != undefined) {
					GODM_sysName = param.sysName
				}
			}
			var param = "m=SendLog&click_type=501&e_code=" + e_code
					+ "&GODM_user=" + GODM_user + "&GODM_serviceType="
					+ GODM_serviceType + "&GODM_sysName=" + GODM_sysName
					+ "&Url=" + encodeURIComponent(LogUrl) + "&ReferrerUrl="
					+ encodeURIComponent(ReferrerUrl);
			SendLog(LogCgi, param, function() {
			})
		};
		var GODMClick = function(param) {
			if (typeof param == "object") {
				if (param.adtag != null && param.adtag != undefined) {
					GODM_adtag = param.adtag
				} else {
					return false
				}
			} else {
				return false
			}
			var param = "m=SendLog&click_type=502&GODM_adtag=" + GODM_adtag
					+ "&e_code=" + e_code + "&GODM_user=" + GODM_user
					+ "&GODM_serviceType=" + GODM_serviceType
					+ "&GODM_sysName=" + GODM_sysName + "&Url="
					+ encodeURIComponent(LogUrl) + "&ReferrerUrl="
					+ encodeURIComponent(ReferrerUrl);
			SendLog(LogCgi, param, function() {
			})
		};
		var SysInit = function(param) {
			if (typeof param == "object") {
				if (param.userId != null && param.userId != undefined) {
					Sys_userId = param.userId
				}
				if (param.openId != null && param.openId != undefined) {
					Sys_openId = param.openId
				}
				if (param.channel != null && param.channel != undefined) {
					Sys_channel = param.channel
				}
				if (param.serviceType != null && param.serviceType != undefined) {
					Sys_serviceType = param.serviceType
				}
				if (param.sysName != null && param.sysName != undefined) {
					Sys_sysName = param.sysName
				}
			}
			var param = "m=SendLog&click_type=503&e_code=" + e_code
					+ "&Sys_userId=" + Sys_userId + "&Sys_openId=" + Sys_openId
					+ "&Sys_channel=" + Sys_channel + "&Sys_serviceType="
					+ Sys_serviceType + "&Sys_sysName=" + Sys_sysName + "&Url="
					+ encodeURIComponent(LogUrl) + "&ReferrerUrl="
					+ encodeURIComponent(ReferrerUrl);
			SendLog(LogCgi, param, function() {
			})
		};
		var SysClick = function(param) {
			if (typeof param == "object") {
				if (param.adtag != null && param.adtag != undefined) {
					Sys_adtag = param.adtag
				} else {
					return false
				}
			} else {
				return false
			}
			var param = "m=SendLog&click_type=504&Sys_adtag=" + Sys_adtag
					+ "&e_code=" + e_code + "&Sys_userId=" + Sys_userId
					+ "&Sys_openId=" + Sys_openId + "&Sys_channel="
					+ Sys_channel + "&Sys_serviceType=" + Sys_serviceType
					+ "&Sys_sysName=" + Sys_sysName + "&Url="
					+ encodeURIComponent(LogUrl) + "&ReferrerUrl="
					+ encodeURIComponent(ReferrerUrl);
			SendLog(LogCgi, param, function() {
			})
		};
		var DJClick = function(DJActId) {
			if (!DJActId) {
				return false
			}
			var param = "click_type=98&e_code=" + e_code + "&o2_mid=" + o2_mid
					+ "&DJActId=" + DJActId + "&Url="
					+ encodeURIComponent(LogUrl) + "&ReferrerUrl="
					+ encodeURIComponent(ReferrerUrl);
			SendLog(LogCgiGo, param, function() {
			})
		};
		var TimeLine = function() {
			EAS.addEvent(window, "beforeunload", function() {
				var EndTime = new Date().getTime();
				var param = "m=SendLog&click_type=601&e_code=" + e_code
						+ "&StartTime=" + StartTime + "&EndTime=" + EndTime
						+ "&Url=" + encodeURIComponent(LogUrl)
						+ "&ReferrerUrl=" + encodeURIComponent(ReferrerUrl);
				Close = true;
				SendLog(LogCgi, param, function() {
				});
				if (adtagArr.length > 0 && UrlHost == "x5.qq.com") {
					SendClick({
						"e_c" : "close",
						"c_t" : 4
					}, function() {
					})
				}
			})
		};
		var needjs = function(name, callback) {
			if (eval("EAS." + name) == undefined) {
				fnn.loadjs(http_type + "//ossweb-img.qq.com/images/js/eas/"
						+ name + ".js", function() {
					callback()
				})
			} else {
				if (typeof (eval("EAS." + name)) == "function"
						|| typeof (eval("EAS." + name)) == "object") {
					callback()
				}
			}
		};
		GetTrackCode();
		return {
			Init : Init,
			ADTAGPop : ADTAGPop,
			getUrlVar : fnn.getUrlVar,
			SendClick : SendClick,
			GetECode : GetECode,
			e_code : e_code,
			g_code : g_code,
			addEvent : addEvent,
			loadjs : fnn.loadjs,
			getEasUrl : fnn.getEasUrl,
			trimStr : fnn.trimStr,
			urlEncode : fnn.urlEncode,
			Cookie : EASCookie,
			ADShow : ADShow,
			ADClick : ADClick,
			VShow : VShow,
			GShow : GShow,
			GODMLogin : GODMLogin,
			GODMInit : GODMInit,
			GODMClick : GODMClick,
			SysInit : SysInit,
			SysClick : SysClick,
			DJClick : DJClick,
			TimeLine : TimeLine,
			need : needjs,
			LogUrl : LogUrl,
			ReferrerUrl : ReferrerUrl,
			SendLog : SendLog,
			LogCgi : LogCgi,
			LogCgiGo : LogCgiGo,
			StartTime : StartTime,
			browser : browser
		}
	})();
	EAS.Init();
	if (window.location.host == "lol.qq.com"
			|| window.location.host == "lpl.qq.com") {
		if (!EAS.browser.versions.android && !EAS.browser.versions.ios) {
			EAS.loadjs(
					"//ossweb-img.qq.com/images/clientpop/js/rtpush/main3.js",
					function() {
					})
		}
	}
	if (window.location.host == "x5.qq.com") {
		EAS.TimeLine()
	}
};/* |xGv00|0f9c3518c514daaabb1035af22e1ff61 */