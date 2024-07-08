var HwpCtrlApp = {};
var LayoutView = {};
var ImageLoader = {};
var TestApi = {};

var WebHwpCtrlDefine = {
    "editorUIName" : {
        //ID
        "frameID" : "hwpctrl_frame",
    }
};

var storageType = 0;

HwpCtrlApp["Initialize"] = function (id, baseurl, callback, storage) {
    this._initOffice(id, baseurl, callback);
    var contentWindow = document.getElementById(WebHwpCtrlDefine.editorUIName.frameID).contentWindow;
    if (contentWindow) {
        contentWindow.addEventListener("resize", function (event) {
            var frame = document.getElementById(WebHwpCtrlDefine.editorUIName.frameID);
            if (frame) {
                frame.addEventListener("DOMContentLoaded", function (event) {
                    HwpCtrlApp.UpdateLayout();
                });
            }
        });
    }

    this.storageType = storage;
};

HwpCtrlApp["UpdateLayout"] = function () {
    // HwpCtrlApp.layoutView.resize();
    if (HwpCtrlApp.hwpApp != null) {
        HwpCtrlApp.hwpApp.UpdateView();
        HwpCtrlApp.hwpApp.ResizeView();
    }
};

HwpCtrlApp["_initOffice"] = function(id, baseurl, callback) {
    LayoutView.initialize(id, baseurl, callback);
};

//Layout View 생성
LayoutView["initialize"] = function(id, baseurl, callback) {

    if (baseurl == null || baseurl =="") {
        baseurl = location.href;
    }

    var uri = parseURL(location.href);
    var skin = "default";
    if (uri.queryKey.skin) {
        skin = uri.queryKey.skin;
    }
    var hwpctrlNode = document.getElementById(id);
    var iframe = document.createElement("iframe");
    var parentUrl = getBaseUrl(location.href);
    var frameUrl = parentUrl + "hwpctrlmain.html";
    if (uri.queryKey.noframe) {
        frameUrl = parentUrl + "hwpctrlmain_noframe.html";
    }
    if (uri.queryKey.frameurl) {
        frameUrl = decodeURIComponent(uri.queryKey.frameurl);
    }

    iframe.setAttribute("id", WebHwpCtrlDefine.editorUIName.frameID);
    iframe.setAttribute("src", frameUrl + "?baseurl=" + encodeURIComponent(baseurl) + "&skin=" + skin);
    iframe.setAttribute("marginwidth", "0");
    iframe.setAttribute("marginheight", "0");
    iframe.setAttribute("hspace", "0");
    iframe.setAttribute("vspace", "0");
    iframe.setAttribute("frameborder", "0");
    iframe.setAttribute("scrolling", "no");
    iframe.setAttribute("style", "width:"+hwpctrlNode.offsetWidth+"px; height:"+hwpctrlNode.offsetHeight+"px;");

    iframe.onload = function() {
		var iFrame = document.getElementById(WebHwpCtrlDefine.editorUIName.frameID);
        var contentWindow = iFrame.contentWindow;

        contentWindow.callbackFn = function() {
            HwpCtrlApp.hwpApp = contentWindow.HwpApp;
            HwpCtrlApp.hwpCtrlImpl = contentWindow.HwpCtrlImpl;
            HwpCtrlApp.hwpCtrlIntf.Impl = HwpCtrlApp.hwpCtrlImpl;

            HwpCtrlApp.hwpCtrlImpl.setStorage(HwpCtrlApp.storageType);

            callback();
        };
    };

    hwpctrlNode.appendChild(iframe);
};
