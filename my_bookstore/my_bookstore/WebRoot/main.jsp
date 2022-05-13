<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>网上书店主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">


  </head>
  
  <body>
    <div id = "container">
    <div id = "header"><img src = "images/top.jpg"/></div>
    <div class = "nav"></div>
    <div class = "left_main">
    <iframe width = 180px height = 425px src = left.jsp></iframe></div>
    <div class = "right_main" >
    <iframe  name = "main" width = 620px height = 425px src = right.jsp></iframe></div>
    </div>
  </body>
</html>
