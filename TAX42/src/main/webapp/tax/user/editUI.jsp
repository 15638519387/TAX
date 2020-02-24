<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
    <link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
    <title>用户管理</title>
    <script type="text/javascript" src="../../js/hxjzg.js"></script>
    <script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../../js/my_user.js"></script>
</head>
<body class="rightBody">

<form id="form" name="form" action="${pageContext.request.contextPath}/user/editInsert" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>用户管理</strong>&nbsp;-&nbsp;编辑用户</div></div>
    <div class="tableH2">编辑用户</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">所属部门：</td>
            <td><select name="user.dept" id="user_dept">
                    <c:choose >
				        <c:when test ="${user_queryList.dept eq '部门B'}">
						    <option value="部门A">部门A</option>
						    <option value="部门B" selected="selected">部门B</option>
						    <option value="部门C">部门C</option>
				        </c:when>
				        <c:when test ="${user_queryList.dept eq '部门C'}">
						    <option value="部门A">部门A</option>
						    <option value="部门B">部门B</option>
						    <option value="部门C" selected="selected">部门C</option>
				        </c:when>
				        <c:otherwise>
						    <option value="部门A" selected="selected">部门A</option>
						    <option value="部门B">部门B</option>
						    <option value="部门C">部门C</option>
				        </c:otherwise>
				    </c:choose>
				</select>

</td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">头像：</td>
            <td>
                    <img src="../${user_queryList.headImg}" id="user_img" width="100" height="100"/>
                    
                <input type="file" name="headImg" value="${user_queryList.headImg}" onchange="showPhoto(this)"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">用户名：</td>
            <td><input type="text" name="user.name" value="${user_queryList.name }" id="name"/>
            <font color="RED"><span id="name_s"></span></font>
             </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">帐号：</td>
            <td><input type="text" name="user.account" value="${user_queryList.account }" id="account" onchange="doVerify()"readonly="readonly"/>
                <span><font color="red">*不可更改</font></span></font>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">密码：</td>
            <td><input type="text" name="user.password" value="${user_queryList.password }" id="password"/>
            <font color="RED"><span id="password_s"></span></font>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">性别：</td>
            <c:choose>
               <c:when test="${user_queryList.gender eq 'true' }">
					<td>
						<input type="radio" name="user.gender" id="user_gendertrue" checked="checked" value="true"/><label for="user_gendertrue">男</label>
						<input type="radio" name="user.gender" id="user_genderfalse" value="false"/><label for="user_genderfalse">女</label>
					</td>
                </c:when>
                <c:otherwise>
                    <td>
						<input type="radio" name="user.gender" id="user_gendertrue"  value="true"/><label for="user_gendertrue">男</label>
						<input type="radio" name="user.gender" id="user_genderfalse" checked="checked" value="false"/><label for="user_genderfalse">女</label>
					</td>
                </c:otherwise>
            </c:choose>
        </tr>
        <tr>
            <td class="tdBg" width="200px">角色：</td>
            <td>
              <!-- 对于list而言 -->
              <c:forEach var = "list" items="${roleName }">
                 <c:choose>
                     <c:when test="${user_queryList.role_name eq list.name }">
						<input type="radio" name="userRoleIds" value="${list.role_id}"      required="required"        checked="checked"        />
						<label    class="checkboxLabel">${list.name}</label>
                     </c:when>
                     <c:otherwise>
                         <input type="radio" name="userRoleIds" value="${list.role_id}"      required="required"         />
						<label    class="checkboxLabel">${list.name}</label>
                     </c:otherwise>
                 </c:choose>
              </c:forEach>
<input type="hidden" id="__multiselect_userRoleIds" name="__multiselect_userRoleIds"
       value="" />
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">电子邮箱：</td>
            <td><input type="text" name="user.email" value="${user_queryList.email }" id="user_email"/>
            <font color="RED"><span id="email_s"></span></font></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">手机号：</td>
            <td><input type="text" name="user.mobile" value="${user_queryList.mobile }" id="user_mobile"/>
            <font color="RED"><span id="mobile_s"></span></font></td>
        </tr>        
        <tr>
            <td class="tdBg" width="200px">生日：</td>
            <td>
            
            
            <input type="text" name="user.birthday" value="${user_queryList.birthday }" readonly="readonly" id="birthday" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});"/>
            </td>
        </tr>
		<tr>
            <td class="tdBg" width="200px">状态：</td>
            <td>
            <c:choose>
                <c:when test="${user_queryList.state eq '1' }">
		             <input type="radio" name="user.state" id="user_state1" checked="checked" value="1"/><label for="user_state1">有效</label>
		             <input type="radio" name="user.state" id="user_state0" value="0"/><label for="user_state0">无效</label>
                </c:when>
                <c:otherwise>
                     <input type="radio" name="user.state" id="user_state1" value="1"/><label for="user_state1">有效</label>
		             <input type="radio" name="user.state" id="user_state0" checked="checked" value="0"/><label for="user_state0">无效</label>
                </c:otherwise>
             </c:choose>
</td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td><textarea name="user.memo" cols="75" rows="3" id="user_memo">${user_queryList.memo }</textarea></td>
        </tr>
    </table>
    <input type="hidden" name="user.id" value="${user_queryList.id }" id="user_id"/>
    <div class="tc mt20">
         <input type="submit" class="btnB2" value="保存" /> 
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
			 	 $("#user_img").prop("src",url);
			  }
	     }
 </script>
<script type="text/javascript">
	var flg0 = false;
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
</body>
</html>