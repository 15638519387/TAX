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
    <script type="text/javascript">
        $(function(){
        	<c:forEach var = "code" items="${codeList}">
        	    if('${code}'=="纳税服务"){
        	    	$("#privilegeIds-1").prop("checked",true);
        	    }else if('${code}'=="在线学习"){
        	    	$("#privilegeIds-2").prop("checked",true);
        	    }else if('${code}'=="我的空间"){
        	    	$("#privilegeIds-3").prop("checked",true);
        	    }else if('${code}'=="后勤服务"){
        	    	$("#privilegeIds-4").prop("checked",true);
        	    }else if('${code}'=="行政管理"){
        	    	$("#privilegeIds-5").prop("checked",true);
        	    }
        	</c:forEach>
        	
        });
    </script>
    <title>角色管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="${pageContext.request.contextPath}/role/editUpdate" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>角色管理</strong>&nbsp;-&nbsp;编辑角色</div></div>
    <div class="tableH2">编辑角色</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">角色名称：</td>
            <td><input type="text" name="role.name" value="${edit.name}" id="role_name"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">角色权限：</td>
            <td>
            <input type="checkbox" name="privilegeIds" value="纳税服务"       id="privilegeIds-1"        />
			<label        for="privilegeIds-1"        class="checkboxLabel">纳税服务</label>
			<input type="checkbox" name="privilegeIds" value="在线学习"       id="privilegeIds-2"        />
			<label        for="privilegeIds-2"        class="checkboxLabel">在线学习</label>
			<input type="checkbox" name="privilegeIds" value="我的空间"       id="privilegeIds-3"        />
			<label        for="privilegeIds-3"        class="checkboxLabel">我的空间</label>
			<input type="checkbox" name="privilegeIds" value="后勤服务"       id="privilegeIds-4"        />
			<label        for="privilegeIds-4"        class="checkboxLabel">后勤服务</label>
			<input type="checkbox" name="privilegeIds" value="行政管理"       id="privilegeIds-5"        />
			<label        for="privilegeIds-5"        class="checkboxLabel">行政管理</label>
			<input type="hidden" id="__multiselect_privilegeIds" name="__multiselect_privilegeIds"
       value="" />
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">状态：</td>
            <c:choose>
                <c:when test="${edit.state eq '1' }">
		             <td><input type="radio" name="role.state" id="role_state1" checked="checked" value="1"/><label for="role_state1">有效</label>
		             <input type="radio" name="role.state" id="role_state0" value="0"/><label for="role_state0">无效</label></td> 
                </c:when>
                <c:otherwise>
                      <td><input type="radio" name="role.state" id="role_state1"  value="1"/><label for="role_state1">有效</label>
		             <input type="radio" name="role.state" id="role_state0" checked="checked" value="0"/><label for="role_state0">无效</label></td> 
                </c:otherwise>
       </c:choose>
        </tr>
    </table>
    <input type="hidden" name="role.roleId" value="${edit.role_id}" id="role_roleId"/>
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
   
</form>
</body>
</html>