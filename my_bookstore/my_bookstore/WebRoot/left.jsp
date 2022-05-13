<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>左侧导航栏</title>
    
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
    <font size = "3" color = "blue">当前用户：
    <%= request.getSession().getAttribute("userName") %></font><br><hr>
    <font color = "red" size ="4" style = "font-family:simhei">前台系统</font><br><hr>
    <a href = "viewBook.jsp" target = main>浏览图书</a><br><br><hr>
    <font color = "red" size ="4" style = "font-family:simhei">后台系统</font><br><hr>
    <a href = "listBook.jsp" target = main>书架维护</a><br><br><hr>
  </body>
</html>
