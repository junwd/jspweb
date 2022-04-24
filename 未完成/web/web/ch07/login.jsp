<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@ page language="java" import ="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":"+ request.getServerPort() + path + "/";
%> 
<html> 
    <script type="text/javascript">
        function reloadImage(t) {t.src = "./ImageServlet?flag=" + Math.random();
        }
    </script>
    <head> <base href ="< %=basePath %>"> </head>
    <body><center>
        <form action="../ch07/checkUser.jsp" method="post">
            <img src="../images/sfd.jpg" height="40%" width="60%">
            <table>
                <tr><td colspan="2" align="center">用户登录</td></tr>
                <tr><td>用户名</td><td><input type="text" name="user"></td></tr>
                <tr><td>密码</td>
                    <td><input type="password" name="password"></td></tr>
                <tr><td>验证码</td> 
                    <td><input type ="text" name = "checkcode">
                        <img SRC="./ImageServlet" align="middle" alt="看不清楚" onclick="reloadImage(this)"></td></tr>
                <tr><td colspan="2" align = "center">
                        <input type ="submit" value="登录"></td></tr>
            </table>
        </form></center> 
</body>
</html> 
