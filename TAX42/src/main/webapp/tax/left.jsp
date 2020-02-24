<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <link href="../css/nsfw/css.css" rel="stylesheet" type="text/css"/>
    <link href="../css/nsfw/style.css" rel="stylesheet" type="text/css"/>
    <script src="../js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
   <script type="text/javascript" src="../js/hxjzg.js"></script>
    <script type="text/javascript">
        //隐藏菜单
        $(document).ready(function () {
            $("dt a").click(function () {
                var cur = $(this);
                cur.parent().next().toggle(700);
                var cur_dl = cur.parent().parent();
                doRemoveCurClass();
                $(cur_dl).addClass("curr");
            });

            $("dd a").each(function () {
                $(this).bind("click", function () {
                    doRemoveCurClass();
                    $(this).addClass("cur");
                });
            });
           
        });

        function doRemoveCurClass() {
            $("dl").each(function () {
                $(this).removeClass("curr");
                $("dd a").each(function () {
                    $(this).removeClass("cur");
                });
            });
        }

        function closeOtherDD(id) {
            $("dd").each(function () {
                if ($(this).attr("id") != id + "dd") {
                    $(this).hide(700);
                }
            });
        }
    </script>
    <!--[if IE 6]>
    <script type="text/javascript" src="${basePath}js/DD_belatedPNG.js"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('b, s, img, span, .prev, .next, a, input,');
    </script>
    <![endif]-->
    <style>
        * {
            scrollbar-face-color: #dee3e7; /*立体滚动条的颜色（包括箭头部分的背景色）*/
            scrollbar-highlight-color: #ffffff; /*滚动条的高亮颜色（左阴影？）*/
            scrollbar-shadow-color: #dee3e7; /*立体滚动条阴影的颜色*/
            scrollbar-3dlight-color: #eceaea; /*立体滚动条亮边的颜色*/
            scrollbar-arrow-color: #006699; /*三角箭头的颜色*/
            scrollbar-track-color: #efefef; /*立体滚动条背景颜色*/
            scrollbar-darkshadow-color: #eceaea; /*滚动条的基色*/
        }
    </style>
</head>

<body>
<div class="xzfw" style="width: 210px;">
    <div class="xzfw_nav" style="width:214px;min-height:500px;">
        <div class="nBox" style="width:214px;">
            <div class="x_top" style="width:214px;"></div>
            <div class="sm">
				<dl class="">
                    <dt><a class="yh" href="role/listUI.jsp" target="mainFrame"><b></b>角色管理<s class="down"></s>
                    </a></dt>
                </dl>
                <dl class="">
                    <dt><a class="yh" href="user/listUI.jsp" target="mainFrame"><b></b>用户管理<s class="down"></s>
                    </a></dt>
                </dl>

                <dl>
                    <dt><a class="xxfb" href="info/listUI.html" target="mainFrame"><b></b>信息发布管理<s class="down"></s> </a></dt>
                </dl>
                <dl class="">
                    <dt><a class="tssl" href="${pageContext.request.contextPath }/complain/selectAll" target="mainFrame"><b></b>投诉受理管理<s
                            class="down"></s> </a></dt>
                </dl>
                <dl class="">
                    <dt><a class="nszx" href="advisory/listUI.jsp" target="mainFrame"><b></b>纳税咨询管理<s class="down"></s> </a></dt>
                </dl>
                <dl class="">
                    <dt><a class="nszx" href="impart/listUI.jsp" target="mainFrame"><b></b>易告知管理<s class="down"></s> </a></dt>
                </dl>
                <dl class="">
                    <dt><a class="fwdc" href="qsurvey/listUI.jsp" target="mainFrame"><b></b>服务调查管理<s class="down"></s> </a></dt>
                </dl>
                <dl class="">
                    <dt><a class="fwyy" style="cursor: pointer;"><b></b>服务预约管理<s class="down"></s> </a></dt>
                    <dd id="fwyygl" style="display:none;">
                       

                             <a class="" href="${pageContext.request.contextPath}/Sub/query" target="mainFrame"><b></b>预约服务</a>
                        <a class="" href="reserveItem/listUI.jsp" target="mainFrame"><b></b>预约事项</a>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</div>
</body>
</html>


