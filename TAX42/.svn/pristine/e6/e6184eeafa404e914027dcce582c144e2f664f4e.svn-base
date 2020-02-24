<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>预约服务管理</title>
 <link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
    	<script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="../../js/hxjzg.js"></script>
  
    <script >
    $(function(){ 
    	
    	var da=new Date();
    	var y=da.getFullYear();
    	var m=(String)(da.getMonth()+1);
    	if(m.length==1){
    		m="0"+m;
    	}
    	var d=(String)(da.getDate());
    
    	if(d.length==1){
    		d="0"+d;
    	}
    	var h=(String)(da.getHours());
    	if(h.length==1){
    		h="0"+h;
    	}
    	var mm=(String)(da.getMinutes());
    	if(mm.length==1){
    		mm="0"+mm;
    	}
    	var shi=y+"-"+m+"-"+d+"T"+h+":"+mm;
    	$("#shijian").val(shi);
    	
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

    	$("#select2").change(function(){
    		var a=$(this).val();
    		
    			$.ajax({
					url:"/TAX4/Sub/changeDept?val="+a,
					dateType:"json",
					success:function(d){
						$("#select3").empty();
						$.each(d,function (i,v) {
						   $("#select3").append("<option >"+v.name+"</option>");							
		                   });
					},
					error:function(){
						alert("失败");
					}
				});
    	});
    	
    });
    </script>
</head>
<body class="rightBody">
<form id="form" name="form" action="/TAX4/Sub/updateMatter" method="post" >
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>预约事项</strong>&nbsp;-&nbsp;修改事项</div></div>
    <div class="tableH2">修改事项</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">事项编号：</td>
            
            <td><select name=matter_no id="select1">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                   
                          </select></td>
            <td class="tdBg" width="200px">事项名称：</td>
            <td><input type="text" readonly="readonly" value="咨询" name="matter_name" id="text1"/><input type="hidden" name="sub_needId" value="${sub_needId}" /></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">发布部门：</td>
            <td colspan="3">
                         <select name="matter_dept" id="select2">
                          
                          <option value="部门A">部门A</option>
                          <option value="部门B">部门B</option>
                          <option value="部门B">部门C</option>
                   
                          </select></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">发布人：</td>
            <td colspan="3"><select name="matter_user" id="select3">
      <c:forEach items="${sub_user }" var="a">
                       <c:if test="${a.dept == '部门A' }">
                       <option>${a.name }</option>
                       </c:if>
                             </c:forEach>
                          </select></td>
        </tr>
		<tr>
            <td class="tdBg" width="200px">发布时间：</td>
            <td colspan="3"><input type="datetime-local" name="matter_time"  id="shijian"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">状态：</td>
            <td colspan="3">
有效<input id="sexid1"name="matter_state" type="radio" value="0" checked="checked"/>
			        无效<input id="sexid0"name="matter_state" type="radio" value="1"/>
        </tr>
        
    </table>

    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>