<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>我要预约</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../js/jquery/jquery-3.1.1.min.js"></script>
    <link href="../css/home.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/hxjzg.js"></script>
    <link href="../css/skin1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    $(function(){
     $.ajax({
    	url:"/TAX4/Sub/selectMatter_no",
    	success:function(d){
    		$.each(d,function(i,v){
    			cont='<option value="'+v.matter_no+'">'+v.matter_no+'</option>'
    			$("#select1").append(cont);
    		})
    	}
     });
    	$("#select1").change(function(){
    		var a=$(this).val();
    		if(a=='1'){
    			$("#text1").val("咨询");
    		}else if(a=='2'){
    			$("#text1").val("交税");
    		}else if(a=='3'){
    			$("#text1").val("闲聊");
    		}else if(a=='4'){
    			$("#text1").val("办理业务");
    		}else if(a=='5'){
    			$("#text1").val("面试");
    		}
    	});
    });
    
    </script>

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
            <li class="hover"><a href="home.jsp">工作主页</a></li>     
        <li><a href="../tax/frame.html">纳税服务</a> </li>
    </ul>
</div>
<!-- }导航 -->
<div class="detail">
    <div class="detail_center">
       <form id="form" name="form" action="/TAX4/Sub/addSub_Service" method="post" >
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>我要预约</strong></div></div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">预约人：</td>
            <td>${user_map.name }<input type="hidden" name="subscriber" value="${user_map.name }" /></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">预约事项：</td>
            <td><select name="matter_id" id="select1">
            
					 
                       
                   
                          </select></td>
           
           
				<td> <input type="text" readonly="readonly" value="咨询" name="matter_name" id="text1"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px" >预约时间：</td>
            <td colspan="3"><input type="datetime-local" name="sub_time" id="sub_time"></input></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">预约地点：</td>
            <td colspan="3"><input type="text" name="sub_place" id="sub_place"></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">预约说明：</td>
            <td colspan="3"><textarea name="sub_desc" id="sub_desc" cols="90" rows="3"></textarea></td>
        </tr>
    </table>
	
<!-- 	默认预约是失败状态 -->
    <input type="hidden" name="sub_state" value="0" id="sub_state"/>
    <div class="tc mt20">
        <input type="submit"  class="btnB2" value="提交" />
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