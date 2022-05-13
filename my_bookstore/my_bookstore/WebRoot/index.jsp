<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>网上书店项目实训</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center>
    <table>
    <tr><td><img src="images/top.jpg"/></td></tr>
    <tr><td align = "center">
    <font color = "red" size = "5" style = "font-family:simhei">请登录：</font>
    <td>
    </tr>
    </table>
    <form action="checkUser.jsp" method = "post" name =Regsiter >
    <table>
    <tr>
    	<td>用户名：</td>
    	<td><input name = "loginName" type = "text" size = "20"/></td>
    </tr>
    <tr>
        <td>密 码：</td>
        <td><input name = "password" type = "password" size = "20"></td>
    </tr>
    <tr>
        <td>验证码：</td>
        <td><input name = "checkcode" type = "text" ></td>
        <td><img  src="./ImageServlet" align = "middle" alt ="看不清，点击这里"  onclick = "reloadImage(this)"></td>
    <tr>
    	<td colspan = 2 align = "center"><input type = "button" name = "B1" value = "提交" onclick = "RegisterSubmit()">
    	<input type = "reset" name = "B2" value = "重置"> </td>
    </tr>
    </table>
    </form> 
    </center>
  </body>
  <script language = "javascript" type="text/javascript">
    function RegisterSubmit(){
       with(document.Regsiter){
			var user = loginName.value;
			var pass = password.value;
			if(user==null||user=="")alert("请填写用户名")
			else if(pass == null||pass == "")alert("请输入密码");
			else submit();
			}			
		}
		
		
	function reloadImage(t){//flag目的是为了让每次访问的地址不一样，这样浏览器就不会读取本地缓存的数据
		t.src = "./ImageServlet?flag=" + Math.random();
	
	}
</script>
</html>
