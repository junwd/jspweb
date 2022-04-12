<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
    <head><title>管理员登录</title></head> 
    <body>
    <center>
        <h2>管理员登录</h2>
        <form method = "post" action = "process.jsp">
            <table border bordercolor = " #0099FF" bgcolor = '#CCFFFE'>
                <tr><td width= "40%">用户名</td><td><input type = "text" name = "user"></td> 
                <tr><td width= "40%">密码：</td><td><input type = "password" name = "pw"></td>
                <tr>
                    <td colspan= "2"align="center"> 
                        <input type="submit"value = "登录">
                        <input type ="reset" value = "清空"> 
                </tr>
            </table> 
        </form> 
    </center> 
</body>
</html>