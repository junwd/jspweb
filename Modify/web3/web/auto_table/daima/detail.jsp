<%@ page language="java" import="java.util.*"
         pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath
            = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01
    Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>修改学生信息.jsp' starting
            page</title>
        <meta http-equiv="pragma"
              content="no-cache">
        <meta http-equiv="cache-control"
              content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords"
              content="keyword1,keyword2,keyword3">
        <meta http-equiv="description"
              content="This is my page">
        <!--
        <link rel="stylesheet" type="text/css"
        href="styles.css">
        -->
    </head>
    <body>
        <%
            /*调用 request.getParameter 方法获取超链接传
        递过来的数据*/
            String xh = request.getParameter("xh");
        %>
        <!-- 创建表单，action 为将要跳转的页面地址，采
        用 post 方法传递， onSubmit 调用 js 方法进行表单验证
        -->
        <form action =
              "auto_table/daima/table.jsp?xh=<%=xh%>" method
              ="post"
              name ="myform" onSubmit="return
                      CheckPost()">
            <table align = "center" border = 2px width
                   = 60% height = 100px>
                <caption ><font size=6 >修改学生信息
                    </font></caption>
                <tr><th>学号</th><th>姓名</th><th>电话号码
                    </th><th>班级</th></tr>
                <tr align = "center" >
                    <td><input type = text value=<%=xh%> name
                               = <%=xh%> disabled="disabled"/></td>
                    <td><input type = text name = xm /></td>
                    <td><input type = text name = tel /></td>
                    <td><input type = text name = grade /></td>
                </tr>
            </table>
            <center>
                <input type = submit value ="提交" >
                <input type =reset value ="重置">
            </center>
        </form>
        <script>
            /* 创建 CheckPost 方法进行表单验证，
             myform 为表单的姓名 xm 为表单需要验证的参数
             value 表示这个参数的值 */
            function CheckPost()
            {
                /* 值为空判断 */
                if (myform.xm.value == "")
                {
                    alert("请填写姓名");
                    myform.xm.focus();
                    return false;
                }
                /*电话号码不是五位判断 */
                if (myform.tel.value.length != 5)
                {
                    alert("电话号码是五个字符");
                    myform.tel.focus();
                    return false;
                }
                /* 班级为空判断 */
                if (myform.grade.value.length == "")
                {
                    alert("未填写班级");
                    myform.grade.focus();
                    return false;
                }
            }
        </script>
    </body>
</html>