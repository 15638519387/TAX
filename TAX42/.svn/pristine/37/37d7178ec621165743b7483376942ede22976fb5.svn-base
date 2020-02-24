
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
    <link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
    <title>服务调查管理</title>
	<style>
	   .style{white-space:nowrap;}
	   </style>
    <script type="text/javascript">
        var cnt = 0;
        var cnt1 = 0;
        function addDiv(){
           cnt = eval(cnt+1);
           var div = "<div style='width:500px;height:auto;' id="+cnt+"></div>";
           $("#add1").append(div);
	   var seq ="<td><input type='text' name='ss_no' value="+cnt+" style='width:20%' class ='style' readonly></td>";
	   var title="<td><input type='text' name='sq_title' value='123' class ='style'></td>";
	   var select="<td><select class ='style' name='ss_type'><option>单选</option><option>多选</option></select></td>";
	   var addSelect ="<td><input type='button' name='addSelect' value='增加选项' id='addSelect' onclick='fun1(this)' class='btnB4'/></td>";
           var cla = $(document.getElementById(cnt));
	   cla.append(seq);
	   cla.append(title);
	   cla.append(select);
	   cla.append(addSelect);
           cla.append("<tr>");

    }

	    function fun1(aaa){
                cnt1 = eval(cnt1+1);
		var div2 ="<div style='width:100px;height:30px;white-space:nowrap' id=i"+cnt1+"></div>";
                var cla = $(aaa).parent().parent();
		cla.append(div2);
                cnt2 = "i"+cnt1;
                var cla1 = $(document.getElementById(cnt2));
	        var content="<tr><td><input type='text' name='ss_choice' value='67868'/></td><td><input type='button' name='addSelect' value='删除' id='addSelect' onclick='fun2(this)' class='btnB4'/></td></tr>";
                var butt = "";
	        cla1.append(content);
	    }

            function fun2(bbb){
                $(bbb).parent().parent().parent().remove();
            }

    </script>
</head>
<body class="rightBody">
<form  action="${pageContext.request.contextPath}/survy/insert" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>服务调查</strong>&nbsp;-&nbsp;新增/编辑服务调查</div></div>
    <div class="tableH2">新增/编服务调查</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">调查标题</td>
            <td colspan="3"><input name="ss_title" value="" type="text" style="width:90%"/></td>
        </tr>
		   <tr>
		    <td class="tdBg" width="200px">开始时间</td>
            <td><input type="date"  name="ss_starttime"/></td>
            <td class="tdBg" width="200px">结束时间</td>
            <td><input type="date"  name="ss_endtime"/></td>
        </tr>
		<tr>
            <td class="tdBg" width="200px">是否有效</td>
            <td><input type="radio" name="ss_state" value="1"/>有效
            <input type="radio" name="ss_state" value="0"/>无效
			</td>
            <td class="tdBg" width="200px">申请部门</td>
            <td>
            	<select name="ss_dept">
            		<option>xxx</option>
            		<option>a</option>
            	</select>
            </td>
        </tr>

        <tr>
            <td class="tdBg" width="200px">申请人</td>
            <td><input name="ss_applyer" value="" type="text"/></td>
			<td class="tdBg" width="200px">申请时间</td>
            <td><input type="date"  name="ss_applytime"/></td>
        </tr>
        </tr>    
    </table>
	        <input type="button"  onclick="addDiv()" class="btnB8" value="新增问卷调查题目" />
			<div id="add1" style='height:auto;'></div><div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
			

    
    </div></div></div>
</form>
</body>
</html>