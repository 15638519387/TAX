<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>咨询详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../js/jquery/jquery-3.1.1.min.js"></script>
    <link href="../css/home.css" rel="stylesheet" type="text/css" />
    <link href="../css/skin1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/hxjzg.js"></script>
    <script type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
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
                        <a><b></b><font color="red">欢迎您:${user_map.name }&nbsp;</font></a>
                    </td>
                    <td align="center"><img src="../images/home/help.png" width="12" height="17"  /></td>
                    <td align="left"><a href="javascript:void(0);">帮助</a></td>
                    <td align="center"><img src="../images/home/exit.png" width="14" height="14"   /></td>
                    <td align="left" valign="middle" ><a href="${pageContext.request.contextPath }/tui">退出</a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- }头部 -->
<!-- 导航{ -->
<div class="menu">
    <ul class="clearfix">
        <li class="hover"><a href="javascript:void(0);">工作主页</a></li>
        <!-- <li><a href="javascript:void(0);">行政管理</a></li>
        <li><a href="javascript:void(0);">后勤服务</a></li>
        <li><a href="javascript:void(0);">在线学习</a></li> -->
        <li><a href="../tax/frame.jsp">纳税服务</a> </li>
        <!-- <li><a href="javascript:void(0);">我的空间</a></li> -->
    </ul>
</div>
<!-- }导航 -->
<div class="detail">
    <div class="detail_center">
       <form id="form" name="form" action="listUI.html" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
        
		<div class="c_crumbs">
			<div>
				<b></b>
				 <c:if test="${qht_cr.state==0}"><strong>咨询详细信息<span style="color:red;">未处理</span></strong></c:if>
				 <c:if test="${qht_cr.state==1}"><strong>咨询详细信息<span style="color:red;">已处理</span></strong></c:if>
				 <c:if test="${qht_cr.state==2}"><strong>咨询详细信息<span style="color:red;">不处理</span></strong></c:if>
			</div>
		</div>
		
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
    	
    	<!-- ******************咨询人信息********************* -->
    	
    	<tr><td colspan="2" align="center">咨询人信息</td></tr>
        <tr>
        
            <td class="tdBg">咨询人单位：</td>
            <td>${qht_cr.con_dept}</td>
        </tr>
        <tr>
            <td class="tdBg">咨询人姓名：</td>
           <%--  <td><input type="text" id="" name="" value="${qht_cr.con_name}"/></td> --%>
            <td>${qht_cr.con_name}</td>
        </tr>
        <tr>
            <td class="tdBg">咨询人手机：</td>
            <td>${qht_cr.con_mobile}</td>
        </tr>
        
        <!-- ***************************咨询信息********************* -->
        
        <tr><td colspan="2" align="center">咨询信息</td></tr>
        <tr>
            <td class="tdBg">咨询时间：</td>
            <td>
            	${qht_cr.con_time}
            </td>
        </tr>
        <tr>
            <td class="tdBg">咨询标题：</td>
            <td>${qht_cr.con_title}</td>
        </tr>
        <tr>
            <td class="tdBg">咨询内容：</td>
            <td><p>${qht_cr.con_content}</p></td>
        </tr>
        
         <!-- ***************************回复信息********************* -->
         
        <tr><td colspan="2" align="center">回复信息</td></tr>
       
        <tr>
            <td class="tdBg" width="200px">回复内容：</td>
            <td><textarea name="reply.replyContent" cols="90" rows="8" id="reply_replyContent" readonly="readonly">${qht_cr.reply_content}</textarea></td>
        </tr>
    </table>
    <div class="tc mt20">
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
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