/**
 *	URL의 모든 정보를 파싱하여 반환
 *	@param {string=} url				 - 파싱할 URL(기본값 : location.href)
 *	@param {boolean=} isStrictMode	     - 엄격한 기준으로 파싱 여부(기본값 : loose)
 */
function parseURL(url, isStrictMode) {
    if (!url) {
        url = document.location.href;
    }

    // query 값에 @ 가 있을경우, 파싱에 문제가 생기므로, encode 문자로 치환해준다.
    url = url.replace(/@/g, "%40");

    var option = {
        strictMode: (isStrictMode === true),
        key: ["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],
        q:   {
            name:   "queryKey",
            parser: /(?:^|&)([^&=]*)=?([^&]*)/g
        },
        parser: {
            strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
            loose:  /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
        }
    };

    var	o   = option
        ,	m   = o.parser[o.strictMode ? "strict" : "loose"].exec(url)
        ,	uri = {}
        ,	i   = 14;

    while (i--) {
        uri[o.key[i]] = m[i] || "";
    }

    uri[o.q.name] = {};
    uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
        if ($0 && $1) {
            // query 값에 @ 문자 치환값이 있으면, decode 해서 복원해 준다.
            uri[o.q.name][$1] = $2.replace(/%40/g, "@");
        }
    });

    return uri;
}

function getBaseUrl(baseurl) {

    var url = parseURL(baseurl);

    var isEndsWith = function(str, suffix) {
		return (str.indexOf(suffix, str.length - suffix.length) !== -1);
	};

    var arr = url.path.split('/');
    var pathname = "";
    if (arr.length > 2) {
        for (i = 1; i < arr.length-1; i++) {
            if (arr[i]) {
                pathname += arr[i];
                pathname += '/';
            }
        }
    } else {
        if (!isEndsWith(url.path, '/')) {
            pathname = arr[0];
        } else {
            pathname = arr[1];
        }
    }

    var baseUrl = url.protocol + "://" + url.authority + "/" + pathname;
    if (!isEndsWith(baseUrl, '/')) {
        baseUrl += '/';
    }

    return baseUrl;
}

function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
}
