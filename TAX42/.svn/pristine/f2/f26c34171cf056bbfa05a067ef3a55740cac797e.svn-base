<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
   <script type="text/javascript" src="../../js/hxjzg.js"></script>
    <link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
    <title>用户管理</title>
    <script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../../js/my_user.js"></script>
</head>
<body class="rightBody">
<form id="form" name="form" action="${pageContext.request.contextPath}/user/addUI" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
        <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>用户管理</strong>&nbsp;-&nbsp;新增用户</div></div>
    <div class="tableH2">新增用户</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">所属部门：</td>
            <td><select name="user.dept" id="user_dept">
				    <option selected="selected" value="部门A">部门A</option>
				    <option value="部门B">部门B</option>
				    <option value="部门C">部门C</option>
				</select>

			</td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">头像：</td>
            <td>
                <input type="file" name="headImg"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">用户名：</td>
            <td><input type="text" name="user.name"  id="name"/>
             <font color="RED"><span id="name_s"></span></font>
             </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">帐号：</td>
            <td><input type="text" name="user.account" value="" id="account" />
                <font color="RED"><span id="account_s"></span></font>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">密码：</td>
            <td><input type="text" name="user.password"  id="password"/>
              <font color="RED"><span id="password_s"></span></font>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">性别：</td>
            <td><input type="radio" name="user.gender" id="user_gendertrue" value="true"/><label for="user_gendertrue">男</label>
<input type="radio" name="user.gender" id="user_genderfalse" checked="checked" value="false"/><label for="user_genderfalse">女</label>
</td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">角色：</td>
            <td>
            <!-- 对于list而言 -->
              <c:forEach var = "list" items="${roleName }">
                 <input type="radio" name="userRoleIds" value="${list.role_id}"      checked="checked"         />
				 <label    class="checkboxLabel">${list.name}</label>
              </c:forEach>
<input type="hidden" id="__multiselect_userRoleIds" name="__multiselect_userRoleIds"
       value="" />
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">电子邮箱：</td>
            <td><input type="text" name="user.email"  id="user_email"/>
            <font color="RED"><span id="email_s"></span></font></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">手机号：</td>
            <td><input type="text" name="user.mobile" value="" id="user_mobile"/>
            <font color="RED"><span id="mobile_s"></span></font></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">生日：</td>
            <td><input type="text" name="user.birthday" value="" readonly="readonly" id="birthday" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});"/></td>
        </tr>
		<tr>
            <td class="tdBg" width="200px">状态：</td>
            <td><input type="radio" name="user.state" id="user_state1" checked="checked" value="1"/><label for="user_state1">有效</label>
<input type="radio" name="user.state" id="user_state0" value="0"/><label for="user_state0">无效</label>
</td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td><textarea name="user.memo" cols="75" rows="3" id="user_memo"></textarea></td>
        </tr>
    </table>
    <div class="tc mt20">
        <input type="button" class="btnB2" id="ha" value="保存"  />
        <!-- <input type="submit" class="btnB2" value="保存"  /> -->
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>

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
	
	$("#ha").click(function(){
		if(flg0==true && flg1 == true && flg2 == true && flg3 == true && flg4 == true){
			var  acc = $("#account").val();
			$.ajax({
				type:"post",
				url:"http://localhost:8080/TAX4/user/acc",
				data:{"acc":acc},
				success:function(data){
					if(data){
						document.forms[0].submit();
					} else {
						alert("账号已存在，请从新输入账号");
					}
				}
			});
		}else {
			alert("请认真填写");
		}
	});
	
 </script>
</body>

 <!-- <script type="text/javascript">
	    vResult = false;
	    //ajax校验帐号唯一
	    function doVerify(){
		  	//1、获取帐号
		  	var account = $("#account").val();//jauery获取表单项的值
		  	if(account != ""){
		  		//2、校验 
		  		$.ajax({
		  			url:"../../user/user_verifyAccount.action",
		  			data: {"user.account": account},
		  			type: "post",
		  			async: false,//非异步
		  			success: function(msg){
		  				if("true" != msg){
		  					//帐号已经存在
		  					//alert("帐号已经存在。请使用其它帐号！");
		  					//document.getElementById("msg").innerHTML="帐号已经存在。请使用其它帐号";
		  					$("#msg").text("* 帐号已经存在。请使用其它帐号");
		  					
		  					//定焦
		  					$("#account").focus();
		  					vResult = false;
		  				} else {
		  					$("#msg").text("* 帐号可以使用");
		  					vResult = true;
		  				}
		  			}
		  		});
		  	}
	  }
</script> -->
</html>