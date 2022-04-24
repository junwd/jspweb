<%-- 
    Document   : left
    Created on : 2022-4-24, 16:59:14
    Author     : deins
--%>

<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.
            getServerPort() + path + "/";
%>
<html>
    <body> 
        <font color="blue" size="3">当前用户：
        <%= request.getSession().getAttribute("userName")%></font><hr>
        <font color="red" size="4" style ="font-family：simhei">前台系统</font><hr> 
        <a href=viewBook.jsp target=main>浏览图书</a><br><br>
        <font color="red" size="4" style ="font-family: simhei">后台系统</font><hr>
        <a href=listBook.jsp target=main>书架维护</a>
    </body> </html> 

<html> 