<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link href="css/login.css" type="text/css" rel="stylesheet">
 <script type="text/javascript" src="js/jquery/jquery-3.1.1.min.js"></script>
 <script type="text/javascript" src="js/hxjzg.js"></script>
<script type="text/javascript">

function logins(){
	document.forms[0].submit();
	//比较安全  扫描工具  参数不暴露
}

function setClean(){
	document.getElementById("account").value = "";
	document.getElementById("password").value = "";
}

//解决子框架嵌套的问题
if(window != window.parent){
	window.parent.location.reload(true);
}
</script>
<style type="text/css">
html { overflow-y: hidden;  }

.password{
      background-color:#f1f3f6;
	  border:1px solid #f1f3f6;
	  font-color:#ccc;
}

#Layer1 {
	position:absolute;
	left:224px;
	top:479px;
	padding-top:5px;
	width:99px;
	height:21px;
	background-color:#fff;
	z-index:1;
}
.password1 {      
	 background-color:#f1f3f6;
	  border:1px solid #f1f3f6;
	  font-color:#ccc;
}

.youbian input{ border:0px none; background-color:transparent; color:#555;padding-left:10px;font-size:16px;width:100%;overflow: hidden;}
</style>
    <!--[if IE 6]>
    <script type="text/javascript" src="/tax/ehome/js/DD_belatedPNG.js" ></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('b, s, img, span, .prev, .next, a, input, .youbian, td');
    </script>
    <![endif]-->
    <script type="text/javascript">
    $(function(){
    	var i = '${logim_san}';
	    	  if(i==1){
	    		  alert("账号密码错误,请重新输入");
	    		  i+=10;
	    		  return ;
	    	  }else if(i==2){
	    		  alert("请先输入账号密码");
	    		  i+=10;
	    		  return ;
	    	  }else if(i==3){
	    		  alert("你的账号已被封，请联系管理员");
	    		  i+=10;
	    		  return ;
	    	  }
    	
    });
    </script>
    <style type="text/css">
        #account,#password{
            width: 100%;
            height: 100%;
        } 
    
    
    </style>
</head>
<body scroll="no">
<form id="login_login" name="form1" action="${pageContext.request.contextPath }/deng/login" method="post">
<div id="lo_tf">
<div class="outside">
    <div class="head">
      <table width="1000" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="840" align="left"><img src="images/login/form_03.png"   width="332" height="47"/></td>
          <td align="center">&nbsp;&nbsp;<a href="#"></a></td>
        </tr>
      </table>
    </div>
    <div class="main2">
	   <div class="content">  
	   <div class="youbian">
	    <table width="251" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="12">&nbsp;</td>
          </tr>
          <tr>
           <td height="45" align="left"></td>
          </tr>
          <tr>
          	<td height="13">&nbsp;
            	<span><div height=20 valign="middle" style="padding-left: 18px"><font color="red" id="errMsg"></font></div></span>
            </td>
          </tr>
          <tr>
            <td height="40">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    	<td height="32" align="left"><span style="color:#767676;font-size:14px;">帐&nbsp;&nbsp;号:</span></td>
  </tr>
</table>

			<table width="100%" height="39" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td background="images/login/shuru_03.png" width="">
					<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left">
								<input type="text" name="user.account" size="31" value="" id="account" class="password1" style="color: #767676" style="height:100%;"/>
							</td>
						</tr>
					</table>
				</td>
              </tr>
            </table></td>
          </tr>
		    <tr>
            <td height="10"><table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" align="left"><span style="color:#767676;font-size:14px;">密&nbsp;&nbsp;码:</span></td>
  </tr>
</table></td>
          </tr>
          <tr>
            <td height="40"><table width="100%" height="39" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td background="images/login/shuru_03.png"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left">
                    	<input type="password" name="user.password" size="31" id="password" class="password" style="color: #767676"/>
                    </td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          
		   <tr>
            <td height="10">&nbsp;</td>
          </tr>
          <tr>
            <td height="40"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="right"><a href="#" onclick="javascript:logins();"><img src="images/login/form_15.png" width="95" height="37"/></a></td>
                <td width="18">&nbsp;</td>
                <td align="left"><img src="images/login/form_17.png" width="95" height="37" onclick="setClean()"/></td>
              </tr>
            </table></td>
          </tr>
          <tr>
          	<td><center><p style="margin-top:10px;">还没账号？点击<a href="${pageContext.request.contextPath }/deng/lo">注册</a></p></center></td>
          </tr>
        </table>
	    
	  </div>   
       </div>
   </div>
	<div class="foot">版权所有&nbsp;|&nbsp;国税局&nbsp;&nbsp;2018年</div>
</div>
</div>
</form>



</body>
</html>