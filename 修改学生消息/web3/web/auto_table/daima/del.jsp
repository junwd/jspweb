<%@ page language="java" import="java.util.*"
         import="java.net.*" pageEncoding="utf-8"%>
<%@ page import = "bean.Student" %>
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
        <title>My JSP 'del.jsp' starting
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
        <!-- 获取需要删除的学生传递过来的参数 ，调用
        URLDecoder.decode 对中文字符进行解码-->
        <%
            String del_xh = request.getParameter("xh");
            String del_tel = request.getParameter("tel");
            String del_xm
                    = URLDecoder.decode(request.getParameter("xm"), "gbk");
            String del_grade
                    = URLDecoder.decode(request.getParameter("grade"), "gbk");
        %>
        <!-- 使用表单提交删除的学生信息 -->
        <form action =
              "auto_table/daima/table.jsp?del_xh=<%=del_xh%>
              " method = "post" >
            <!-- 显示需要删除的学生信息 -->
            <table align = "center" border = 2px width =
                   60% height = 100px>
                <caption>要删除的学生信息</caption>
                <tr><th>学号</th><th>姓名</th><th>电话号码
                    </th><th>班级</th></tr>
                <tr align = "center" >
                    <td><input type = text
                               value=<%=del_xh%> name = <%=del_xh%>
                               disabled="disabled"/></td>
                    <td><input type = text
                               value=<%=del_tel%> name = <%=del_tel%>
                               disabled="disabled"/></td>
                    <td><input type = text
                               value=<%=del_xm%> name =<%=del_xm%>
                               disabled="disabled"/></td>
                    <td><input type = text
                               value=<%=del_grade%> name = <%=del_grade%>
                               disabled="disabled"/></td>
                </tr>
            </table>
            <center>
                <input type = submit value ="确定删除">

                <input type =button value ="取消删除" onclick= "back()">
            </center>
        </form>
        <script>

            function back() {
                window.location.href("auto_table/daima/table.
                        jsp");
            }
        </script>
    </body>
</html>