<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>问卷调查</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../js/jquery/jquery-3.1.1.min.js"></script>
    <link href="../css/home.css" rel="stylesheet" type="text/css" />
    <link href="../css/skin1.css" rel="stylesheet" type="text/css" />

</head>
<body align="center">
<!-- 头部{ -->
<table width="1222" border="0" align="center" cellpadding="0"
       cellspacing="0" background="../images/home/top_bg.png" class="top">
    <tr>
        <td width="32" height="106">&nbsp;</td>
        <td width="418" height="106" align="left" valign="middle">
            <img class="zxx_test_png" src="../images/home/ind01.png" width="470" height="90" alt="" />
        </td>
        <td width="211">&nbsp;</td>
        <td width="328">
            <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="450" height="86">
                <param name="movie" value="../images/home/flash.swf" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <param name="swfversion" value="6.0.65.0" />
                <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
                <param name="expressinstall" value="Scripts/expressInstall.swf" />
                <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="../images/home/flash.swf"
                        width="380" height="86">
                    <!--<![endif]-->
                    <param name="quality" value="high" />
                    <param name="wmode" value="transparent" />
                    <param name="swfversion" value="6.0.65.0" />
                    <param name="expressinstall" value="Scripts/expressInstall.swf" />
                    <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
                    <div>
                        <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
                        <p>
                            <a href="http://www.adobe.com/go/getflashplayer"><img
                                    src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
                                    alt="获取 Adobe Flash Player" width="112" height="33" />
                            </a>
                        </p>
                    </div>
                    <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
        </td>
        <td width="331" align="right" valign="top">
            <table width="350" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="64" height="4"></td>
                    <td width="25" height="5"></td>
                    <td width="120" height="4"></td>
                    <td width="25" height="4"></td>
                    <td width="40" height="4"></td>
                    <td width="25" height="4"></td>
                    <td width="50" height="4"></td>
                </tr>
                <tr>
                    <td align="center"></td>
                    <td align="left"></td>
                    <td align="right">
                        <a><b></b><font color="red">欢迎您:张三&nbsp;</font></a>
                    </td>
                    <td align="center"><img src="../images/home/help.png" width="12" height="17"  /></td>
                    <td align="left"><a href="javascript:void(0);">帮助</a></td>
                    <td align="center"><img src="../images/home/exit.png" width="14" height="14"   /></td>
                    <td align="left" valign="middle" ><a href="../loginUI.html">退出</a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- }头部 -->
<!-- 导航{ -->
<div class="menu">
    <ul class="clearfix">
        <li class="hover"><a href="home.html">工作主页</a></li>      
        <li><a href="../tax/frame.html">纳税服务</a> </li>
    </ul>
</div>
<!-- }导航 -->
<div class="detail">
    <div class="detail_center">
       <form id="form" name="form" action="${pageContext.request.contextPath}/survy/recore" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>问卷调查</strong></div></div>
    <div class="tableH2 ">关于xxx的问卷调查</div>
    <table id="baseInfo " width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
<!-- 	     <tr> -->
<%--             <td class="tdBg " width="10%"><input class="tdBg " type="text" name="ss_no" value="${wjdc.ss_no }" style="border: none;" readonly="readonly"/></td> --%>
<%--             <td hidden="hidden"><input type="text" name="ss_id" value="${wjdc.ss_id}" style="border: none;" readonly="readonly"/></td> --%>
<%--             <td width="45% ">${wjdc.sq_title}</td> --%>
<!-- 			<td width="45% "> -->
<%-- 			<c:forEach items="${wjdc.ss_choices }" var="list"> --%>
<%-- 				<input type="radio" name="sq_answer" value="${list }">${list } --%>
<%-- 			</c:forEach> --%>
<!-- 			</td> -->
<!--         </tr> -->
 	<c:forEach items="${wjdc}" var="wjdc" varStatus="a">
 		<tr>
			<td class="tdBg " width="10%"><input class="tdBg " type="text" name="ss_no" value="${wjdc.ss_no }" style="border: none;" readonly="readonly"/></td>
            <td hidden="hidden"><input type="text" name="ss_id" value="${wjdc.ss_id}" style="border: none;" readonly="readonly"/></td> 
            <td width="45% ">${wjdc.sq_title} </td>
 			<td width="45% ">
				<c:forEach items="${wjdc.ss_choices }" var="list" varStatus="b">
				<c:choose>
				    <c:when test="${wjdc.ss_type == '1' }"><input type="radio" name="sq_answerDan${a.count }" value="${list }">${list }</c:when>
				    <c:when test="${wjdc.ss_type == '2' }"><input type="radio" name="sq_answerDuo${a.count }${b.count }" value="${list }">${list }</c:when>
				</c:choose>
					
				</c:forEach>
			</td>
		 </tr>
	</c:forEach>
		    </table>
    <div class="tc mt20 ">
        <input type="submit" class="btnB2 " value="保存" style="text-align:center;"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button "  onclick="javascript:history.go(-1) " class="btnB2 " value="返回"  style="text-align:center;"/>
    </div>
    </div></div></div>

</form> 
</div>
</div>
<!-- 尾部{ -->
<div class="foot">版权所有©国税局 2017年</div>
<!-- }尾部 -->
</body>
</html>
</body>
</html>