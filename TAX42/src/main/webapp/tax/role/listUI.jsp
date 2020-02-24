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
    <title>角色管理</title>
    <script type="text/javascript" src="../../js/my_role.js"></script>
    <script type="text/javascript">
        $(function(){
        	doSearch(null);
        	
        });
    </script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>角色管理 </strong></div> </div>
                <div class="search_art">
                    <li>
                        角色名称：<input type="text" name="role.name" value="" id="roleName" class="s_text" style="width:160px;"/>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                    <li style="float:right;">
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0" >
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td width="120" align="center">角色名称</td>
                            <td align="center">权限</td>
                            <td width="80" align="center">状态</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                    </table>
                    <table width="100%" border="0" class="table">
                    </table>
                </div>
            </div>
			<div class="c_pate" style="margin-top: 5px;">
		<table width="100%" class="pageDown" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td align="right">
                 	总共<a id="total"></a>条记录，当前第 <a id = "pageNum"></a> 页，共 <a id="pages"></a> 页 &nbsp;&nbsp;
                            <a onclick = "doSearch('up')">上一页</a>&nbsp;&nbsp;<a onclick = "doSearch('down')">下一页</a>
					到&nbsp;<input type="text" style="width: 30px;" id="do" onblur="doSearch('tiao')"/> &nbsp;&nbsp;
			    </td>
			</tr>
		</table>	
        </div>
        </div>
    </div>
</form>

</body>
</html>