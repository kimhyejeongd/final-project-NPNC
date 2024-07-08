<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
        <!DOCTYPE html>
        <html>

        <%-- <head>
            <meta content="text/html; charset=UTF-8">
            <title></title>
            <link rel="stylesheet" href="${path}/resources/jh/css/docbar.css">
            <script type="text/javascript" src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
            <script type="text/javascript" src="${path}/resources/jh/js/webhwpctrl.js"></script>
            <script type="text/javascript" src="${path}/resources/jh/js/util.js"></script>
            <script type="text/javascript" src="${path}/resources/jh/js/hwpCtrlApp.js"></script>
            <style id="hcft_custom_color">
                .title_bar.on .title_panel.on .property_title {
                    background: #148fd0;
                    border-color: #1281bc;
                    color: #ffffff;
                }

                .title_bar .property_title:hover {
                    background: #e2eff4;
                    border-color: #91b8ca;
                    color: #0f6a9b;
                }

                .modal_dialog:before {
                    background: none;
                }

                .dialog_wrap {
                    display: none;
                }
            </style>
        </head> --%>
        <head>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/libs/jquery/jquery.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery_extend" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/commonFrame/js/utils/jquery-extend.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="text" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/libs/require/text.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="i18n" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/libs/require/i18n.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="download" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/libs/download/download.min.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="util" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/common/util.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="DefaultData" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/hwpctrlapp/frame/default.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="commonFrameJs/utils/util" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/commonFrame/js/utils/util.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="commonFrameJs/nls/global" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/commonFrame/js/nls/global.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="commonFrameJs/nls/shortcutMac" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/commonFrame/js/nls/shortcutMac.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="hwpctrlapp/utils/lang" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/hwpctrlapp/utils/lang.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="main-hwpapp" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/main-hwpapp.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="errorCode" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/common/errorCode.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="webhwpapp/hwpnls/ko/error" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/webhwpapp/hwpnls/ko/error.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="webhwpapp/hwpnls/ko/coreEngine" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/webhwpapp/hwpnls/ko/coreEngine.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="webhwpapp/hwpnls/ko/hwpGeneral" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/webhwpapp/hwpnls/ko/hwpGeneral.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="commonFrameJs/nls/general" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/commonFrame/js/nls/general.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="commonFrameJs/nls/root/general" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/commonFrame/js/nls/root/general.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="commonFrameJs/nls/ko/general" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/commonFrame/js/nls/ko/general.js?version=10.80.0.2507"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="extern/HncCustomFontInfos" src="https://webhwpctrl.cloud.hancom.com/webhwpctrl/js/webhwpapp/extern/HncCustomFontInfos.js?10.80.0.2507"></script><base href="https://webhwpctrl.cloud.hancom.com/webhwpctrl/" target="_blank">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <script type="text/javascript" data-type="css/app" data-framework="aori|lab" src="js/loadVersion.js"></script>
    <script type="text/javascript" src="js/hwpctrlapp/frame/version.js?1720064076814"></script>
    <script type="text/javascript" data-type="css/app" data-framework="aori|lab" src="js/loadHead.js"></script>
    <link rel="stylesheet" href="js/webhwpapp/style/webhwp.css?10.80.0.2507">
    <link rel="stylesheet" href="js/commonFrame/skins/default/css/hcwo.css?10.80.0.2507">
    <script type="text/javascript" src="js/hwpctrlapp/utils/util.js?10.80.0.2507"></script>
    <script type="text/javascript">
      window.serverProps = { skin: "default" };
      window.BaseUrl = getUrlParameter("baseurl");
      var require = {
        urlArgs:
          "version=" + window.__hctfwoVersion /*, deps : ['js/main-hwpapp'] */,
      };
      require(["main-hwpapp"]);
    </script>
    <script type="text/javascript" src="${path}/resources/assets/js/core/jquery-3.7.1.min.js"></script>
            <%-- <script type="text/javascript" src="${path}/resources/jh/js/webhwpctrl.js"></script>
            <script type="text/javascript" src="${path}/resources/jh/js/util.js"></script> --%>
          <script type="text/javascript" src="${path}/resources/jh/js/hwpCtrlApp.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <!-- include plugin -->
    <script src="[folder where script is located]/[plugin script].js"></script>
    <link rel="stylesheet" href="${path}/resources/jh/css/docbar.css">
      <script>

    // Set onreisze event
    var resize = function(e) {
        var windowWidth = document.body.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
        var windowHeight = document.body.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
        var hwpctrl_panel = document.getElementById("hwpctrl");
        var openfield_panel = document.getElementById("openfile_field");
        hwpctrl_panel.style.width = (parseInt(windowWidth)) + "px";
        hwpctrl_panel.style.height = (parseInt(windowHeight) - parseInt(openfield_panel.offsetHeight)) + "px";

        var hwpctrl_frame = document.getElementById("hwpctrl_frame");
        if (hwpctrl_frame != null) {
            hwpctrl_frame.width = parseInt(hwpctrl_panel.style.width);
            hwpctrl_frame.style.width = hwpctrl_panel.style.width;
            hwpctrl_frame.height = parseInt(hwpctrl_panel.style.height);
            hwpctrl_frame.style.height = hwpctrl_panel.style.height;
        }
    };

    window.onresize = resize;
    resize();

    var HwpCtrl = BuildWebHwpCtrl("hwpctrl", location.href, function() {
    }, 2);

    var openDiag = document.getElementById("open");
    openDiag.onchange = function (event) {
        var target = event.target || event.srcElement;
        if (target.value.length == 0) {
        } else {
            HwpCtrl.Open(target.files[0], "", "include-format:hwpx;hwpjson20;", function (res) {
                console.log(res);
            }, {"UserData" : "testData"});
        }
    };
    var hwpctrl_panel = document.getElementById("hwpctrl");
    hwpctrl_panel.style.width = parseInt(windowWidth) + "px";
    hwpctrl_panel.style.height = parseInt(windowHeight) + "px";
    
    var openButton = document.getElementById("open_button");
    openButton.onclick = function() {
        openDiag.click();
    };

</script>
  <style id="hcft_custom_color">.title_bar.on .title_panel.on .property_title {background:#148fd0;border-color:#1281bc;color:#ffffff;}
.title_bar .property_title:hover {background:#e2eff4;border-color:#91b8ca;color:#0f6a9b;}
/* .dialog_wrap{
	display: none;
}
.modal_dialog:before{
	background: none;
}
 */
 	
 		
 		#output {
            position: relative;
            white-space: pre-wrap;
            word-wrap: break-word;
        }
         body {
            overflow : hidden;
            border : 0px solid black;
            margin : 0;
            padding : 0;
            background: #FFFFFF
        }

        input[type="button"] {
            width: auto;
            padding-left : 5px;
            padding-right : 5px;
            color:black;
            border: 2px solid white;
            background-color:white;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            font-size: 8.5pt;
            font-weight: bold;
        }

        input[type="text"] {
            margin:0px 6px 0px 0px;
            padding:0;
            color:black;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            font-size: 9pt;
            font-weight: bold;
        }

        input[type="button"]:hover {
            background-color:lightgray;
        }
		.menu_bar > .btn_wo.btn_wo_fn > a > span{
			overflow: visible !important;
			max-height: 35px !important;
		}


</style>
<link type="stylesheet" href="./style/webhwpapp.css"></head>
<body>
<div id="wrap" class="wrap" data-app="webhwpctrl" data-device="pc" data-skin="">
	<div id="tool_bar" class="tool_bar">
    <div id="title_bar" class="title_bar container_view" style="border:none;">
        <div class="nav_box hide_view">
            <div class="btn_prev_nav hide_view">
                <div class="btn_prev btn_wo btn_wo_fn title_bar_scroll view_border_all" data-ui-command="menu_h_scroll"
                    data-ui-value="prev"><a>
                        <div class="btn_prev btn_icon_inner"></div>
                    </a></div>
            </div>
            <div class="btn_next_nav">
                <div class="btn_next btn_wo btn_wo_fn title_bar_scroll view_border_all" data-ui-command="menu_h_scroll"
                    data-ui-value="next"><a>
                        <div class="btn_next btn_icon_inner"></div>
                    </a></div>
            </div>
        </div>
        <div class="bottom_title normal_panel" data-name="bottom_title">


            <div class="hwp_message text_align_right inline_panel hide_view" data-name="hwp_message"><a class="on_link"
                    href="https://help.malangmalang.com/hc/ko/articles/204536330" target="_blank">HWP 편집 시 호환성 문제 보기</a>
            </div>
        </div>
    </div>
    <div id="menu_bar" class="menu_bar container_view">
        <div class="view_control">
            <div class="btn_menu_bar_view_mode" data-ui-command="fold" data-ui-value="menu_bar" title="접기/펼치기"><svg
                    version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
                    y="0px" viewBox="0 0 13 13" xml:space="preserve" width="15" height="13"
                    style="transform:scaleY(-1);">
                    <polygon points="10.5,4 8.8,4 6.5,7 4.3,4 2.5,4 6.5,9.2"></polygon>
                </svg></div>
        </div>
<!--         <div class="nav_box">
            <div class="btn_prev_nav hide_view">
                <div class="btn_prev btn_wo btn_wo_fn menu_bar_scroll view_border_all" data-ui-command="menu_h_scroll" data-ui-value="prev"><a>
                        <div class="btn_prev btn_icon_inner"></div>
                    </a></div>
            </div>
            <div class="btn_next_nav">
                <div class="btn_next btn_wo btn_wo_fn menu_bar_scroll view_border_all" data-ui-command="menu_h_scroll" data-ui-value="next"><a>
                        <div class="btn_next btn_icon_inner"></div>
                    </a></div>
            </div>
        </div>
 -->        <div class="e_cut large_size btn_wo btn_wo_fn direction_v btn_icon has_desc disable disabled" title="오려 두기"
            data-command="e_cut"><a>
                <div class="e_cut btn_icon_inner"></div><span>오려<br>두기</span>
            </a></div>
        <div class="e_copy large_size btn_wo btn_wo_fn direction_v btn_icon has_desc disable disabled" title="복사하기"
            data-command="e_copy"><a>
                <div class="e_copy btn_icon_inner"></div><span>복사하기<br></span>
            </a></div>
        <div class="e_paste large_size btn_wo btn_wo_fn direction_v btn_icon has_desc" title="붙이기"
            data-command="e_paste"><a>
                <div class="e_paste btn_icon_inner"></div><span>붙이기<br></span>
            </a></div>
        <div class="e_format_copy large_size btn_wo btn_wo_fn direction_v btn_icon has_desc" title="모양 복사"
            data-command="e_format_copy"><a>
                <div class="e_format_copy btn_icon_inner"></div><span>모양<br>복사</span>
            </a></div>
        <div class="vertical_line_wrap">
            <div class="col_line"></div>
        </div>
        <div class="e_ctrl_mark large_size btn_wo btn_wo_fn direction_v btn_icon has_desc" title="조판 부호"
            data-command="e_ctrl_mark"><a>
                <div class="e_ctrl_mark btn_icon_inner"></div><span>조판<br>부호</span>
            </a></div>
        <div class="e_para_mark large_size btn_wo btn_wo_fn direction_v btn_icon has_desc" title="문단 부호"
            data-command="e_para_mark"><a>
                <div class="e_para_mark btn_icon_inner"></div><span>문단<br>부호</span>
            </a></div>
        <div class="d_grid large_size btn_wo btn_wo_fn direction_v btn_icon has_desc" title="격자 보기"
            data-command="d_grid"><a>
                <div class="d_grid btn_icon_inner"></div><span>격자<br>보기</span>
            </a></div>
        <div class="vertical_line_wrap">
            <div class="col_line"></div>
        </div>
        <div class="char_shape direction_v large_size btn_wo btn_wo_fn btn_icon has_desc" title="글자 모양"
            data-ui-command="show" data-ui-value="dialog_char_shape"><a>
                <div class="char_shape btn_icon_inner"></div><span>글자<br>모양</span>
            </a></div>
        <div class="para_shape direction_v large_size btn_wo btn_wo_fn btn_icon has_desc" title="문단 모양"
            data-ui-command="show" data-ui-value="dialog_para_shape"><a>
                <div class="para_shape btn_icon_inner"></div><span>문단<br>모양</span>
            </a></div>
        <div class="vertical_line_wrap">
            <div class="col_line"></div>
        </div>
        <div class="insert_table direction_v large_size btn_wo btn_wo_fn btn_icon has_desc" title="표"
            data-ui-command="show" data-ui-value="dialog_create_table"><a>
                <div class="insert_table btn_icon_inner"></div><span>표<br></span>
            </a></div>
        <div class="s_insert_shape insert_shape btn_dropdown btn_wo btn_wo_fn direction_v large_size icon_combo has_desc"
            data-arrow-direction="down" title="도형"><a data-ui-command="dropdown" data-ui-value="insert_shape">
                <div class="insert_shape btn_icon_inner"></div>
            </a><a class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"
                data-ui-value="insert_shape"><span>도형<br></span></a>
            <div class="menu_select_list button_grid" title="" style="width: 132px;">
                <div class="title_separator s_insert_shape">그리기 개체</div>
                <div class="shape_list normal_panel button_grid" data-name="shape_list" style="padding: 5px 0px 0px;">
                    <div class="s_insert_shape horiz_text_box small_size btn_wo btn_wo_fn btn_icon shape_list"
                        data-switch-button="true" title="가로 글상자" data-value="horiz_text_box"
                        data-command="s_insert_shape"><a>
                            <div class="horiz_text_box btn_icon_inner"></div>
                        </a></div>
                    <div class="s_insert_shape rectangle small_size btn_wo btn_wo_fn btn_icon" data-switch-button="true"
                        title="직사각형" data-value="rectangle" data-command="s_insert_shape"><a>
                            <div class="rectangle btn_icon_inner"></div>
                        </a></div>
                    <div class="s_insert_shape ellipse small_size btn_wo btn_wo_fn btn_icon" data-switch-button="true"
                        title="타원" data-value="ellipse" data-command="s_insert_shape"><a>
                            <div class="ellipse btn_icon_inner"></div>
                        </a></div>
                    <div class="s_insert_shape line small_size btn_wo btn_wo_fn btn_icon" data-switch-button="true"
                        title="직선" data-value="line" data-command="s_insert_shape"><a>
                            <div class="line btn_icon_inner"></div>
                        </a></div>
                    <div class="s_insert_shape arc small_size btn_wo btn_wo_fn btn_icon" data-switch-button="true"
                        title="호" data-value="arc" data-command="s_insert_shape"><a>
                            <div class="arc btn_icon_inner"></div>
                        </a></div>
                </div>
            </div>
        </div>
        <div class="insert_image direction_v large_size btn_wo btn_wo_fn btn_icon has_desc" title="그림"
            data-ui-command="show" data-ui-value="dialog_insert_image"><a>
                <div class="insert_image btn_icon_inner"></div><span>그림<br></span>
            </a></div>
        <div class="modify_object_properties large_size btn_wo btn_wo_fn direction_v btn_icon has_desc disable disabled"
            data-command="modify_object_properties"><a>
                <div class="modify_object_properties btn_icon_inner"></div><span>개체<br>속성</span>
            </a></div>
        <div class="vertical_line_wrap">
            <div class="col_line"></div>
        </div>
        <div class="symbols direction_v large_size btn_wo btn_wo_fn btn_icon has_desc" title="문자표"
            data-ui-command="show" data-ui-value="dialog_insert_symbols"><a>
                <div class="symbols btn_icon_inner"></div><span>문자표<br></span>
            </a></div>
        <div class="vertical_line_wrap">
            <div class="col_line"></div>
        </div>
        <div class="hyperlink direction_v large_size btn_wo btn_wo_fn btn_icon has_desc" title="하이퍼링크"
            data-ui-command="show" data-ui-value="dialog_insert_modify_hyperlink"><a>
                <div class="hyperlink btn_icon_inner"></div><span>하이퍼링크<br></span>
            </a></div>
        <div class="vertical_line_wrap">
            <div class="col_line"></div>
        </div>
        <div class="find direction_v large_size btn_wo btn_wo_fn btn_icon has_desc" title="찾기" data-ui-command="show"
            data-ui-value="dialog_find"><a>
                <div class="find btn_icon_inner"></div><span>찾기<br></span>
            </a></div>
    </div>
    <div id="style_bar" class="style_bar container_view" style="padding: 1px;">
        <div class="nav_box">
            <div class="btn_prev_nav hide_view">
                <div class="btn_prev btn_wo btn_wo_fn style_bar_scroll view_border_all" data-ui-command="menu_h_scroll"
                    data-ui-value="prev"><a>
                        <div class="btn_prev btn_icon_inner"></div>
                    </a></div>
            </div>
            <!-- nav_box좌우 넘기기 -->
            <!-- <div class="btn_next_nav">
                <div class="btn_next btn_wo btn_wo_fn style_bar_scroll view_border_all" data-ui-command="menu_h_scroll"
                    data-ui-value="next"><a>
                        <div class="btn_next btn_icon_inner"></div>
                    </a></div>
            </div> -->
        </div>
        <div class="e_undo btn_wo btn_wo_fn btn_icon disable disabled" title="되돌리기" data-command="e_undo"><a>
                <div class="e_undo btn_icon_inner"></div>
            </a></div>
        <div class="e_redo btn_wo btn_wo_fn btn_icon disable disabled" title="다시 실행" data-command="e_redo"><a>
                <div class="e_redo btn_icon_inner"></div>
            </a></div>
        <div class="vertical_line_wrap">
            <div class="col_line"></div>
        </div>
        <div class="inline_panel fit_size" data-match-type="block">
            <div class="p_language btn_dropdown btn_wo btn_wo_fn small_size text_dropdown no_icon has_desc"
                data-arrow-direction="down" title="언어"><a data-ui-command="dropdown" data-ui-value="p_language">대표</a><a
                    class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"
                    data-ui-value="p_language"></a>
                <div class="menu_select_list fit_size" title="">
                    <div class="p_language default dropdown_data no_icon on" data-switch-button="true" title="대표"
                        data-value="default" data-command="p_language" data-match="default">대표</div>
                    <div class="p_language hangul dropdown_data no_icon" data-switch-button="true" title="한글"
                        data-value="hangul" data-command="p_language" data-match="hangul">한글</div>
                    <div class="p_language latin dropdown_data no_icon" data-switch-button="true" title="영문"
                        data-value="latin" data-command="p_language" data-match="latin">영문</div>
                    <div class="p_language hanja dropdown_data no_icon" data-switch-button="true" title="한자"
                        data-value="hanja" data-command="p_language" data-match="hanja">한자</div>
                    <div class="p_language japanese dropdown_data no_icon" data-switch-button="true" title="일어"
                        data-value="japanese" data-command="p_language" data-match="japanese">일어</div>
                    <div class="p_language other dropdown_data no_icon" data-switch-button="true" title="외국어"
                        data-value="other" data-command="p_language" data-match="other">외국어</div>
                    <div class="p_language symbol dropdown_data no_icon" data-switch-button="true" title="기호"
                        data-value="symbol" data-command="p_language" data-match="symbol">기호</div>
                    <div class="p_language user dropdown_data no_icon" data-switch-button="true" title="사용자"
                        data-value="user" data-command="p_language" data-match="user">사용자</div>
                </div>
            </div>
            <div class="font_name btn_combo btn_wo btn_wo_fn medium_size text_dropdown input_wrap" title="글꼴"
                data-arrow-direction="down"><a class="font_name input_text_wrap input_wrap view_border_none"
                    data-command="font_name"><input type="text" class="focus" autocomplete="off"><span
                        class="unit hide_view"></span></a><a class="btn_combo_arrow arrow_direction_down"
                    data-ui-command="dropdown"></a>
                <div class="menu_select_list large_size sample_wrap" title="" data-sample-name="font_name">
                    <div class="font_name no_such_font dropdown_data on" data-switch-button="true" data-nls-name=" "
                        data-value="HCR Batang" data-command="font_name" style="">함초롬바탕</div>
                    <div class="font_name dropdown_data no_icon sample_item" data-switch-button="true"
                        data-value="NanumGothic" data-command="font_name" style="font-family:NanumGothic">나눔고딕</div>
                    <div class="font_name dropdown_data no_icon sample_item" data-switch-button="true"
                        data-value="NanumGothic ExtraBold" data-command="font_name"
                        style="font-family:NanumGothic ExtraBold">나눔고딕 ExtraBold</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Apple SD Gothic Neo" data-command="font_name"
                        style="font-family:Apple SD Gothic Neo">Apple SD 산돌고딕 Neo</div>
                    <div class="font_name dropdown_data no_icon sample_item" data-switch-button="true"
                        data-value="HY견고딕" data-command="font_name" style="font-family:HY견고딕">HY견고딕</div>
                    <div class="font_name dropdown_data no_icon sample_item" data-switch-button="true"
                        data-value="HY견명조" data-command="font_name" style="font-family:HY견명조">HY견명조</div>
                    <div class="font_name dropdown_data no_icon sample_item" data-switch-button="true"
                        data-value="HY그래픽M" data-command="font_name" style="font-family:HY그래픽M">HY그래픽M</div>
                    <div class="font_name dropdown_data no_icon sample_item" data-switch-button="true"
                        data-value="HY헤드라인M" data-command="font_name" style="font-family:HY헤드라인M">HY헤드라인M</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="SpoqaHanSans" data-command="font_name" style="font-family:SpoqaHanSans">SpoqaHanSans
                    </div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Arial" data-command="font_name" style="font-family:Arial">Arial</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Comic Sans MS" data-command="font_name" style="font-family:Comic Sans MS">Comic Sans
                        MS</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Courier New" data-command="font_name" style="font-family:Courier New">Courier New
                    </div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Georgia" data-command="font_name" style="font-family:Georgia">Georgia</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Impact" data-command="font_name" style="font-family:Impact">Impact</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Plantagenet Cherokee" data-command="font_name"
                        style="font-family:Plantagenet Cherokee">Plantagenet Cherokee</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Tahoma" data-command="font_name" style="font-family:Tahoma">Tahoma</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Times New Roman" data-command="font_name" style="font-family:Times New Roman">Times
                        New Roman</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Trebuchet MS" data-command="font_name" style="font-family:Trebuchet MS">Trebuchet MS
                    </div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Verdana" data-command="font_name" style="font-family:Verdana">Verdana</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Webdings" data-command="font_name">Webdings</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Wingdings" data-command="font_name">Wingdings</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Wingdings 2" data-command="font_name">Wingdings 2</div>
                    <div class="font_name dropdown_data no_icon sample_item hide_view" data-switch-button="true"
                        data-value="Wingdings 3" data-command="font_name">Wingdings 3</div>
                </div>
            </div>
        </div>
        <div class="font_size btn_combo btn_wo btn_wo_fn small_size text_dropdown input_wrap" title="글자 크기"
            data-arrow-direction="down"><a class="font_size input_text_wrap input_wrap view_border_none"
                data-command="font_size" data-value-key="fontSize"><input type="text" class="focus"
                    autocomplete="off"><span class="unit">pt</span></a><a class="btn_combo_arrow arrow_direction_down"
                data-ui-command="dropdown"></a>
            <div class="menu_select_list medium_size" title="">
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="8" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">8</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="9" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">9</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="10" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">10</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="11" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">11</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="12" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">12</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="14" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">14</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="16" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">16</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="18" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">18</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="20" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">20</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="22" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">22</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="24" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">24</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="26" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">26</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="36" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">36</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="48" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">48</div>
                <div class="font_size dropdown_data no_icon" data-switch-button="true" data-value="72" data-unit="pt"
                    data-command="font_size" data-value-key="fontSize">72</div>
            </div>
        </div>
        <div class="vertical_line_wrap">
            <div class="col_line"></div>
        </div>
        <div class="bold btn_wo btn_wo_fn btn_icon" title="진하게" data-command="bold"><a>
                <div class="bold btn_icon_inner"></div>
            </a></div>
        <div class="italic btn_wo btn_wo_fn btn_icon" title="기울임" data-command="italic"><a>
                <div class="italic btn_icon_inner"></div>
            </a></div>
        <div class="underline btn_combo btn_wo btn_wo_fn icon_combo" title="밑줄" data-arrow-direction="down"><a
                data-command="underline" data-non-exec="true" data-value-key="underline_style">
                <div class="underline btn_icon_inner"></div><span></span>
            </a><a class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"></a>
            <div class="menu_select_list medium_size" title="">
                <div class="underline bdr_style_solid dropdown_data text_align_center" data-switch-button="true"
                    title="실선" data-value="solid" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_dashed dropdown_data text_align_center" data-switch-button="true"
                    title="파선" data-value="dashed" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_dotted dropdown_data text_align_center" data-switch-button="true"
                    title="점선" data-value="dotted" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_dashed_80_20_20_20 dropdown_data text_align_center"
                    data-switch-button="true" title="일점쇄선" data-value="dashed_80_20_20_20" data-command="underline"
                    data-non-exec="true" data-value-key="underline_style"></div>
                <div class="underline bdr_style_dashed_80_20_20_20_20_20 dropdown_data text_align_center"
                    data-switch-button="true" title="이점쇄선" data-value="dashed_80_20_20_20_20_20"
                    data-command="underline" data-non-exec="true" data-value-key="underline_style"></div>
                <div class="underline bdr_style_long_dash dropdown_data text_align_center" data-switch-button="true"
                    title="긴 파선" data-value="long_dash" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_circle dropdown_data text_align_center" data-switch-button="true"
                    title="원형 점선" data-value="circle" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_double dropdown_data text_align_center" data-switch-button="true"
                    title="이중 실선" data-value="double" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_slim_thick dropdown_data text_align_center" data-switch-button="true"
                    title="얇고 굵은 이중선" data-value="slim_thick" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_thick_slim dropdown_data text_align_center" data-switch-button="true"
                    title="굵고 얇은 이중선" data-value="thick_slim" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_slimthickslim dropdown_data text_align_center" data-switch-button="true"
                    title="얇고 굵고 얇은 삼중선" data-value="slimthickslim" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_wave dropdown_data text_align_center" data-switch-button="true"
                    title="물결선" data-value="wave" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
                <div class="underline bdr_style_double_wave dropdown_data text_align_center" data-switch-button="true"
                    title="이중물결선" data-value="double_wave" data-command="underline" data-non-exec="true"
                    data-value-key="underline_style"></div>
            </div>
        </div>
        <div class="strikethrough btn_combo btn_wo btn_wo_fn icon_combo" title="취소선" data-arrow-direction="down"><a
                data-command="strikethrough" data-non-exec="true" data-value-key="strikethrough_style">
                <div class="strikethrough btn_icon_inner"></div><span></span>
            </a><a class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"></a>
            <div class="menu_select_list medium_size" title="">
                <div class="strikethrough bdr_style_solid dropdown_data text_align_center" data-switch-button="true"
                    title="실선" data-value="solid" data-command="strikethrough" data-non-exec="true"
                    data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_dashed dropdown_data text_align_center" data-switch-button="true"
                    title="파선" data-value="dashed" data-command="strikethrough" data-non-exec="true"
                    data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_dotted dropdown_data text_align_center" data-switch-button="true"
                    title="점선" data-value="dotted" data-command="strikethrough" data-non-exec="true"
                    data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_dashed_80_20_20_20 dropdown_data text_align_center"
                    data-switch-button="true" title="일점쇄선" data-value="dashed_80_20_20_20" data-command="strikethrough"
                    data-non-exec="true" data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_dashed_80_20_20_20_20_20 dropdown_data text_align_center"
                    data-switch-button="true" title="이점쇄선" data-value="dashed_80_20_20_20_20_20"
                    data-command="strikethrough" data-non-exec="true" data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_long_dash dropdown_data text_align_center" data-switch-button="true"
                    title="긴 파선" data-value="long_dash" data-command="strikethrough" data-non-exec="true"
                    data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_circle dropdown_data text_align_center" data-switch-button="true"
                    title="원형 점선" data-value="circle" data-command="strikethrough" data-non-exec="true"
                    data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_double dropdown_data text_align_center" data-switch-button="true"
                    title="이중 실선" data-value="double" data-command="strikethrough" data-non-exec="true"
                    data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_slim_thick dropdown_data text_align_center"
                    data-switch-button="true" title="얇고 굵은 이중선" data-value="slim_thick" data-command="strikethrough"
                    data-non-exec="true" data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_thick_slim dropdown_data text_align_center"
                    data-switch-button="true" title="굵고 얇은 이중선" data-value="thick_slim" data-command="strikethrough"
                    data-non-exec="true" data-value-key="strikethrough_style"></div>
                <div class="strikethrough bdr_style_slimthickslim dropdown_data text_align_center"
                    data-switch-button="true" title="얇고 굵고 얇은 삼중선" data-value="slimthickslim"
                    data-command="strikethrough" data-non-exec="true" data-value-key="strikethrough_style"></div>
            </div>
        </div>
        <div class="font_color btn_combo btn_wo btn_wo_fn color_with_icon" title="글자 색" data-arrow-direction="down"
            data-value="#000000"><a data-command="font_color" data-value="#000000">
                <div class="font_color btn_icon_inner"><span class="selected_color"
                        style="background-color: rgb(0, 0, 0);"></span></div><span></span>
            </a><a class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"></a>
            <div class="menu_select_list ui_color_picker custom_layout fit_size" title="">
                <div class="font_color color_picker template_wrap">
            
            
            <input class="tab1" type="radio" name="tab"><input class="tab2" type="radio" name="tab">
            <label data-for="tab1" class="default_color_tab view_border_all" data-ui-command="tab">테마 색</label><label data-for="tab2" class="spectrum_color_tab view_border_all" data-ui-command="tab">스펙트럼</label>
            <div class="default_color_content" ui-enable="true">
                
                
                <div class="normal_panel">
                    <div class="inline_panel">
                        <div class="default_color_palette">
                            <div class="palette_color color_white" style="background-color:#FFFFFF;" data-command="font_color" data-switch-button="true" data-value="#FFFFFF"></div><div class="palette_color on" style="background-color:#000000;" data-command="font_color" data-switch-button="true" data-value="#000000"></div><div class="palette_color" style="background-color:#FAF3DB;" data-command="font_color" data-switch-button="true" data-value="#FAF3DB"></div><div class="palette_color" style="background-color:#3A3C84;" data-command="font_color" data-switch-button="true" data-value="#3A3C84"></div><div class="palette_color" style="background-color:#6182D6;" data-command="font_color" data-switch-button="true" data-value="#6182D6"></div><div class="palette_color" style="background-color:#FF843A;" data-command="font_color" data-switch-button="true" data-value="#FF843A"></div><div class="palette_color" style="background-color:#B2B2B2;" data-command="font_color" data-switch-button="true" data-value="#B2B2B2"></div><div class="palette_color" style="background-color:#FFD700;" data-command="font_color" data-switch-button="true" data-value="#FFD700"></div><div class="palette_color" style="background-color:#289B6E;" data-command="font_color" data-switch-button="true" data-value="#289B6E"></div><div class="palette_color" style="background-color:#9D5CBB;" data-command="font_color" data-switch-button="true" data-value="#9D5CBB"></div>
                        </div>
                    </div>
                    <div class="inline_panel fit_size align_item_top color_theme_table_arrow">
                        <div class="btn_dropdown btn_wo arrow_dropdown shortcut_area_none view_border_all on_check color_theme" data-arrow-direction="right" style="margin:0 0 0 5px;">
                            <a data-ui-command="dropdown"><span></span></a>
                            <a class="btn_combo_arrow arrow_direction_right" data-ui-command="dropdown"></a>
                            <div class="menu_select_list multi_list_item" title="">
                                <div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc default on" data-ui-command="color_theme" data-ui-value="default" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_default btn_icon_inner" style="width: 168px; height: 15px;"></div><span>기본</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc office" data-ui-command="color_theme" data-ui-value="office" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_office btn_icon_inner" style="width: 168px; height: 15px;"></div><span>오피스</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc afterimage" data-ui-command="color_theme" data-ui-value="afterimage" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_afterimage btn_icon_inner" style="width: 168px; height: 15px;"></div><span>잔상</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc light" data-ui-command="color_theme" data-ui-value="light" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_light btn_icon_inner" style="width: 168px; height: 15px;"></div><span>빛</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc orange" data-ui-command="color_theme" data-ui-value="orange" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_orange btn_icon_inner" style="width: 168px; height: 15px;"></div><span>주황</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc yesterday" data-ui-command="color_theme" data-ui-value="yesterday" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_yesterday btn_icon_inner" style="width: 168px; height: 15px;"></div><span>어제</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc spring" data-ui-command="color_theme" data-ui-value="spring" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_spring btn_icon_inner" style="width: 168px; height: 15px;"></div><span>봄</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc dream" data-ui-command="color_theme" data-ui-value="dream" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_dream btn_icon_inner" style="width: 168px; height: 15px;"></div><span>꿈</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc forest" data-ui-command="color_theme" data-ui-value="forest" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_forest btn_icon_inner" style="width: 168px; height: 15px;"></div><span>숲속</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc sea" data-ui-command="color_theme" data-ui-value="sea" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_sea btn_icon_inner" style="width: 168px; height: 15px;"></div><span>바다</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc weightlessness" data-ui-command="color_theme" data-ui-value="weightlessness" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_weightlessness btn_icon_inner" style="width: 168px; height: 15px;"></div><span>무중력</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc deepsea" data-ui-command="color_theme" data-ui-value="deepsea" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_deepsea btn_icon_inner" style="width: 168px; height: 15px;"></div><span>심해</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="color_palette">
                    <div class="color_group">
                        <div class="palette_color" style="background-color:#F2F2F2;" data-command="font_color" data-switch-button="true" data-value="#F2F2F2"></div><div class="palette_color" style="background-color:#808080;" data-command="font_color" data-switch-button="true" data-value="#808080"></div><div class="palette_color" style="background-color:#F4E5B2;" data-command="font_color" data-switch-button="true" data-value="#F4E5B2"></div><div class="palette_color" style="background-color:#D3D3EB;" data-command="font_color" data-switch-button="true" data-value="#D3D3EB"></div><div class="palette_color" style="background-color:#DFE6F7;" data-command="font_color" data-switch-button="true" data-value="#DFE6F7"></div><div class="palette_color" style="background-color:#FFE7D8;" data-command="font_color" data-switch-button="true" data-value="#FFE7D8"></div><div class="palette_color" style="background-color:#F0F0F0;" data-command="font_color" data-switch-button="true" data-value="#F0F0F0"></div><div class="palette_color" style="background-color:#FFF7CC;" data-command="font_color" data-switch-button="true" data-value="#FFF7CC"></div><div class="palette_color" style="background-color:#CDF2E4;" data-command="font_color" data-switch-button="true" data-value="#CDF2E4"></div><div class="palette_color" style="background-color:#EBDEF1;" data-command="font_color" data-switch-button="true" data-value="#EBDEF1"></div>
                    </div><div class="color_group">
                        <div class="palette_color" style="background-color:#D9D9D9;" data-command="font_color" data-switch-button="true" data-value="#D9D9D9"></div><div class="palette_color" style="background-color:#595959;" data-command="font_color" data-switch-button="true" data-value="#595959"></div><div class="palette_color" style="background-color:#ECD174;" data-command="font_color" data-switch-button="true" data-value="#ECD174"></div><div class="palette_color" style="background-color:#A6A7D8;" data-command="font_color" data-switch-button="true" data-value="#A6A7D8"></div><div class="palette_color" style="background-color:#C0CDEF;" data-command="font_color" data-switch-button="true" data-value="#C0CDEF"></div><div class="palette_color" style="background-color:#FFCEB0;" data-command="font_color" data-switch-button="true" data-value="#FFCEB0"></div><div class="palette_color" style="background-color:#E0E0E0;" data-command="font_color" data-switch-button="true" data-value="#E0E0E0"></div><div class="palette_color" style="background-color:#FFEF99;" data-command="font_color" data-switch-button="true" data-value="#FFEF99"></div><div class="palette_color" style="background-color:#9BE5C8;" data-command="font_color" data-switch-button="true" data-value="#9BE5C8"></div><div class="palette_color" style="background-color:#D8BEE4;" data-command="font_color" data-switch-button="true" data-value="#D8BEE4"></div>
                    </div><div class="color_group">
                        <div class="palette_color" style="background-color:#BFBFBF;" data-command="font_color" data-switch-button="true" data-value="#BFBFBF"></div><div class="palette_color" style="background-color:#404040;" data-command="font_color" data-switch-button="true" data-value="#404040"></div><div class="palette_color" style="background-color:#CEA61D;" data-command="font_color" data-switch-button="true" data-value="#CEA61D"></div><div class="palette_color" style="background-color:#7A7CC4;" data-command="font_color" data-switch-button="true" data-value="#7A7CC4"></div><div class="palette_color" style="background-color:#A0B4E6;" data-command="font_color" data-switch-button="true" data-value="#A0B4E6"></div><div class="palette_color" style="background-color:#FFB689;" data-command="font_color" data-switch-button="true" data-value="#FFB689"></div><div class="palette_color" style="background-color:#D1D1D1;" data-command="font_color" data-switch-button="true" data-value="#D1D1D1"></div><div class="palette_color" style="background-color:#FFE766;" data-command="font_color" data-switch-button="true" data-value="#FFE766"></div><div class="palette_color" style="background-color:#69D8AD;" data-command="font_color" data-switch-button="true" data-value="#69D8AD"></div><div class="palette_color" style="background-color:#C49DD6;" data-command="font_color" data-switch-button="true" data-value="#C49DD6"></div>
                    </div><div class="color_group">
                        <div class="palette_color" style="background-color:#A6A6A6;" data-command="font_color" data-switch-button="true" data-value="#A6A6A6"></div><div class="palette_color" style="background-color:#262626;" data-command="font_color" data-switch-button="true" data-value="#262626"></div><div class="palette_color" style="background-color:#67530E;" data-command="font_color" data-switch-button="true" data-value="#67530E"></div><div class="palette_color" style="background-color:#2B2D63;" data-command="font_color" data-switch-button="true" data-value="#2B2D63"></div><div class="palette_color" style="background-color:#3057B9;" data-command="font_color" data-switch-button="true" data-value="#3057B9"></div><div class="palette_color" style="background-color:#EB5800;" data-command="font_color" data-switch-button="true" data-value="#EB5800"></div><div class="palette_color" style="background-color:#858585;" data-command="font_color" data-switch-button="true" data-value="#858585"></div><div class="palette_color" style="background-color:#BFA100;" data-command="font_color" data-switch-button="true" data-value="#BFA100"></div><div class="palette_color" style="background-color:#1E7452;" data-command="font_color" data-switch-button="true" data-value="#1E7452"></div><div class="palette_color" style="background-color:#783E94;" data-command="font_color" data-switch-button="true" data-value="#783E94"></div>
                    </div><div class="color_group">
                        <div class="palette_color" style="background-color:#808080;" data-command="font_color" data-switch-button="true" data-value="#808080"></div><div class="palette_color" style="background-color:#0D0D0D;" data-command="font_color" data-switch-button="true" data-value="#0D0D0D"></div><div class="palette_color" style="background-color:#292106;" data-command="font_color" data-switch-button="true" data-value="#292106"></div><div class="palette_color" style="background-color:#1D1E42;" data-command="font_color" data-switch-button="true" data-value="#1D1E42"></div><div class="palette_color" style="background-color:#203A7B;" data-command="font_color" data-switch-button="true" data-value="#203A7B"></div><div class="palette_color" style="background-color:#9C3B00;" data-command="font_color" data-switch-button="true" data-value="#9C3B00"></div><div class="palette_color" style="background-color:#595959;" data-command="font_color" data-switch-button="true" data-value="#595959"></div><div class="palette_color" style="background-color:#806B00;" data-command="font_color" data-switch-button="true" data-value="#806B00"></div><div class="palette_color" style="background-color:#144E37;" data-command="font_color" data-switch-button="true" data-value="#144E37"></div><div class="palette_color" style="background-color:#502962;" data-command="font_color" data-switch-button="true" data-value="#502962"></div>
                    </div>
                </div>
                <div class="horizontal_line"></div>
                <div class="standard_color_palette" style="height: 13px;">
                    <div class="palette_color on" style="background-color:#000000;" data-command="font_color" data-switch-button="true" data-value="#000000"></div><div class="palette_color" style="background-color:#FF0000;" data-command="font_color" data-switch-button="true" data-value="#FF0000"></div><div class="palette_color" style="background-color:#FF6600;" data-command="font_color" data-switch-button="true" data-value="#FF6600"></div><div class="palette_color" style="background-color:#FFFF00;" data-command="font_color" data-switch-button="true" data-value="#FFFF00"></div><div class="palette_color" style="background-color:#BAFF1A;" data-command="font_color" data-switch-button="true" data-value="#BAFF1A"></div><div class="palette_color" style="background-color:#008000;" data-command="font_color" data-switch-button="true" data-value="#008000"></div><div class="palette_color" style="background-color:#42C7F1;" data-command="font_color" data-switch-button="true" data-value="#42C7F1"></div><div class="palette_color" style="background-color:#0000FF;" data-command="font_color" data-switch-button="true" data-value="#0000FF"></div><div class="palette_color" style="background-color:#1B1760;" data-command="font_color" data-switch-button="true" data-value="#1B1760"></div><div class="palette_color" style="background-color:#800080;" data-command="font_color" data-switch-button="true" data-value="#800080"></div>
                </div>
            </div>
            <div class="spectrum_color_content">
                <div class="normal_panel spectrum_color_info">
                    <div class="inline_panel">
                        <div class="normal_panel align_item_center">
                            <div class="inline_panel fit_size preview_color_block" style="background-color: rgb(0, 0, 0);"></div>
                            <div class="inline_panel">
                                <div class="preview_color_text input_text_wrap full_size input_wrap view_border_underline" data-command="font_color" data-non-exec="true" data-org-color="#000000">
                                    <span class="text_icon">#</span>
                                    <input type="text" spellcheck="false" maxlength="6">
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="spectrum_color_confirm has_desc fit_size no_icon btn_text view_border_all" data-command="font_color">
                        <span>확인</span>
                    </button>
                </div>
                <div class="color_spectrum_container">
                    <div class="color_spectrum_picker" style="width:204px;height:4px;">
                        <div class="color_spectrum_pointer" style="left: 0px;"></div>
                        <div class="color_spectrum_bgcolor"></div>
                    </div>
                </div>
                <div class="color_matrix_container">
                    <div class="color_matrix_picker" style="width: 204px; height: 132px; background-color: rgb(255, 0, 0);">
                        <div class="color_matrix_pointer" style="left: 0px; top: 132px;">
                            <div class="color_matrix_shape shape_1"></div>
                            <div class="color_matrix_shape shape_2"></div>
                        </div>
                        <div class="color_matrix_bgcolor bgcolor_1"></div>
                        <div class="color_matrix_bgcolor bgcolor_2"></div>
                    </div>
                </div>
            </div>
        </div></div></div><div class="vertical_line_wrap"><div class="col_line"></div></div><div class="font_highlight_color btn_combo btn_wo btn_wo_fn color_with_icon" title="형광펜" data-arrow-direction="down" data-value="#ffff00"><a data-command="font_highlight_color" data-value="#ffff00"><div class="font_highlight_color btn_icon_inner"><span class="selected_color" style="background-color: rgb(255, 255, 0);"></span></div><span></span></a><a class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"></a><div class="menu_select_list ui_color_picker custom_layout fit_size" title=""><div class="font_highlight_color color_picker template_wrap">
            <div class="sub_default_color" data-command="font_highlight_color" data-switch-button="true" data-value="transparent">
                <div class="color_transparent"></div>
                <div>없음</div>
            </div>
            <div class="horizontal_line" style="margin:1px -10px 0 -10px;"></div>
            <input class="tab1" type="radio" name="tab"><input class="tab2" type="radio" name="tab">
            <label data-for="tab1" class="default_color_tab view_border_all" data-ui-command="tab">테마 색</label><label data-for="tab2" class="spectrum_color_tab view_border_all" data-ui-command="tab">스펙트럼</label>
            <div class="default_color_content" ui-enable="true">
                
                
                <div class="normal_panel">
                    <div class="inline_panel">
                        <div class="default_color_palette">
                            <div class="palette_color color_white" style="background-color:#FFFFFF;" data-command="font_highlight_color" data-switch-button="true" data-value="#FFFFFF"></div><div class="palette_color" style="background-color:#000000;" data-command="font_highlight_color" data-switch-button="true" data-value="#000000"></div><div class="palette_color" style="background-color:#FAF3DB;" data-command="font_highlight_color" data-switch-button="true" data-value="#FAF3DB"></div><div class="palette_color" style="background-color:#3A3C84;" data-command="font_highlight_color" data-switch-button="true" data-value="#3A3C84"></div><div class="palette_color" style="background-color:#6182D6;" data-command="font_highlight_color" data-switch-button="true" data-value="#6182D6"></div><div class="palette_color" style="background-color:#FF843A;" data-command="font_highlight_color" data-switch-button="true" data-value="#FF843A"></div><div class="palette_color" style="background-color:#B2B2B2;" data-command="font_highlight_color" data-switch-button="true" data-value="#B2B2B2"></div><div class="palette_color" style="background-color:#FFD700;" data-command="font_highlight_color" data-switch-button="true" data-value="#FFD700"></div><div class="palette_color" style="background-color:#289B6E;" data-command="font_highlight_color" data-switch-button="true" data-value="#289B6E"></div><div class="palette_color" style="background-color:#9D5CBB;" data-command="font_highlight_color" data-switch-button="true" data-value="#9D5CBB"></div>
                        </div>
                    </div>
                    <div class="inline_panel fit_size align_item_top color_theme_table_arrow">
                        <div class="btn_dropdown btn_wo arrow_dropdown shortcut_area_none view_border_all on_check color_theme" data-arrow-direction="right" style="margin:0 0 0 5px;">
                            <a data-ui-command="dropdown"><span></span></a>
                            <a class="btn_combo_arrow arrow_direction_right" data-ui-command="dropdown"></a>
                            <div class="menu_select_list multi_list_item" title="">
                                <div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc default on" data-ui-command="color_theme" data-ui-value="default" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_default btn_icon_inner" style="width: 168px; height: 15px;"></div><span>기본</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc office" data-ui-command="color_theme" data-ui-value="office" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_office btn_icon_inner" style="width: 168px; height: 15px;"></div><span>오피스</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc afterimage" data-ui-command="color_theme" data-ui-value="afterimage" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_afterimage btn_icon_inner" style="width: 168px; height: 15px;"></div><span>잔상</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc light" data-ui-command="color_theme" data-ui-value="light" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_light btn_icon_inner" style="width: 168px; height: 15px;"></div><span>빛</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc orange" data-ui-command="color_theme" data-ui-value="orange" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_orange btn_icon_inner" style="width: 168px; height: 15px;"></div><span>주황</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc yesterday" data-ui-command="color_theme" data-ui-value="yesterday" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_yesterday btn_icon_inner" style="width: 168px; height: 15px;"></div><span>어제</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc spring" data-ui-command="color_theme" data-ui-value="spring" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_spring btn_icon_inner" style="width: 168px; height: 15px;"></div><span>봄</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc dream" data-ui-command="color_theme" data-ui-value="dream" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_dream btn_icon_inner" style="width: 168px; height: 15px;"></div><span>꿈</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc forest" data-ui-command="color_theme" data-ui-value="forest" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_forest btn_icon_inner" style="width: 168px; height: 15px;"></div><span>숲속</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc sea" data-ui-command="color_theme" data-ui-value="sea" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_sea btn_icon_inner" style="width: 168px; height: 15px;"></div><span>바다</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc weightlessness" data-ui-command="color_theme" data-ui-value="weightlessness" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_weightlessness btn_icon_inner" style="width: 168px; height: 15px;"></div><span>무중력</span></a>
                                </div><div class="a has_desc btn_wo btn_wo_fn btn_icon btn_icon_width_custom color_theme has_desc deepsea" data-ui-command="color_theme" data-ui-value="deepsea" data-switch-button="true" data-icon-size="custom" style="padding-left:26px;">
                                    <a><div class="color_theme_deepsea btn_icon_inner" style="width: 168px; height: 15px;"></div><span>심해</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="color_palette">
                    <div class="color_group">
                        <div class="palette_color" style="background-color:#F2F2F2;" data-command="font_highlight_color" data-switch-button="true" data-value="#F2F2F2"></div><div class="palette_color" style="background-color:#808080;" data-command="font_highlight_color" data-switch-button="true" data-value="#808080"></div><div class="palette_color" style="background-color:#F4E5B2;" data-command="font_highlight_color" data-switch-button="true" data-value="#F4E5B2"></div><div class="palette_color" style="background-color:#D3D3EB;" data-command="font_highlight_color" data-switch-button="true" data-value="#D3D3EB"></div><div class="palette_color" style="background-color:#DFE6F7;" data-command="font_highlight_color" data-switch-button="true" data-value="#DFE6F7"></div><div class="palette_color" style="background-color:#FFE7D8;" data-command="font_highlight_color" data-switch-button="true" data-value="#FFE7D8"></div><div class="palette_color" style="background-color:#F0F0F0;" data-command="font_highlight_color" data-switch-button="true" data-value="#F0F0F0"></div><div class="palette_color" style="background-color:#FFF7CC;" data-command="font_highlight_color" data-switch-button="true" data-value="#FFF7CC"></div><div class="palette_color" style="background-color:#CDF2E4;" data-command="font_highlight_color" data-switch-button="true" data-value="#CDF2E4"></div><div class="palette_color" style="background-color:#EBDEF1;" data-command="font_highlight_color" data-switch-button="true" data-value="#EBDEF1"></div>
                    </div><div class="color_group">
                        <div class="palette_color" style="background-color:#D9D9D9;" data-command="font_highlight_color" data-switch-button="true" data-value="#D9D9D9"></div><div class="palette_color" style="background-color:#595959;" data-command="font_highlight_color" data-switch-button="true" data-value="#595959"></div><div class="palette_color" style="background-color:#ECD174;" data-command="font_highlight_color" data-switch-button="true" data-value="#ECD174"></div><div class="palette_color" style="background-color:#A6A7D8;" data-command="font_highlight_color" data-switch-button="true" data-value="#A6A7D8"></div><div class="palette_color" style="background-color:#C0CDEF;" data-command="font_highlight_color" data-switch-button="true" data-value="#C0CDEF"></div><div class="palette_color" style="background-color:#FFCEB0;" data-command="font_highlight_color" data-switch-button="true" data-value="#FFCEB0"></div><div class="palette_color" style="background-color:#E0E0E0;" data-command="font_highlight_color" data-switch-button="true" data-value="#E0E0E0"></div><div class="palette_color" style="background-color:#FFEF99;" data-command="font_highlight_color" data-switch-button="true" data-value="#FFEF99"></div><div class="palette_color" style="background-color:#9BE5C8;" data-command="font_highlight_color" data-switch-button="true" data-value="#9BE5C8"></div><div class="palette_color" style="background-color:#D8BEE4;" data-command="font_highlight_color" data-switch-button="true" data-value="#D8BEE4"></div>
                    </div><div class="color_group">
                        <div class="palette_color" style="background-color:#BFBFBF;" data-command="font_highlight_color" data-switch-button="true" data-value="#BFBFBF"></div><div class="palette_color" style="background-color:#404040;" data-command="font_highlight_color" data-switch-button="true" data-value="#404040"></div><div class="palette_color" style="background-color:#CEA61D;" data-command="font_highlight_color" data-switch-button="true" data-value="#CEA61D"></div><div class="palette_color" style="background-color:#7A7CC4;" data-command="font_highlight_color" data-switch-button="true" data-value="#7A7CC4"></div><div class="palette_color" style="background-color:#A0B4E6;" data-command="font_highlight_color" data-switch-button="true" data-value="#A0B4E6"></div><div class="palette_color" style="background-color:#FFB689;" data-command="font_highlight_color" data-switch-button="true" data-value="#FFB689"></div><div class="palette_color" style="background-color:#D1D1D1;" data-command="font_highlight_color" data-switch-button="true" data-value="#D1D1D1"></div><div class="palette_color" style="background-color:#FFE766;" data-command="font_highlight_color" data-switch-button="true" data-value="#FFE766"></div><div class="palette_color" style="background-color:#69D8AD;" data-command="font_highlight_color" data-switch-button="true" data-value="#69D8AD"></div><div class="palette_color" style="background-color:#C49DD6;" data-command="font_highlight_color" data-switch-button="true" data-value="#C49DD6"></div>
                    </div><div class="color_group">
                        <div class="palette_color" style="background-color:#A6A6A6;" data-command="font_highlight_color" data-switch-button="true" data-value="#A6A6A6"></div><div class="palette_color" style="background-color:#262626;" data-command="font_highlight_color" data-switch-button="true" data-value="#262626"></div><div class="palette_color" style="background-color:#67530E;" data-command="font_highlight_color" data-switch-button="true" data-value="#67530E"></div><div class="palette_color" style="background-color:#2B2D63;" data-command="font_highlight_color" data-switch-button="true" data-value="#2B2D63"></div><div class="palette_color" style="background-color:#3057B9;" data-command="font_highlight_color" data-switch-button="true" data-value="#3057B9"></div><div class="palette_color" style="background-color:#EB5800;" data-command="font_highlight_color" data-switch-button="true" data-value="#EB5800"></div><div class="palette_color" style="background-color:#858585;" data-command="font_highlight_color" data-switch-button="true" data-value="#858585"></div><div class="palette_color" style="background-color:#BFA100;" data-command="font_highlight_color" data-switch-button="true" data-value="#BFA100"></div><div class="palette_color" style="background-color:#1E7452;" data-command="font_highlight_color" data-switch-button="true" data-value="#1E7452"></div><div class="palette_color" style="background-color:#783E94;" data-command="font_highlight_color" data-switch-button="true" data-value="#783E94"></div>
                    </div><div class="color_group">
                        <div class="palette_color" style="background-color:#808080;" data-command="font_highlight_color" data-switch-button="true" data-value="#808080"></div><div class="palette_color" style="background-color:#0D0D0D;" data-command="font_highlight_color" data-switch-button="true" data-value="#0D0D0D"></div><div class="palette_color" style="background-color:#292106;" data-command="font_highlight_color" data-switch-button="true" data-value="#292106"></div><div class="palette_color" style="background-color:#1D1E42;" data-command="font_highlight_color" data-switch-button="true" data-value="#1D1E42"></div><div class="palette_color" style="background-color:#203A7B;" data-command="font_highlight_color" data-switch-button="true" data-value="#203A7B"></div><div class="palette_color" style="background-color:#9C3B00;" data-command="font_highlight_color" data-switch-button="true" data-value="#9C3B00"></div><div class="palette_color" style="background-color:#595959;" data-command="font_highlight_color" data-switch-button="true" data-value="#595959"></div><div class="palette_color" style="background-color:#806B00;" data-command="font_highlight_color" data-switch-button="true" data-value="#806B00"></div><div class="palette_color" style="background-color:#144E37;" data-command="font_highlight_color" data-switch-button="true" data-value="#144E37"></div><div class="palette_color" style="background-color:#502962;" data-command="font_highlight_color" data-switch-button="true" data-value="#502962"></div>
                    </div>
                </div>
                <div class="horizontal_line"></div>
                <div class="standard_color_palette" style="height: 13px;">
                    <div class="palette_color" style="background-color:#000000;" data-command="font_highlight_color" data-switch-button="true" data-value="#000000"></div><div class="palette_color" style="background-color:#FF0000;" data-command="font_highlight_color" data-switch-button="true" data-value="#FF0000"></div><div class="palette_color" style="background-color:#FF6600;" data-command="font_highlight_color" data-switch-button="true" data-value="#FF6600"></div><div class="palette_color on" style="background-color:#FFFF00;" data-command="font_highlight_color" data-switch-button="true" data-value="#FFFF00"></div><div class="palette_color" style="background-color:#BAFF1A;" data-command="font_highlight_color" data-switch-button="true" data-value="#BAFF1A"></div><div class="palette_color" style="background-color:#008000;" data-command="font_highlight_color" data-switch-button="true" data-value="#008000"></div><div class="palette_color" style="background-color:#42C7F1;" data-command="font_highlight_color" data-switch-button="true" data-value="#42C7F1"></div><div class="palette_color" style="background-color:#0000FF;" data-command="font_highlight_color" data-switch-button="true" data-value="#0000FF"></div><div class="palette_color" style="background-color:#1B1760;" data-command="font_highlight_color" data-switch-button="true" data-value="#1B1760"></div><div class="palette_color" style="background-color:#800080;" data-command="font_highlight_color" data-switch-button="true" data-value="#800080"></div>
                </div>
            </div>
            <div class="spectrum_color_content">
                <div class="normal_panel spectrum_color_info">
                    <div class="inline_panel">
                        <div class="normal_panel align_item_center">
                            <div class="inline_panel fit_size preview_color_block" style="background-color: rgb(255, 255, 0);"></div>
                            <div class="inline_panel">
                                <div class="preview_color_text input_text_wrap full_size input_wrap view_border_underline" data-command="font_highlight_color" data-non-exec="true" data-org-color="#FFFF00">
                                    <span class="text_icon">#</span>
                                    <input type="text" spellcheck="false" maxlength="6">
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="spectrum_color_confirm has_desc fit_size no_icon btn_text view_border_all" data-command="font_highlight_color">
                        <span>확인</span>
                    </button>
                </div>
                <div class="color_spectrum_container">
                    <div class="color_spectrum_picker" style="width:204px;height:4px;">
                        <div class="color_spectrum_pointer" style="left: 34px;"></div>
                        <div class="color_spectrum_bgcolor"></div>
                    </div>
                </div>
                <div class="color_matrix_container">
                    <div class="color_matrix_picker" style="width: 204px; height: 132px; background-color: rgb(255, 255, 0);">
                        <div class="color_matrix_pointer" style="left: 204px; top: 0px;">
                            <div class="color_matrix_shape shape_1"></div>
                            <div class="color_matrix_shape shape_2"></div>
                        </div>
                        <div class="color_matrix_bgcolor bgcolor_1"></div>
                        <div class="color_matrix_bgcolor bgcolor_2"></div>
                    </div>
                </div>
            </div>
        </div></div></div>
        <div class="vertical_line_wrap">
        	<div class="col_line"></div>
       	</div>
       	<div class="p_align align_justify btn_wo btn_wo_fn btn_icon align_list on" data-switch-button="true" title="양쪽 정렬" data-value="both" data-command="p_align">
       		<a><div class="align_justify btn_icon_inner"></div>
       		</a></div>
    	<div class="p_align align_left btn_wo btn_wo_fn btn_icon" data-switch-button="true" title="왼쪽 정렬" data-value="left" data-command="p_align">
    		<a><div class="align_left btn_icon_inner"></div></a>
   		</div>
   		<div class="p_align align_center btn_wo btn_wo_fn btn_icon" data-switch-button="true" title="가운데 정렬" data-value="center" data-command="p_align"><a><div class="align_center btn_icon_inner"></div></a></div><div class="p_align align_right btn_wo btn_wo_fn btn_icon" data-switch-button="true" title="오른쪽 정렬" data-value="right" data-command="p_align"><a><div class="align_right btn_icon_inner"></div></a></div><div class="p_align align_distribute btn_wo btn_wo_fn btn_icon" data-switch-button="true" title="배분 정렬" data-value="distribute" data-command="p_align"><a><div class="align_distribute btn_icon_inner"></div></a></div><div class="p_align align_divide btn_wo btn_wo_fn btn_icon" data-switch-button="true" title="나눔 정렬" data-value="divide" data-command="p_align"><a><div class="align_divide btn_icon_inner"></div></a></div><div class="vertical_line_wrap"><div class="col_line"></div></div><div class="p_line_spacing btn_combo btn_wo btn_wo_fn medium_size text_dropdown input_wrap" title="줄 간격" data-arrow-direction="down" data-match-type="block"><a class="p_line_spacing input_text_wrap input_wrap view_border_none" data-command="p_line_spacing" data-value-key="line_spacing"><div class="p_line_spacing btn_icon_inner"></div><input type="text" class="focus" autocomplete="off"><span class="unit">%</span></a><a class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"></a><div class="menu_select_list" title=""><div class="p_line_spacing dropdown_data no_icon" data-switch-button="true" title="100 %" data-value="100" data-unit="%" data-command="p_line_spacing" data-value-key="line_spacing" data-match="percent">100</div><div class="p_line_spacing dropdown_data no_icon" data-switch-button="true" title="130 %" data-value="130" data-unit="%" data-command="p_line_spacing" data-value-key="line_spacing" data-match="percent">130</div><div class="p_line_spacing dropdown_data no_icon on" data-switch-button="true" title="160 %" data-value="160" data-unit="%" data-command="p_line_spacing" data-value-key="line_spacing" data-match="percent">160</div><div class="p_line_spacing dropdown_data no_icon" data-switch-button="true" title="180 %" data-value="180" data-unit="%" data-command="p_line_spacing" data-value-key="line_spacing" data-match="percent">180</div><div class="p_line_spacing dropdown_data no_icon" data-switch-button="true" title="200 %" data-value="200" data-unit="%" data-command="p_line_spacing" data-value-key="line_spacing" data-match="percent">200</div><div class="p_line_spacing dropdown_data no_icon" data-switch-button="true" title="300 %" data-value="300" data-unit="%" data-command="p_line_spacing" data-value-key="line_spacing" data-match="percent">300</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="3 pt" data-value="3" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">3</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="6 pt" data-value="6" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">6</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="10 pt" data-value="10" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">10</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="13 pt" data-value="13" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">13</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="16 pt" data-value="16" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">16</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="18 pt" data-value="18" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">18</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="20 pt" data-value="20" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">20</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="30 pt" data-value="30" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">30</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="40 pt" data-value="40" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">40</div><div class="p_line_spacing dropdown_data no_icon hide_view" data-switch-button="true" title="50 pt" data-value="50" data-unit="pt" data-command="p_line_spacing" data-value-key="line_spacing" data-match="pt">50</div></div></div><div class="vertical_line_wrap"><div class="col_line"></div></div><div class="p_list number_list btn_combo btn_wo btn_wo_fn icon_combo" title="문단 번호 매기기" data-value="number" data-arrow-direction="down"><a data-command="p_list" data-value-key="paranum_list"><div class="number_list btn_icon_inner"></div><span></span></a><a class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"></a><div class="menu_select_list button_grid" title="" style="width: 244px;"><div class="p_list number_list2_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="1" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list2_hwp btn_icon_inner"></div></a></div><div class="p_list number_list3_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="2" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list3_hwp btn_icon_inner"></div></a></div><div class="p_list number_list4_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="3" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list4_hwp btn_icon_inner"></div></a></div><div class="p_list number_list5_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="4" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list5_hwp btn_icon_inner"></div></a></div><div class="p_list number_list6_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="5" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list6_hwp btn_icon_inner"></div></a></div><div class="p_list number_list7_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="6" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list7_hwp btn_icon_inner"></div></a></div><div class="p_list number_list8_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="7" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list8_hwp btn_icon_inner"></div></a></div><div class="p_list number_list9_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="8" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list9_hwp btn_icon_inner"></div></a></div><div class="p_list number_list10_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="9" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list10_hwp btn_icon_inner"></div></a></div><div class="p_list number_list11_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="10" data-command="p_list" data-value-key="paranum_list"><a><div class="number_list11_hwp btn_icon_inner"></div></a></div></div></div><div class="p_list bullet_list btn_combo btn_wo btn_wo_fn icon_combo" title="글머리표 매기기" data-value="bullet" data-arrow-direction="down"><a data-command="p_list" data-value-key="bullet_list"><div class="bullet_list btn_icon_inner"></div><span></span></a><a class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"></a><div class="menu_select_list button_grid" title="" style="width: 244px;"><div class="p_list bullet_list2_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="1" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list2_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list3_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="2" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list3_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list4_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="3" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list4_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list5_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="4" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list5_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list6_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="5" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list6_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list7_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="6" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list7_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list8_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="7" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list8_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list9_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="8" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list9_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list10_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="9" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list10_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list11_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="10" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list11_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list12_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="11" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list12_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list13_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="12" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list13_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list14_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="13" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list14_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list15_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="14" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list15_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list16_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="15" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list16_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list17_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="16" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list17_hwp btn_icon_inner"></div></a></div><div class="p_list bullet_list18_hwp xlarge_size btn_wo btn_wo_fn btn_icon" data-switch-button="true" data-value="17" data-command="p_list" data-value-key="bullet_list"><a><div class="bullet_list18_hwp btn_icon_inner"></div></a></div></div></div><div class="vertical_line_wrap"><div class="col_line"></div></div><div class="p_level_increase btn_wo btn_wo_fn btn_icon" title="한 수준 증가" data-command="p_level_increase"><a><div class="p_level_increase btn_icon_inner"></div></a></div><div class="p_level_decrease btn_wo btn_wo_fn btn_icon" title="한 수준 감소" data-command="p_level_decrease"><a><div class="p_level_decrease btn_icon_inner"></div></a></div></div></div>
   		
	<div id="container" class="" style="overflow:auto; height: 100%">
	    <div id="document" class="document container_view note-editor note-frame panel" style="overflow: auto;background: none; width:100%; border: none;">
	   		<!-- 작성되는 부분 -->
			    <div class="note-editing-area" style="border: none;">
			        <div class="note-handle">
			            <div class="note-control-selection">
			                <div class="note-control-selection-bg"></div>
			                <div class="note-control-holder note-control-nw"></div>
			                <div class="note-control-holder note-control-ne"></div>
			                <div class="note-control-holder note-control-sw"></div>
			                <div class="note-control-sizing note-control-se"></div>
			                <div class="note-control-selection-info"></div>
			            </div>
			        </div>
			        <!-- 양식 html -->
			        <%-- <textarea class="note-codable" aria-multiline="true" style="height: 153.547px;">
			        	<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic,dotum,arial,tahoma; border-collapse: collapse;"><!-- Data1 --> 
						     <colgroup> 
						      <col width="120"> 
						      <col width="280"> 
						      <col width="120"> 
						      <col width="280"> 
						     </colgroup> 
						     
							<tbody>
								<tr>
									<td style="background: none; padding: 5px; border: none; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;" colspan="4" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
										<br>다음과 같이 직매장 <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{text$width:100$}}" data-wrapper="" style="width: 100px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>점을 오픈하고자 하오니 검토 후 재가 바랍니다.<br>
									</td>
								</tr>
								<tr>
									<td style="background: none; padding: 5px; border: none; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;" colspan="4" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
										<br>■ 매장정보<br>
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 매 장 명 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 유통형태 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{radio_라디오_쇼핑몰_로드샵}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="editor_opt" type="radio" name="" value="라디오"><label class="editor_label">라디오</label><input class="editor_opt" type="radio" name="" value="쇼핑몰"><label class="editor_label">쇼핑몰</label><input class="editor_opt" type="radio" name="" value="로드샵"><label class="editor_label">로드샵</label><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 상세주소 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 임 대 인 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
									</td>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 사업자등록번호 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 업 &nbsp;&nbsp;&nbsp; 태 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="9" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
									</td>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 업 &nbsp;&nbsp;&nbsp; 종 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="10" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="10" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 오픈예정일 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="11" data-dsl="{{calendar}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_date" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="11" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 계약기간 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="12" data-dsl="{{period}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_date" type="text"> ~ <input class="ipt_editor ipt_editor_date" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="12" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 계약면적 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="13" data-dsl="{{number}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_num" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="13" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;㎡ 
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 보 증 금 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="14" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="14" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>만원
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 수수료 및 임차료 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="15" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="15" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 관 리 비 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="16" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="16" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 인테리어 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="17" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="17" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 집 &nbsp;&nbsp;&nbsp; 기 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="18" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="18" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 기타사항 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="19" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="19" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 초도물량 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="20" data-dsl="{{number}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_num" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="20" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;pcs
									</td>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 소비자가 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="21" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="21" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 판 매 가 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="22" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="22" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 원 &nbsp;&nbsp;&nbsp; 가 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="23" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="23" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 BEP 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="24" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="24" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
								</tr>
								<tr>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 예상매출 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										
						월 <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="25" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="25" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
									<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
										
						 예상매출 
									</td>
									<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
										
						년 <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="26" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="26" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
									</td>
								</tr>
							</tbody>
						</table>
			        </textarea> --%>
			        <!-- 실작성영역 -->
			        <div class="note-editable" contenteditable="true" role="textbox" aria-multiline="true" spellcheck="true"
			            autocorrect="true" style="height: 100%; weight: 100%; border:none;">
			            	<%-- <c:out value="" escapeXml="false"></c:out> --%>
            <!-- <div id="hcwoViewScroll" style="position: fixed; overflow: auto; width: 100%; height: 100%;">
	            <div id="hcwoViewScrollHorizontal" style="position: absolute; height: 1px; width: 100%;"></div>
	            <div id="hcwoViewScrollVertical" style="position: absolute; width: 1px; height: 100%;"></div>
	        </div>  -->
			        </div>
    		</div>
	   		<%-- <canvas id="PaperCanvas" width="1652"
	            height="100%"
	            style="position: fixed; height: 484px; width: 826px; background-color: transparent;"></canvas>
          	<canvas id="EditCanvas" width="1552" height="968" style="position: fixed; height: 100%; width: 100%; background: white; margin:0px auto;"></canvas>
	        <div id="hcwoViewScroll" style="position: fixed; overflow: auto; width: 100%; height: 484px;">
	            <div id="hcwoViewScrollHorizontal" style="position: absolute; height: 1px; width: 833px;"></div>
	            <div id="hcwoViewScrollVertical" style="position: absolute; width: 1px; height: 1162px;"></div>
	        </div> 
	        <div id="HWP_CURSOR_VIEW" class="BLINK_CURSOR"
	            style="position: relative; left: 153px; top: 152px; border: 0px solid black; padding: 0px; margin: 0px; background: rgb(0, 0, 0); width: 2px; height: 14px; outline: 0px; overflow: hidden;">
	            <input id="ImeWrapper_Elm" type="text" autocomplete="off" style="width: 10pt; height: 10pt; border: 0px none black; padding: 0px; margin: 0px; font-size: 10pt; background: rgb(255, 255, 255); color: rgb(0, 0, 0); outline: 0px; animation: auto ease 0s 1 normal none running none; position: relative; left: -20pt;">
	            --%>
    
    <div class="modal note-modal link-dialog" aria-hidden="false" tabindex="-1" role="dialog" aria-label="Insert Link">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        aria-hidden="true">×</button>
                    <h4 class="modal-title">Insert Link</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group note-form-group"><label for="note-dialog-link-txt-17200779975331"
                            class="note-form-label">Text to display</label><input
                            id="note-dialog-link-txt-17200779975331"
                            class="note-link-text form-control note-form-control note-input" type="text"></div>
                    <div class="form-group note-form-group"><label for="note-dialog-link-url-17200779975331"
                            class="note-form-label">To what URL should this link go?</label><input
                            id="note-dialog-link-url-17200779975331"
                            class="note-link-url form-control note-form-control note-input" type="text" value="http://">
                    </div>
                    <div class="checkbox sn-checkbox-open-in-new-window"><label><input type="checkbox" checked=""
                                aria-checked="true">Open in new window</label></div>
                    <div class="checkbox sn-checkbox-use-protocol"><label><input type="checkbox" checked=""
                                aria-checked="true">Use default protocol</label></div>
                </div>
                <div class="modal-footer"><input type="button" href="#"
                        class="btn btn-primary note-btn note-btn-primary note-link-btn" value="Insert Link" disabled="">
                </div>
            </div>
        </div>
    </div>
    <div class="note-popover popover in note-link-popover bottom">
        <div class="arrow"></div>
        <div class="popover-content note-children-container"><span><a target="_blank"></a>&nbsp;</span>
            <div class="note-btn-group btn-group note-link"><button type="button"
                    class="note-btn btn btn-default btn-sm" tabindex="-1" title="" aria-label="Edit"
                    data-original-title="Edit"><i class="note-icon-link"></i></button><button type="button"
                    class="note-btn btn btn-default btn-sm" tabindex="-1" title="" aria-label="Unlink"
                    data-original-title="Unlink"><i class="note-icon-chain-broken"></i></button></div>
        </div>
    </div>
    <div class="modal note-modal" aria-hidden="false" tabindex="-1" role="dialog" aria-label="Insert Image">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        aria-hidden="true">×</button>
                    <h4 class="modal-title">Insert Image</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group note-form-group note-group-select-from-files"><label
                            for="note-dialog-image-file-17200779975331" class="note-form-label">Select from
                            files</label><input id="note-dialog-image-file-17200779975331"
                            class="note-image-input form-control-file note-form-control note-input" type="file"
                            name="files" accept="image/*" multiple="multiple"></div>
                    <div class="form-group note-group-image-url"><label for="note-dialog-image-url-17200779975331"
                            class="note-form-label">Image URL</label><input id="note-dialog-image-url-17200779975331"
                            class="note-image-url form-control note-form-control note-input" type="text"></div>
                </div>
                <div class="modal-footer"><input type="button" href="#"
                        class="btn btn-primary note-btn note-btn-primary note-image-btn" value="Insert Image"
                        disabled=""></div>
            </div>
        </div>
    </div>
    <div class="note-popover popover in note-image-popover bottom">
        <div class="arrow"></div>
        <div class="popover-content note-children-container">
            <div class="note-btn-group btn-group note-resize"><button type="button"
                    class="note-btn btn btn-default btn-sm" tabindex="-1" title="" aria-label="Resize full"
                    data-original-title="Resize full"><span class="note-fontsize-10">100%</span></button><button
                    type="button" class="note-btn btn btn-default btn-sm" tabindex="-1" title=""
                    aria-label="Resize half" data-original-title="Resize half"><span
                        class="note-fontsize-10">50%</span></button><button type="button"
                    class="note-btn btn btn-default btn-sm" tabindex="-1" title="" aria-label="Resize quarter"
                    data-original-title="Resize quarter"><span class="note-fontsize-10">25%</span></button><button
                    type="button" class="note-btn btn btn-default btn-sm" tabindex="-1" title=""
                    aria-label="Original size" data-original-title="Original size"><i
                        class="note-icon-rollback"></i></button></div>
            <div class="note-btn-group btn-group note-float"><button type="button"
                    class="note-btn btn btn-default btn-sm" tabindex="-1" title="" aria-label="Float Left"
                    data-original-title="Float Left"><i class="note-icon-float-left"></i></button><button type="button"
                    class="note-btn btn btn-default btn-sm" tabindex="-1" title="" aria-label="Float Right"
                    data-original-title="Float Right"><i class="note-icon-float-right"></i></button><button
                    type="button" class="note-btn btn btn-default btn-sm" tabindex="-1" title=""
                    aria-label="Remove float" data-original-title="Remove float"><i
                        class="note-icon-rollback"></i></button></div>
            <div class="note-btn-group btn-group note-remove"><button type="button"
                    class="note-btn btn btn-default btn-sm" tabindex="-1" title="" aria-label="Remove Image"
                    data-original-title="Remove Image"><i class="note-icon-trash"></i></button></div>
        </div>
    </div>
    <div class="note-popover popover in note-table-popover bottom">
        <div class="arrow"></div>
        <div class="popover-content note-children-container">
            <div class="note-btn-group btn-group note-add"><button type="button"
                    class="note-btn btn btn-default btn-sm btn-md" tabindex="-1" title="" aria-label="Add row below"
                    data-original-title="Add row below"><i class="note-icon-row-below"></i></button><button
                    type="button" class="note-btn btn btn-default btn-sm btn-md" tabindex="-1" title=""
                    aria-label="Add row above" data-original-title="Add row above"><i
                        class="note-icon-row-above"></i></button><button type="button"
                    class="note-btn btn btn-default btn-sm btn-md" tabindex="-1" title="" aria-label="Add column left"
                    data-original-title="Add column left"><i class="note-icon-col-before"></i></button><button
                    type="button" class="note-btn btn btn-default btn-sm btn-md" tabindex="-1" title=""
                    aria-label="Add column right" data-original-title="Add column right"><i
                        class="note-icon-col-after"></i></button></div>
            <div class="note-btn-group btn-group note-delete"><button type="button"
                    class="note-btn btn btn-default btn-sm btn-md" tabindex="-1" title="" aria-label="Delete row"
                    data-original-title="Delete row"><i class="note-icon-row-remove"></i></button><button type="button"
                    class="note-btn btn btn-default btn-sm btn-md" tabindex="-1" title="" aria-label="Delete column"
                    data-original-title="Delete column"><i class="note-icon-col-remove"></i></button><button
                    type="button" class="note-btn btn btn-default btn-sm btn-md" tabindex="-1" title=""
                    aria-label="Delete table" data-original-title="Delete table"><i
                        class="note-icon-trash"></i></button></div>
        </div>
    </div>
    <div class="modal note-modal" aria-hidden="false" tabindex="-1" role="dialog" aria-label="Insert Video">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        aria-hidden="true">×</button>
                    <h4 class="modal-title">Insert Video</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group note-form-group row-fluid"><label for="note-dialog-video-url-17200779975331"
                            class="note-form-label">Video URL <small class="text-muted">(YouTube, Vimeo, Vine,
                                Instagram, DailyMotion or Youku)</small></label><input
                            id="note-dialog-video-url-17200779975331"
                            class="note-video-url form-control note-form-control note-input" type="text"></div>
                </div>
                <div class="modal-footer"><input type="button" href="#"
                        class="btn btn-primary note-btn note-btn-primary note-video-btn" value="Insert Video"
                        disabled=""></div>
            </div>
        </div>
    </div>
    <div class="modal note-modal" aria-hidden="false" tabindex="-1" role="dialog" aria-label="Help">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        aria-hidden="true">×</button>
                    <h4 class="modal-title">Help</h4>
                </div>
                <div class="modal-body" style="max-height: 300px; overflow: scroll;">
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>ESC</kbd></label><span>Escape</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>ENTER</kbd></label><span>Insert Paragraph</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+Z</kbd></label><span>Undo the last
                        command</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+SHIFT+Z</kbd></label><span>Redo the last
                        command</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>TAB</kbd></label><span>Tab</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>SHIFT+TAB</kbd></label><span>Untab</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+B</kbd></label><span>Set a bold style</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+I</kbd></label><span>Set a italic
                        style</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+U</kbd></label><span>Set a underline
                        style</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+SHIFT+S</kbd></label><span>Set a
                        strikethrough style</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+BACKSLASH</kbd></label><span>Clean a
                        style</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+SHIFT+L</kbd></label><span>Set left
                        align</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+SHIFT+E</kbd></label><span>Set center
                        align</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+SHIFT+R</kbd></label><span>Set right
                        align</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+SHIFT+J</kbd></label><span>Set full
                        align</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+SHIFT+NUM7</kbd></label><span>Toggle
                        unordered list</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+SHIFT+NUM8</kbd></label><span>Toggle ordered
                        list</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+LEFTBRACKET</kbd></label><span>Outdent on
                        current paragraph</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+RIGHTBRACKET</kbd></label><span>Indent on
                        current paragraph</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+NUM0</kbd></label><span>Change current
                        block's format as a paragraph(P tag)</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+NUM1</kbd></label><span>Change current
                        block's format as H1</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+NUM2</kbd></label><span>Change current
                        block's format as H2</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+NUM3</kbd></label><span>Change current
                        block's format as H3</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+NUM4</kbd></label><span>Change current
                        block's format as H4</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+NUM5</kbd></label><span>Change current
                        block's format as H5</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+NUM6</kbd></label><span>Change current
                        block's format as H6</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+ENTER</kbd></label><span>Insert horizontal
                        rule</span>
                    <div class="help-list-item"></div><label
                        style="width: 180px; margin-right: 10px;"><kbd>CMD+K</kbd></label><span>Show Link Dialog</span>
                </div>
                <div class="modal-footer">
                    <p class="text-center"><a href="http://summernote.org/" target="_blank">Summernote 0.8.18</a> · <a
                            href="https://github.com/summernote/summernote" target="_blank">Project</a> · <a
                            href="https://github.com/summernote/summernote/issues" target="_blank">Issues</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
	    </div>
	    <div class="message_bar normal_panel hide_view" data-name="message_bar">
	        <div class="normal_panel">
	            <div class="message_box normal_panel" data-name="message_box">
	                <div class="progress fit_size inline_panel" data-name="progress">
	                    <div class="loading normal_panel" data-name="loading"></div>
	                </div>
	                <div class="message inline_panel" data-name="message"></div>
	                <div class="button_box fit_size inline_panel" data-name="button_box">
	                    <div class="e_refresh btn_wo btn_wo_fn btn_icon view_border_none" data-command="e_refresh"><a>
	                            <div class="e_refresh btn_icon_inner"></div>
	                        </a></div>
	                    <div class="close btn_wo btn_wo_fn btn_icon view_border_none" data-ui-command="hide"
	                        data-ui-value="message_bar"><a>
	                            <div class="close btn_icon_inner"></div>
	                        </a></div>
	                </div>
	            </div>
	            <div class="dla_box normal_panel" data-name="dla_box" style="margin: -5px 0px 15px;">
	                <div class="dont_look_again_btn checkbox_wrap input_wrap focus" data-ui-command="dont_look_again"
	                    style="margin: 0px;"><label><input type="checkbox"><span>다시 보지 않기</span></label></div>
	            </div>
	        </div>
	    </div>
	</div>
		<div id="status_bar" class="status_bar container_view">
    <div class="normal_panel">
        <div class="status_page inline_panel align_item_center fit_size" data-name="status_page"
            style="margin: 0px 0px 0px 10px;">
            <div class="normal_panel">
                <div class="cur_page inline_panel fit_size" data-name="cur_page">1</div>
                <div class="inline_panel fit_size" style="margin: 0px 4px;">/</div>
                <div class="total_page inline_panel fit_size" data-name="total_page">1</div>
                <div class="inline_panel fit_size" style="margin: 0px 0px 0px 4px;">쪽</div>
                <div class="vertical_line_wrap">
                    <div class="col_line"></div>
                </div>
                <div class="inline_panel fit_size">구역</div>
                <div class="inline_panel fit_size" style="margin: 0px 3px;">:</div>
                <div class="section inline_panel fit_size" data-name="section" style="margin: 0px 0px 0px 4px;">1 / 1
                </div>
                <div class="vertical_line_wrap">
                    <div class="col_line"></div>
                </div>
                <div class="insert_mode inline_panel fit_size" data-name="insert_mode" style="margin: 0px 0px 0px 4px;">
                    삽입</div>
                <div class="vertical_line_wrap">
                    <div class="col_line"></div>
                </div>
                <div class="inline_panel fit_size" style="margin: 0px 0px 0px 4px;"></div>
            </div>
        </div>
        <div class="inline_panel justify_right align_item_center">
            <div class="e_zoom zoom_fit_width btn_wo btn_wo_fn btn_icon" title="폭 맞춤" data-value="fitWidth"
                data-command="e_zoom"><a>
                    <div class="zoom_fit_width btn_icon_inner"></div>
                </a></div>
            <div class="e_zoom zoom_fit btn_wo btn_wo_fn btn_icon" title="쪽 맞춤" data-value="fitInWindow"
                data-command="e_zoom"><a>
                    <div class="zoom_fit btn_icon_inner"></div>
                </a></div>
            <div class="vertical_line_wrap">
                <div class="col_line"></div>
            </div>
            <div class="e_view_scale btn_dropdown btn_wo btn_wo_fn medium_size text_dropdown no_icon has_desc"
                data-arrow-direction="down"><a data-ui-command="dropdown">100%</a><a
                    class="btn_combo_arrow arrow_direction_down" data-ui-command="dropdown"></a>
                <div class="menu_select_list" title="">
                    <div class="e_view_scale dropdown_data no_icon" data-switch-button="true" data-value="fitInWindow"
                        data-command="e_view_scale">쪽 맞춤</div>
                    <div class="e_view_scale dropdown_data no_icon" data-switch-button="true" data-value="fitWidth"
                        data-command="e_view_scale">폭 맞춤</div>
                    <div class="e_view_scale dropdown_data no_icon" data-switch-button="true" data-value="50"
                        data-command="e_view_scale">50%</div>
                    <div class="e_view_scale dropdown_data no_icon" data-switch-button="true" data-value="75"
                        data-command="e_view_scale">75%</div>
                    <div class="e_view_scale dropdown_data no_icon" data-switch-button="true" data-value="100"
                        data-command="e_view_scale">100%</div>
                    <div class="e_view_scale dropdown_data no_icon" data-switch-button="true" data-value="125"
                        data-command="e_view_scale">125%</div>
                    <div class="e_view_scale dropdown_data no_icon" data-switch-button="true" data-value="150"
                        data-command="e_view_scale">150%</div>
                    <div class="e_view_scale dropdown_data no_icon" data-switch-button="true" data-value="200"
                        data-command="e_view_scale">200%</div>
                    <div class="e_view_scale dropdown_data no_icon" data-switch-button="true" data-value="300"
                        data-command="e_view_scale">300%</div>
                </div>
            </div>
            <div class="e_zoom zoom_out btn_wo btn_wo_fn btn_icon" title="축소" data-value="zoom_out"
                data-command="e_zoom" style="margin: 0px 8px;"><a>
                    <div class="zoom_out btn_icon_inner"></div>
                </a></div>
            <div class="e_zoom zoom_in btn_wo btn_wo_fn btn_icon" title="확대" data-value="zoom_in" data-command="e_zoom">
                <a>
                    <div class="zoom_in btn_icon_inner"></div>
                </a></div>
        </div>
    </div>
</div>

</body>
<script>
    $(document).ready(function() {
    	$('#summernote').summernote({
    		code: '<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic,dotum,arial,tahoma; border-collapse: collapse;"><!-- Data1 --> 
    		     <colgroup> 
    	      <col width="120"> 
    	      <col width="280"> 
    	      <col width="120"> 
    	      <col width="280"> 
    	     </colgroup> 
    	     
    		<tbody>
    			<tr>
    				<td style="background: none; padding: 5px; border: none; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;" colspan="4" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"><br>다음과 같이 직매장 <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{text$width:100$}}" data-wrapper="" style="width: 100px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>점을 오픈하고자 하오니 검토 후 재가 바랍니다.<br>
    				</td>
    			</tr>
    			<tr>
    				<td style="background: none; padding: 5px; border: none; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;" colspan="4" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
    					<br>■ 매장정보<br>
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 매 장 명 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 유통형태 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{radio_라디오_쇼핑몰_로드샵}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="editor_opt" type="radio" name="" value="라디오"><label class="editor_label">라디오</label><input class="editor_opt" type="radio" name="" value="쇼핑몰"><label class="editor_label">쇼핑몰</label><input class="editor_opt" type="radio" name="" value="로드샵"><label class="editor_label">로드샵</label><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 상세주소 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 임 대 인 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
    				</td>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 사업자등록번호 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 업 &nbsp;&nbsp;&nbsp; 태 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="9" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
    				</td>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 업 &nbsp;&nbsp;&nbsp; 종 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="10" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="10" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 오픈예정일 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="11" data-dsl="{{calendar}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_date" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="11" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 계약기간 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="12" data-dsl="{{period}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_date" type="text"> ~ <input class="ipt_editor ipt_editor_date" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="12" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 계약면적 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="13" data-dsl="{{number}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_num" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="13" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;㎡ 
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 보 증 금 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="14" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="14" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>만원
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 수수료 및 임차료 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="15" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="15" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 관 리 비 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="16" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="16" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 인테리어 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="17" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="17" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 집 &nbsp;&nbsp;&nbsp; 기 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="18" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="18" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 기타사항 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="19" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="19" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 초도물량 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="20" data-dsl="{{number}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_num" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="20" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;pcs
    				</td>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 소비자가 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="21" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="21" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 판 매 가 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="22" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="22" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 원 &nbsp;&nbsp;&nbsp; 가 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="23" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="23" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 BEP 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;" colspan="3">
    					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="24" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="24" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    			</tr>
    			<tr>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 예상매출 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					
    	월 <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="25" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="25" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    				<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
    					
    	 예상매출 
    				</td>
    				<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
    					
    	년 <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="26" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="26" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;만원
    				</td>
    			</tr>
    		</tbody>
    	</table>'
    	});
  	});
</script>
 </html>