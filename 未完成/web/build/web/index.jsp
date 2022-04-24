<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>网上书店项目实训</title>
        <script language="javascript" type =""> 
            function RegsiterSubmit(){
                with(document.Regsiter){
                    var user=loginName.value;
                    ar pass=password.value;
                    if (user==null||user==""){alert("请填写用户名")；}
                        else if(pass==null==pass==""){alert("请填写密码")};
                        else submit();
                    }
            } 
        </script>
    </head> 
    <body> 
        <table>
            <tr><td><img SRC=images/sfd.jpg></td></tr> 
            <tr><td align="center"><p>
                    <font color="red" size="5" style="font-family: simhei">请登录</font><p>
                    <form method= "post" name="Regsiter" action="checkUser.jsp" target="_blank"><p> 
                            用户名：<input type="text" name="loginName" size="20"><p >
                            密码：<input type="password" name="password" size ="20"><p >
                            <input type="button" value= "提交" name="B1" onclick=" RegsiterSubmit()">
                            <input type="reset" value= "重置" name="B2">
                    </form>
                </td></tr> 
        </table>
    </body>
</html> 
