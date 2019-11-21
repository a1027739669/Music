this.Tracker=function(e){function t(n){if(r[n])return r[n].exports;var i=r[n]={i:n,l:!1,exports:{}};return e[n].call(i.exports,i,i.exports,t),i.l=!0,i.exports}var r={};return t.m=e,t.c=r,t.d=function(e,t,r){},t.n=function(e){var r=e&&e.__esModule?function(){return e["default"]}:function(){return e};return t.d(r,"a",r),r},t.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},t.p="",t(t.s=1)}([function(e,t){function r(e){return"object"==typeof e&&null!==e}var n=function(e){return"[object Number]"===Object.prototype.toString.call(e)};t.isNumber=n,t.isNaN=function(e){return n(e)&&e!==+e},t.isArray=function(e){return Array.isArray?Array.isArray(e):-1!==Object.prototype.toString.call(e).toUpperCase().indexOf("ARRAY")},t.noop=function(e){return e||""},t.extend=function(e,t){for(var r in t)t.hasOwnProperty(r)&&(e[r]=t[r]);return e},t.shallowMerge=function(e,t,r){for(var n in t)t.hasOwnProperty(n)&&(r||e[n]===undefined)&&(e[n]=t[n])},t.getSpm=function(){var e="",r="",n=window.goldlog||{},i=n.spmAb||n.spm_ab;return i&&t.isArray(i)&&(e=i[0],i[1]&&(r=i[1])),{a:e,b:r}},t.unifyErrorMsg=function(e){return/^script error\.?$/i.test(e)?"Script error":e},t.getScreenSize=function(){return window.screen.width+"x"+window.screen.height},t.generateIdentifier=function(e){return[e.type,e.uid,e.page,e.msg||"",e.ajaxurl||""].join("_")},t.addEvent=function(e,t,r){e.addEventListener?e.addEventListener(t,r,!1):e.attachEvent("on"+t,function(){return r.call(e,window.event)})},t.isError=function(e){var t={}.toString.call(e);return r(e)&&"[object Error]"===t||"[object Exception]"===t||e instanceof Error}},function(e,t,r){function n(e){if(!(this instanceof n))return new n(e);e=e||{},!0===e.hotPatch&&this._hotPatch(),!1!==e.global&&"object"==typeof _.__trackerOptions&&o(e,_.__trackerOptions),this.global=null==e.global||!!e.global,this.pid=e.pid,this.sampleRate=e.sampleRate||1,this.uidResolver=e.uidResolver||s,this.userOptions=e,this.requiredFields=e.requiredFields||[],this.releaseResolver=e.releaseResolver||s,this.uaParser=e.uaParser||s,this.beforeLog=e.beforeLog||null,this.msgWhitelist=e.msgWhitelist||e.msgWhiteList||E,this.urlWhitelist=e.urlWhitelist||e.urlWhiteList||R,this.oncePerSession=e.oncePerSession===undefined||e.oncePerSession,this.consoleDisplay=e.consoleDisplay||!1,this.ignoreScriptError=e.ignoreScriptError||!1,this.ignoredQueries=e.ignoredQueries||[],this.global&&(_.__trackerOptions=e),this._inited=!1,this._tracked=[],this._logWaitingQueue=[],this._plugins=e.plugins||[],this._pos="0,0",this._trackMousePos()}var i=r(0),o=i.shallowMerge,s=i.noop,a=i.generateIdentifier,c=i.getScreenSize,l=i.addEvent,u=i.getSpm,h=i.isError,p=r(2),f=r(3),g=i.unifyErrorMsg,d=!1;try{d="[object process]"===global.process.toString()}catch(O){}var _={};d||(_="undefined"!=typeof window?window:"undefined"!=typeof self?self:{});var v=_.document,m=_.navigator,y=!1,b=_.Tracker,w={JS_ERROR:1},E=null,R=null,S=+new Date,k=_.onerror;n.noConflict=function(){return _.Tracker===n&&(_.Tracker=b),n},n.prototype={VERSION:"https://g.alicdn.com/dt/tracker/3.4.11/3.4.11",log:function(e,t){"object"==typeof e?t=e:"string"==typeof e&&(t=t||{},o(t,{code:1,msg:e})),this._log(t)},captureMessage:function(e,t){return this.log(e,t)},logError:function(e,t){if(!h(e))return this.log(e,t);if(t=t||{},t.c1||t.c2||t.c3)return void this.warn("使用 tracker.logError() 时不可再传入 c1,c2,c3 字段，请求未发送");var r={},n=f(e);r.msg=e.toString(),r.c1=n[0],r.c2=n[1],r.c3=n[2],o(r,t),this._log(r)},captureException:function(e,t){return this.logError(e,t)},logReq:function(){this.warn("logReq() 方法已经废弃，若有需要，请使用自定义打点方式( `tracker.log()` )监控接口错误。")},logPerf:function(){this.warn("logPerf() 方法已经废弃，若有需要，请使用自定义打点方式( `tracker.log()` )监控接口错误。")},config:function(e,t){return"string"==typeof e?(t=t||{},t.pid=e):t=e,o(this,t,!0),o(this.userOptions,t,!0),"object"==typeof _.__trackerOptions&&o(_.__trackerOptions,t,!0),this._checkRequiredFields()&&this._popWaitingQueue(),this},onGlobalError:function(){if(!v)return this;var e=this;if(this.pid&&!this._inited){if(_.onerror=function(t,r,n,i,o){e._handleError(t,r,n,i,o)},this._plugins.length)for(;this._plugins.length>0;){var t=this._plugins.pop(),r=t[0],n=t[1];r.apply(this,[this].concat(n))}this._inited=!0}return this},install:function(){return this.onGlobalError()},offGlobalError:function(){return v?(_.onerror=k,this._inited=!1,this._plugins=[],this._tracked=[],this):this},uninstall:function(){return this.offGlobalError()},addPlugin:function(e){if(!v)return this;var t=[].slice.call(arguments,1);return"function"==typeof e&&this._inited?e.apply(this,[this].concat(t)):this._plugins.push([e,t]),this},_handleError:function(e,t,r,n,i){if(k)try{k.call(this,e,t,r,n,i)}catch(a){}t=t||"-",r=r||"-",n=n||"-",e=g(e);var o={msg:e,code:w.JS_ERROR};if(!this.ignoreScriptError||"Script error"!==e){if(null!=i&&(1===this.sampleRate||Math.random()<.1)){var s=f(i);o.c1=s[0],o.c2=s[1],o.c3=s[2]}this._log(o)}},_handleMouseDown:function(e){var t=v&&v.documentElement,r=Math.round(e.pageY||e.clientY+v.body.scrollTop+t.scrollTop),n=Math.round(e.pageX||e.clientX+v.body.scrollLeft+t.scrollLeft);n-=Math.max(t.clientWidth,t.offsetWidth,t.scrollWidth)/2,this._pos=String(n)+","+String(r)},_trackMousePos:function(){var e=this;v&&v.documentElement&&l(v,"mousedown",function(t){e._handleMouseDown(t)})},_postData:function(e){var t="file:"===_.location.protocol?"http://gm.mmstat.com/"+(e.base||"fsp.1.1"):"//gm.mmstat.com/"+(e.base||"fsp.1.1"),r=p.stringify(e,["code","base","sampleRate","oncePerSession"]);(new Image).src=t+"?"+r},_log:function(e){if(!v)return this;if(e=e||{},e.type||e.code||(e.type=1),!e.type&&e.code&&(e.type=e.code),!(e.type===w.JS_ERROR&&Math.random()>(e.sampleRate||this.sampleRate)||null!=e.sampleRate&&Math.random()>e.sampleRate)){if(e=this._enhanceOpitons(e),!e.pid)return void this.warn("未配置 pid，请求未发送");for(var t=a(e),r=!1,n=0;n<this._tracked.length;n++)if(this._tracked[n]===t){r=!0;break}if(!((null==e.oncePerSession?this.oncePerSession:e.oncePerSession)&&r||this.msgWhitelist&&null!==this.msgWhitelist.exec(e.msg)||this.urlWhitelist&&null!==this.urlWhitelist.exec(e.page))){if("function"==typeof this.beforeLog){var i;try{i=this.beforeLog(e)}catch(O){}if(!1===i)return;"object"==typeof i&&(e=i)}if(this._tracked.push(t),this.consoleDisplay&&"object"==typeof _&&_.console&&"function"==typeof _.console.log&&_.console.log("[Tracker] %s",e.msg),!this._checkRequiredFields())return void this._pushWaitingQueue(e);this._postData(e)}}},_checkRequiredFields:function(){for(var e=0;e<this.requiredFields.length;e++){var t=this.requiredFields[e];if(this.userOptions[t]===undefined)return!1}return!0},_popWaitingQueue:function(){var e=this;if(this._logWaitingQueue&&this._logWaitingQueue.length)for(var t=0;t<this._logWaitingQueue.length;t++){var r=this._logWaitingQueue[t];o(r,e._enhanceOpitonsByUser(e.userOptions),!0),e._postData(r)}this._logWaitingQueue=[]},_pushWaitingQueue:function(e){this._logWaitingQueue.push(e)},_enhanceOpitonsByUser:function(e){return e.uid||(e.uid=this.uidResolver()),e.pid||(e.pid=this.pid),e.rel||(e.rel=this.releaseResolver()),e.ua||(e.ua=this.uaParser(m?m.userAgent:"")),e},_enhanceOpitons:function(e){e=this._enhanceOpitonsByUser(e),e.page||(e.page=_.location.href.split("?")[0]),e.query||(e.query=p.stringify(p.parse(window.location.search),e.ignoredQueries)),e.hash||(e.hash=window.location.hash),e.title||(e.title=v.title),e.spm_a||(e.spm_a=u().a),e.spm_b||(e.spm_b=u().b),e.scr||(e.scr=c()),e.raw_ua=m?m.userAgent:"",e.delay=parseFloat(((+new Date-S)/1e3).toFixed(2)),e.tracker_ver=this.VERSION,e.patch_ver=this.PATCH_VERSION||"-";var t=v.referrer.split("?"),r=t[0],n=2===t.length?p.stringify(p.parse(t[1]),e.ignoredQueries):"";return 2===t.length&&n.length>0?e.referrer=r+"?"+n:e.referrer=r,e.last_pos=this._pos,e},warn:function(e){"object"==typeof _&&_.console&&"function"==typeof _.console.warn&&_.console.warn("[Tracker] "+e)},_hotPatch:function(){if(_&&v){if(y&&_.__trackerPatch)return;y=!0;var e=Math.random();if(_.localStorage&&_.localStorage.getItem){var t=_.localStorage.getItem("__tracker_patch__"),r=+new Date;if(t&&r-parseInt(t,10)<432e5)e=t;else{e=r;try{_.localStorage.setItem("__tracker_patch__",r)}catch(O){}}}var n=v.createElement("script");n.src="//g.alicdn.com/fsp/tracker-patch/index.js?"+e,n.async=!0,n.crossOrigin=!0,n.id="tracker-patch",(v.head||v.body).appendChild(n);var i=this;_.__trackerPatch=function(){return i}}}},e.exports=n},function(e,t){function r(e){return"[object Array]"==={}.toString.call(e)}t.parse=function(e){var t={};if("string"!=typeof e)return t;if(e=(e||"").split("?")[1]||"",!(e=e.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,"").replace(/^(\?|#|&)/,"")))return t;for(var n=e.split("&"),i=0;i<n.length;++i){var o=n[i],s=o.replace(/\+/g," ").split("="),a=s.shift(),c=s.length>0?s.join("="):undefined;a=decodeURIComponent(a),c=c===undefined?null:decodeURIComponent(c),t[a]===undefined?t[a]=c:r(t[a])?t[a].push(c):t[a]=[t[a],c]}return t},t.stringify=function(e,t){if(!e)return"";t=t||[];var r=[];for(var n in e)e.hasOwnProperty(n)&&r.push(n);var i=[];r=r.sort();for(var o=0;o<r.length;++o){n=r[o];var s=e[n];if(null!=s){for(var a=!1,c=0;c<t.length;++c)if(t[c]===n){a=!0;break}a||i.push(encodeURIComponent(n)+"="+encodeURIComponent(s))}}return i.join("&")}},function(e,t){function r(e){for(var t=((e||{}).stack||"").split("\n"),r=["","",""],a={},c=0;c<t.length;c++){var l=i,u=(t[c]||"").match(l);if(null===u&&(l=o,u=(t[c]||"").match(l)),null===u&&(l=s,u=(t[c]||"").match(l)),null!==u){var h=u[1],p=a[h];p===undefined&&(a[h]="#"+c+"#",p=a[h]),t[c]=t[c].replace(h,p)}}if(t.length>0){t.shift();var f="";for(c=0;f.length+(t[c]||"").length<n&&c<t.length;)f+=t[c]+"\n",c++;r[1]=f;for(var g="";g.length+(t[c]||"").length<n&&c<t.length;)g+=t[c]+"\n",c++;r[2]=g}var d="";for(h in a)a.hasOwnProperty(h)&&(d+=h+"@"+a[h]+";");return d=d.replace(/;$/,""),r[0]=d,r}var n=500,i=/^\s*at .*? ?\(((?:file|https?|blob|chrome-extension|native|eval|<anonymous>).*?)(?::\d+)?(?::\d+)?\)?\s*$/i,o=/^\s*.*?(?:\(.*?\))?(?:^|@)((?:file|https?|blob|chrome|resource|\[native).*?)(?::\d+)?(?::\d+)?\s*$/i,s=/^\s*at (?:(?:\[object object\])?.+ )?\(?((?:file|ms-appx|https?|blob):.*?):\d+(?::\d+)?\)?\s*$/i;"object"==typeof process&&"test"===process.env.NODE_ENV&&(i=/([^\()]+\.spec\.js)/i),e.exports=r}]);this.performanceTrackerPlugin=function(e){function r(n){if(t[n])return t[n].exports;var i=t[n]={i:n,l:!1,exports:{}};return e[n].call(i.exports,i,i.exports,r),i.l=!0,i.exports}var t={};return r.m=e,r.c=t,r.d=function(e,r,t){},r.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return r.d(t,"a",t),t},r.o=function(e,r){return Object.prototype.hasOwnProperty.call(e,r)},r.p="",r(r.s=5)}({0:function(e,r){function t(e){return"object"==typeof e&&null!==e}var n=function(e){return"[object Number]"===Object.prototype.toString.call(e)};r.isNumber=n,r.isNaN=function(e){return n(e)&&e!==+e},r.isArray=function(e){return Array.isArray?Array.isArray(e):-1!==Object.prototype.toString.call(e).toUpperCase().indexOf("ARRAY")},r.noop=function(e){return e||""},r.extend=function(e,r){for(var t in r)r.hasOwnProperty(t)&&(e[t]=r[t]);return e},r.shallowMerge=function(e,r,t){for(var n in r)r.hasOwnProperty(n)&&(t||e[n]===undefined)&&(e[n]=r[n])},r.getSpm=function(){var e="",t="",n=window.goldlog||{},i=n.spmAb||n.spm_ab;return i&&r.isArray(i)&&(e=i[0],i[1]&&(t=i[1])),{a:e,b:t}},r.unifyErrorMsg=function(e){return/^script error\.?$/i.test(e)?"Script error":e},r.getScreenSize=function(){return window.screen.width+"x"+window.screen.height},r.generateIdentifier=function(e){return[e.type,e.uid,e.page,e.msg||"",e.ajaxurl||""].join("_")},r.addEvent=function(e,r,t){e.addEventListener?e.addEventListener(r,t,!1):e.attachEvent("on"+r,function(){return t.call(e,window.event)})},r.isError=function(e){var r={}.toString.call(e);return t(e)&&"[object Error]"===r||"[object Exception]"===r||e instanceof Error}},5:function(e,r,t){function n(e,r){var t=window.performance||window.webkitPerformance||window.msPerformance||window.mozPerformance;if(t&&t.timing){var n=t.setResourceTimingBufferSize||t.webkitSetResourceTimingBufferSize;n&&n.call(t,200);var s={sampleRate:.1,isCalEntry:!1,dirtyThreshold:6e4,scriptThreshold:250,cssThreshold:250,imgThreshold:500};r&&(r.scriptThreshold!==undefined&&i.isNumber(r.scriptThreshold)&&r.scriptThreshold<=s.scriptThreshold&&(r.scriptThreshold=s.scriptThreshold),r.cssThreshold!==undefined&&i.isNumber(r.cssThreshold)&&r.cssThreshold<=s.cssThreshold&&(r.cssThreshold=s.cssThreshold),r.imgThreshold!==undefined&&i.isNumber(r.imgThreshold)&&r.imgThreshold<=s.imgThreshold&&(r.imgThreshold=s.imgThreshold));var c=i.extend(s,r),d={scriptLog:function(){var r={code:3};return r.pid=e.pid,r.page=window.location.href.split("?")[0],r.sampleRate=c.sampleRate,r},scriptPageLog:function(){var e=this.scriptLog();this.needSend=!0;var r=t.timing,n=r.navigationStart,i=this.collectPerformanceTiming(r);for(var o in i)i.hasOwnProperty(o)&&(e[o]=i[o]);return e.firstPaintTime=this.collectFirstPaint(r,n),this.collectNetworkInformation()&&(e.effectiveType=this.collectNetworkInformation()),e},scriptEntryLog:function(){var e=this.scriptLog(),r=t.getEntriesByType("resource");return e.entry=JSON.stringify(this.collectEntries(r)),e},collectPerformanceTiming:function(e){var r={};r.loadTime=e.loadEventEnd-e.fetchStart,r.domReadyTime=e.domComplete-e.domInteractive,r.readyStart=e.fetchStart-e.navigationStart,r.redirectTime=e.redirectEnd-e.redirectStart,r.appcacheTime=e.domainLookupStart-e.fetchStart,r.unloadEventTime=e.unloadEventEnd-e.unloadEventStart,r.lookupDomainTime=e.domainLookupEnd-e.domainLookupStart,r.connectTime=e.connectEnd-e.connectStart,r.requestTime=e.responseEnd-e.requestStart,r.initDomTreeTime=e.domInteractive-e.responseEnd,r.loadEventTime=e.loadEventEnd-e.loadEventStart,r.tillDomLookupEndTime=e.domainLookupEnd-e.navigationStart,r.tillResponseEndTime=e.responseEnd-e.navigationStart,r.tillDomReadyTime=e.domInteractive-e.navigationStart,r.totalTime=e.loadEventEnd-e.navigationStart;for(var t in r)r.hasOwnProperty(t)&&(!i.isNumber(r[t])||i.isNaN(r[t])||r[t]<0?r[t]=-1:r[t]>=c.dirtyThreshold?r[t]=-2:r[t]=parseFloat(r[t].toFixed(2)));return r},collectFirstPaint:function(e,r){var t;if(window.chrome&&window.chrome.loadTimes?t=1e3*window.chrome.loadTimes().firstPaintTime:i.isNumber(e.msFirstPaint)&&(t=e.msFirstPaint),t===undefined||!i.isNumber(t)||i.isNaN(t))return-1;var n;return n=t>=r?parseFloat((t-r).toFixed(2)):-1,n>=c.dirtyThreshold&&(n=-2),n},collectNetworkInformation:function(){if(navigator.connection&&navigator.connection.effectiveType)return navigator.connection.effectiveType},collectEntries:function(e){for(var r,t={},n=0;n<e.length;n++)r=e[n].responseEnd-e[n].fetchStart,(0===e[n].decodedBodySize||!i.isNumber(r)||i.isNaN(r)||"script"===e[n].initiatorType&&r>=c.scriptThreshold||"css"===e[n].initiatorType&&r>=c.cssThreshold||"img"===e[n].initiatorType&&r>=c.imgThreshold)&&(t[e[n].name]={size:e[n].decodedBodySize,type:e[n].initiatorType,loadTime:r});return t},checkDirtyIndexes:function(e){var r=!0;for(var t in e)if(e.hasOwnProperty(t)&&-2===e[t]){r=!1;break}return r},getPagePerformance:function(){var r=this;try{var t=r.scriptPageLog();t.base=a,c.isCalEntry&&(t=i.extend(t,r.scriptEntryLog())),r.checkDirtyIndexes(t)&&e.log(t)}catch(n){e.logError(n,{pid:"fsp",code:12,c4:e.pid})}}},l=/iPad|iPod|iPhone/.test(navigator.userAgent),u=l?"pagehide":"beforeunload";o(window,u,function(){/loaded|complete/.test(document.readyState)&&d.getPagePerformance()})}}var i=t(0),o=i.addEvent,a="/fsp.1.3";e.exports=n}});