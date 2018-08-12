/*! modernizr 3.4.0 (Custom Build) | MIT *
 * https://modernizr.com/download/?-apng-audio-backgroundsize-bgsizecover-boxsizing-canvas-cookies-cssanimations-cssgradients-cssmask-csstransforms-csstransforms3d-csstransitions-customevent-flexbox-fontface-fullscreen-hashchange-history-ie8compat-preserve3d-svg-touchevents-video-webgl-willchange-addtest-hasevent-setclasses-testprop-teststyles !*/
!function(e,t,n){function o(e,t){return typeof e===t}function r(){var e,t,n,r,i,s,a;for(var c in x)if(x.hasOwnProperty(c)){if(e=[],t=x[c],t.name&&(e.push(t.name.toLowerCase()),t.options&&t.options.aliases&&t.options.aliases.length))for(n=0;n<t.options.aliases.length;n++)e.push(t.options.aliases[n].toLowerCase());for(r=o(t.fn,"function")?t.fn():t.fn,i=0;i<e.length;i++)s=e[i],a=s.split("."),1===a.length?Modernizr[a[0]]=r:(!Modernizr[a[0]]||Modernizr[a[0]]instanceof Boolean||(Modernizr[a[0]]=new Boolean(Modernizr[a[0]])),Modernizr[a[0]][a[1]]=r),b.push((r?"":"no-")+a.join("-"))}}function i(e){var t=C.className,n=Modernizr._config.classPrefix||"";if(S&&(t=t.baseVal),Modernizr._config.enableJSClass){var o=new RegExp("(^|\\s)"+n+"no-js(\\s|$)");t=t.replace(o,"$1"+n+"js$2")}Modernizr._config.enableClasses&&(t+=" "+n+e.join(" "+n),S?C.className.baseVal=t:C.className=t)}function s(e,t){if("object"==typeof e)for(var n in e)w(e,n)&&s(n,e[n]);else{e=e.toLowerCase();var o=e.split("."),r=Modernizr[o[0]];if(2==o.length&&(r=r[o[1]]),"undefined"!=typeof r)return Modernizr;t="function"==typeof t?t():t,1==o.length?Modernizr[o[0]]=t:(!Modernizr[o[0]]||Modernizr[o[0]]instanceof Boolean||(Modernizr[o[0]]=new Boolean(Modernizr[o[0]])),Modernizr[o[0]][o[1]]=t),i([(t&&0!=t?"":"no-")+o.join("-")]),Modernizr._trigger(e,t)}return Modernizr}function a(){return"function"!=typeof t.createElement?t.createElement(arguments[0]):S?t.createElementNS.call(t,"http://www.w3.org/2000/svg",arguments[0]):t.createElement.apply(t,arguments)}function c(e,t){return!!~(""+e).indexOf(t)}function d(){var e=t.body;return e||(e=a(S?"svg":"body"),e.fake=!0),e}function u(e,n,o,r){var i,s,c,u,l="modernizr",f=a("div"),p=d();if(parseInt(o,10))for(;o--;)c=a("div"),c.id=r?r[o]:l+(o+1),f.appendChild(c);return i=a("style"),i.type="text/css",i.id="s"+l,(p.fake?p:f).appendChild(i),p.appendChild(f),i.styleSheet?i.styleSheet.cssText=e:i.appendChild(t.createTextNode(e)),f.id=l,p.fake&&(p.style.background="",p.style.overflow="hidden",u=C.style.overflow,C.style.overflow="hidden",C.appendChild(p)),s=n(f,e),p.fake?(p.parentNode.removeChild(p),C.style.overflow=u,C.offsetHeight):f.parentNode.removeChild(f),!!s}function l(e){return e.replace(/([A-Z])/g,function(e,t){return"-"+t.toLowerCase()}).replace(/^ms-/,"-ms-")}function f(t,n,o){var r;if("getComputedStyle"in e){r=getComputedStyle.call(e,t,n);var i=e.console;if(null!==r)o&&(r=r.getPropertyValue(o));else if(i){var s=i.error?"error":"log";i[s].call(i,"getComputedStyle returning null, its possible modernizr test results are inaccurate")}}else r=!n&&t.currentStyle&&t.currentStyle[o];return r}function p(t,o){var r=t.length;if("CSS"in e&&"supports"in e.CSS){for(;r--;)if(e.CSS.supports(l(t[r]),o))return!0;return!1}if("CSSSupportsRule"in e){for(var i=[];r--;)i.push("("+l(t[r])+":"+o+")");return i=i.join(" or "),u("@supports ("+i+") { #modernizr { position: absolute; } }",function(e){return"absolute"==f(e,null,"position")})}return n}function g(e){return e.replace(/([a-z])-([a-z])/g,function(e,t,n){return t+n.toUpperCase()}).replace(/^-/,"")}function m(e,t,r,i){function s(){u&&(delete E.style,delete E.modElem)}if(i=o(i,"undefined")?!1:i,!o(r,"undefined")){var d=p(e,r);if(!o(d,"undefined"))return d}for(var u,l,f,m,v,h=["modernizr","tspan","samp"];!E.style&&h.length;)u=!0,E.modElem=a(h.shift()),E.style=E.modElem.style;for(f=e.length,l=0;f>l;l++)if(m=e[l],v=E.style[m],c(m,"-")&&(m=g(m)),E.style[m]!==n){if(i||o(r,"undefined"))return s(),"pfx"==t?m:!0;try{E.style[m]=r}catch(A){}if(E.style[m]!=v)return s(),"pfx"==t?m:!0}return s(),!1}function v(e,t){return function(){return e.apply(t,arguments)}}function h(e,t,n){var r;for(var i in e)if(e[i]in t)return n===!1?e[i]:(r=t[e[i]],o(r,"function")?v(r,n||t):r);return!1}function A(e,t,n,r,i){var s=e.charAt(0).toUpperCase()+e.slice(1),a=(e+" "+R.join(s+" ")+s).split(" ");return o(t,"string")||o(t,"undefined")?m(a,t,r,i):(a=(e+" "+O.join(s+" ")+s).split(" "),h(a,t,n))}function y(e,t,o){return A(e,n,n,t,o)}var x=[],T={_version:"3.4.0",_config:{classPrefix:"",enableClasses:!0,enableJSClass:!0,usePrefixes:!0},_q:[],on:function(e,t){var n=this;setTimeout(function(){t(n[e])},0)},addTest:function(e,t,n){x.push({name:e,fn:t,options:n})},addAsyncTest:function(e){x.push({name:null,fn:e})}},Modernizr=function(){};Modernizr.prototype=T,Modernizr=new Modernizr;var w,b=[],C=t.documentElement,S="svg"===C.nodeName.toLowerCase();!function(){var e={}.hasOwnProperty;w=o(e,"undefined")||o(e.call,"undefined")?function(e,t){return t in e&&o(e.constructor.prototype[t],"undefined")}:function(t,n){return e.call(t,n)}}(),T._l={},T.on=function(e,t){this._l[e]||(this._l[e]=[]),this._l[e].push(t),Modernizr.hasOwnProperty(e)&&setTimeout(function(){Modernizr._trigger(e,Modernizr[e])},0)},T._trigger=function(e,t){if(this._l[e]){var n=this._l[e];setTimeout(function(){var e,o;for(e=0;e<n.length;e++)(o=n[e])(t)},0),delete this._l[e]}},Modernizr._q.push(function(){T.addTest=s});var _=function(){function e(e,t){var r;return e?(t&&"string"!=typeof t||(t=a(t||"div")),e="on"+e,r=e in t,!r&&o&&(t.setAttribute||(t=a("div")),t.setAttribute(e,""),r="function"==typeof t[e],t[e]!==n&&(t[e]=n),t.removeAttribute(e)),r):!1}var o=!("onblur"in t.documentElement);return e}();T.hasEvent=_;var P={elem:a("modernizr")};Modernizr._q.push(function(){delete P.elem});var E={style:P.elem.style};Modernizr._q.unshift(function(){delete E.style});var k=(T.testProp=function(e,t,o){return m([e],n,t,o)},T.testStyles=u),z=T._config.usePrefixes?" -webkit- -moz- -o- -ms- ".split(" "):["",""];T._prefixes=z,Modernizr.addTest("touchevents",function(){var n;if("ontouchstart"in e||e.DocumentTouch&&t instanceof DocumentTouch)n=!0;else{var o=["@media (",z.join("touch-enabled),("),"heartz",")","{#modernizr{top:9px;position:absolute}}"].join("");k(o,function(e){n=9===e.offsetTop})}return n}),Modernizr.addTest("audio",function(){var e=a("audio"),t=!1;try{t=!!e.canPlayType,t&&(t=new Boolean(t),t.ogg=e.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/,""),t.mp3=e.canPlayType('audio/mpeg; codecs="mp3"').replace(/^no$/,""),t.opus=e.canPlayType('audio/ogg; codecs="opus"')||e.canPlayType('audio/webm; codecs="opus"').replace(/^no$/,""),t.wav=e.canPlayType('audio/wav; codecs="1"').replace(/^no$/,""),t.m4a=(e.canPlayType("audio/x-m4a;")||e.canPlayType("audio/aac;")).replace(/^no$/,""))}catch(n){}return t}),Modernizr.addTest("canvas",function(){var e=a("canvas");return!(!e.getContext||!e.getContext("2d"))}),Modernizr.addTest("cookies",function(){try{t.cookie="cookietest=1";var e=-1!=t.cookie.indexOf("cookietest=");return t.cookie="cookietest=1; expires=Thu, 01-Jan-1970 00:00:01 GMT",e}catch(n){return!1}});var B="Moz O ms Webkit",R=T._config.usePrefixes?B.split(" "):[];T._cssomPrefixes=R;var O=T._config.usePrefixes?B.toLowerCase().split(" "):[];T._domPrefixes=O,T.testAllProps=A,T.testAllProps=y,Modernizr.addTest("cssanimations",y("animationName","a",!0)),Modernizr.addTest("backgroundsize",y("backgroundSize","100%",!0)),Modernizr.addTest("bgsizecover",y("backgroundSize","cover")),Modernizr.addTest("boxsizing",y("boxSizing","border-box",!0)&&(t.documentMode===n||t.documentMode>7)),Modernizr.addTest("flexbox",y("flexBasis","1px",!0)),Modernizr.addTest("cssgradients",function(){for(var e,t="background-image:",n="gradient(linear,left top,right bottom,from(#9f9),to(white));",o="",r=0,i=z.length-1;i>r;r++)e=0===r?"to ":"",o+=t+z[r]+"linear-gradient("+e+"left top, #9f9, white);";Modernizr._config.usePrefixes&&(o+=t+"-webkit-"+n);var s=a("a"),c=s.style;return c.cssText=o,(""+c.backgroundImage).indexOf("gradient")>-1});var N=function(){var e=navigator.userAgent,t=e.match(/w(eb)?osbrowser/gi),n=e.match(/windows phone/gi)&&e.match(/iemobile\/([0-9])+/gi)&&parseFloat(RegExp.$1)>=9;return t||n}();N?Modernizr.addTest("fontface",!1):k('@font-face {font-family:"font";src:url("https://")}',function(e,n){var o=t.getElementById("smodernizr"),r=o.sheet||o.styleSheet,i=r?r.cssRules&&r.cssRules[0]?r.cssRules[0].cssText:r.cssText||"":"",s=/src/i.test(i)&&0===i.indexOf(n.split(" ")[0]);Modernizr.addTest("fontface",s)}),Modernizr.addTest("cssmask",y("maskRepeat","repeat-x",!0)),Modernizr.addTest("csstransforms",function(){return-1===navigator.userAgent.indexOf("Android 2.")&&y("transform","scale(1)",!0)});var j="CSS"in e&&"supports"in e.CSS,$="supportsCSS"in e;Modernizr.addTest("supports",j||$),Modernizr.addTest("csstransforms3d",function(){var e=!!y("perspective","1px",!0),t=Modernizr._config.usePrefixes;if(e&&(!t||"webkitPerspective"in C.style)){var n,o="#modernizr{width:0;height:0}";Modernizr.supports?n="@supports (perspective: 1px)":(n="@media (transform-3d)",t&&(n+=",(-webkit-transform-3d)")),n+="{#modernizr{width:7px;height:18px;margin:0;padding:0;border:0}}",k(o+n,function(t){e=7===t.offsetWidth&&18===t.offsetHeight})}return e}),Modernizr.addTest("preserve3d",function(){var t,n,o=e.CSS,r=!1;return o&&o.supports&&o.supports("(transform-style: preserve-3d)")?!0:(t=a("a"),n=a("a"),t.style.cssText="display: block; transform-style: preserve-3d; transform-origin: right; transform: rotateY(40deg);",n.style.cssText="display: block; width: 9px; height: 1px; background: #000; transform-origin: right; transform: rotateY(40deg);",t.appendChild(n),C.appendChild(t),r=n.getBoundingClientRect(),C.removeChild(t),r=r.width&&r.width<4)}),Modernizr.addTest("csstransitions",y("transition","all",!0)),Modernizr.addTest("willchange","willChange"in C.style),Modernizr.addTest("customevent","CustomEvent"in e&&"function"==typeof e.CustomEvent);var M=function(t){var o,r=z.length,i=e.CSSRule;if("undefined"==typeof i)return n;if(!t)return!1;if(t=t.replace(/^@/,""),o=t.replace(/-/g,"_").toUpperCase()+"_RULE",o in i)return"@"+t;for(var s=0;r>s;s++){var a=z[s],c=a.toUpperCase()+"_"+o;if(c in i)return"@-"+a.toLowerCase()+"-"+t}return!1};T.atRule=M;var L=T.prefixed=function(e,t,n){return 0===e.indexOf("@")?M(e):(-1!=e.indexOf("-")&&(e=g(e)),t?A(e,t,n):A(e,"pfx"))};Modernizr.addTest("fullscreen",!(!L("exitFullscreen",t,!1)&&!L("cancelFullScreen",t,!1))),Modernizr.addTest("hashchange",function(){return _("hashchange",e)===!1?!1:t.documentMode===n||t.documentMode>7}),Modernizr.addTest("history",function(){var t=navigator.userAgent;return-1===t.indexOf("Android 2.")&&-1===t.indexOf("Android 4.0")||-1===t.indexOf("Mobile Safari")||-1!==t.indexOf("Chrome")||-1!==t.indexOf("Windows Phone")||"file:"===location.protocol?e.history&&"pushState"in e.history:!1}),Modernizr.addTest("ie8compat",!e.addEventListener&&!!t.documentMode&&7===t.documentMode),Modernizr.addAsyncTest(function(){if(!Modernizr.canvas)return!1;var e=new Image,t=a("canvas"),n=t.getContext("2d");e.onload=function(){s("apng",function(){return"undefined"==typeof t.getContext?!1:(n.drawImage(e,0,0),0===n.getImageData(0,0,1,1).data[3])})},e.src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAACGFjVEwAAAABAAAAAcMq2TYAAAANSURBVAiZY2BgYPgPAAEEAQB9ssjfAAAAGmZjVEwAAAAAAAAAAQAAAAEAAAAAAAAAAAD6A+gBAbNU+2sAAAARZmRBVAAAAAEImWNgYGBgAAAABQAB6MzFdgAAAABJRU5ErkJggg=="}),Modernizr.addTest("svg",!!t.createElementNS&&!!t.createElementNS("http://www.w3.org/2000/svg","svg").createSVGRect),Modernizr.addTest("video",function(){var e=a("video"),t=!1;try{t=!!e.canPlayType,t&&(t=new Boolean(t),t.ogg=e.canPlayType('video/ogg; codecs="theora"').replace(/^no$/,""),t.h264=e.canPlayType('video/mp4; codecs="avc1.42E01E"').replace(/^no$/,""),t.webm=e.canPlayType('video/webm; codecs="vp8, vorbis"').replace(/^no$/,""),t.vp9=e.canPlayType('video/webm; codecs="vp9"').replace(/^no$/,""),t.hls=e.canPlayType('application/x-mpegURL; codecs="avc1.42E01E"').replace(/^no$/,""))}catch(n){}return t}),Modernizr.addTest("webgl",function(){var t=a("canvas"),n="probablySupportsContext"in t?"probablySupportsContext":"supportsContext";return n in t?t[n]("webgl")||t[n]("experimental-webgl"):"WebGLRenderingContext"in e}),r(),i(b),delete T.addTest,delete T.addAsyncTest;for(var U=0;U<Modernizr._q.length;U++)Modernizr._q[U]();e.Modernizr=Modernizr}(window,document);