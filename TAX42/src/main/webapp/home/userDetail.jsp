<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../js/jquery/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../js/hxjzg.js"></script>
    <link href="../css/home.css" rel="stylesheet" type="text/css" />
    <link href="../css/skin1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
    <style type="text/css">
		   .imag,#headImg{
		      position: relative;
			  left: -100px;
		  }
    #name,#password,#user_gendertrue,#user_genderfalse,#user_email,#user_mobile,
    #birthday{
			  position: relative;
			  left: -250px;
		  } 
		  #dept{
		      position: relative;
			  left: -230px;
		  }
		  #account{
		      position: relative;
			  left: -223px;
		  }
		  #user_memo{
		     position: relative;
			  left: -62px;
		  }
		  font{
		      position: relative;
			  left: -175px;
		  }
		  #true,#false{
		     position: relative;
			  left: -250px;
		  }
    } 
</style>
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
                        <a><b></b><font color="red">欢迎您:${user_map.name}&nbsp;</font></a>
                    </td>
                    <td align="center"><img src="../images/home/help.png" width="12" height="17"  /></td>
                    <td align="left"><a href="javascript:void(0);">帮助</a></td>
                    <td align="center"><img src="../images/home/exit.png" width="14" height="14"   /></td>
                    <td align="left" valign="middle" ><a href="../loginUI.jsp">退出</a></td>
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
<!-- 详情{ -->
<div class="detail">
    <div class="detail_center">
       <form id="form" name="form" action="${pageContext.request.contextPath }/user/edithome" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
        <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>用户信息</strong></div></div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">所属部门：</td>
            <td><input type="text" name="user.dept" value="${user_map.dept}" id="dept" readonly="readonly"/><span><font color="red">*不可更改</font></span></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">头像：</td>
            <td>
              
                    <img src="${user_map.headImg}" class="imag" width="100" height="100"/>
                <input type="file" id="headImg" name="headImg" value="${user_map.headImg}" onchange="showPhoto(this)"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">用户名：</td>
            <td><input type="text" name="user.name" value="${user_map.name}" id="name"/>
             <font color="RED"><span id="name_s"></span></font>
             </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">帐号：</td>
            <td><input type="text" name="user.account" value="${user_map.account}" id="account" onchange="doVerify()" readonly="readonly"/>
                <font color="account"><span id="account_s">*不可更改</span></font></font>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">密码：</td>
            <td><input type="text" name="user.password" value="${user_map.password}" id="password"/>
              <font color="RED"><span id="password_s"></span></font>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">性别：</td>
            <td><input type="radio" name="user.gender" id="user_gendertrue" value="true"/><label id="true" for="user_gendertrue">男</label>
<input type="radio" name="user.gender" id="user_genderfalse" checked="checked" value="false"/><label id="false" for="user_genderfalse">女</label>
</td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">电子邮箱：</td>
            <td><input type="text" name="user.email" value="${user_map.email}" id="user_email"/>
            <font color="RED"><span id="email_s"></span></font></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">手机号：</td>
            <td><input type="text" name="user.mobile" value="${user_map.mobile }" id="user_mobile"/>
            <font color="RED"><span id="mobile_s"></span></font></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">生日：</td>
            <td>
            <input type="text" name="user.birthday" value="${user_map.birthday }" id="birthday" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td><textarea name="user.memo" cols="75" rows="4" id="user_memo">${user_map.memo }</textarea></td>
        </tr>
    </table>
    <input type="hidden" name="user.id" value="${user_map.id }" id="user_id"/>
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" " />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
<script>
		 function showPhoto(obj){
		  	  var file = obj.files[0];
		 	  var fr = new FileReader();
		      fr.readAsDataURL(file);
		      fr.onload=function(){
			     var url = fr.result;
			 	 $(".imag").prop("src",url);
			  }
	     }
 </script>
 <script type="text/javascript">
    var flg0 = false;
	var flg1 = false;
	var flg2 = false;
	var flg3 = false;
	var flg4 = false;
	$("#name").blur(function() {
		var re = /^[\u4e00-\u9fa5]{2,}$/;
		var val = $(this).val();
		flg0 = re.test(val);
		if (!flg0) {
			$("#name_s").text("请输入中文名字");
		} else {
			$("#name_s").text("");
		}
	});
	
	$("#account").blur(function() {
		var re = /^\w{3,20}$/;
		var val = $(this).val();
		flg1 = re.test(val);
		if (!flg1) {
			$("#account_s").text("账号位数为3到20位");
		} else {
			$("#account_s").text("*账号一旦注册将不可再更改");
		}
	});
	
	$("#password").blur(function() {
		var re = /^\w{3,10}$/;
		var val = $(this).val();
		flg2 = re.test(val);
		if (!flg2) {
			$("#password_s").text("密码是3到10位字符");
		} else {
			$("#password_s").text("");
		}
	});
	
	$("#user_email").blur(function() {
		var re = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-z0-9_-]+)+$/;
		var val = $(this).val();
		flg3 = re.test(val);
		if (!flg3) {
			$("#email_s").text("请输入正确的邮箱");
		} else {
			$("#email_s").text("");
		}
	});
	
	$("#user_mobile").blur(function() {
		var re = /^1[34578][012356789]\d{8}$/;
		var val = $(this).val();
		flg4 = re.test(val);
		if (!flg4) {
			$("#mobile_s").text("请输入正确的手机号");
		} else {
			$("#mobile_s").text("");
		}
	});
	
	
	</script>
</div>
</div>
<!-- }详情 -->
<!-- 尾部{ -->
<div class="foot">版权所有©国税局 2017年</div>
<!-- }尾部 -->
</body>
</html>
</html>