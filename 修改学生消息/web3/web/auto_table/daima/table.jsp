<%@ page language="java" import="java.util.*"
         import ="java.net.*" pageEncoding="gbk"%>
<%
    String path = request.getContextPath();
    String basePath
            = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page import ="bean.Student" %>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>�Զ���д���</title>
        <meta http-equiv="pragma"
              content="no-cache">
        <meta http-equiv="cache-control"
              content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords"
              content="keyword1,keyword2,keyword3">
        <meta http-equiv="description"
              content="This is my page">
    </head>
    <body>
        <form action = "detail.jsp" method = "post">
            <%!
                Student[] stu = {new Student("001", "����", "10080", "2020 ������ 4 ��"),
                    new Student("002", "����", "10081", "2020 ������ 4 ��"),
                    new Student("003", "����", "10082", "2020 ������ 4 ��"),
                    new Student("004", "����", "10083", "2020 ������ 4 ��")};
            %>
            <%
                request.setCharacterEncoding("utf-8");
                String xh = request.getParameter("xh");
                String xm = request.getParameter("xm");
                String tel = request.getParameter("tel");
                String grade
                        = request.getParameter("grade");

                Student xiugai_Stu = new Student(xh, xm, tel, grade);
            %>
            <%
                String del_xh
                        = request.getParameter("del_xh");
            %>
            <%
                for (int i = 0; i < stu.length; i++) {

                    if (xiugai_Stu.getXH() == null) {
                        break;
                    }

                    if (xiugai_Stu.getXH().equals(stu[i].getXH())) {
                        stu[i].setName(xiugai_Stu.getName());
                        stu[i].setTel(xiugai_Stu.getTel());
                        stu[i].setGrade(xiugai_Stu.getGrade());
                    }
                }

                for (int i = 0; i < stu.length; i++) {

                    if (del_xh == null) {
                        break;
                    }
                    if (stu[i] == null) {
                        continue;
                    }

                    if (del_xh.equals(stu[i].getXH())) {

                        stu[i] = null;
                    }
                }
            %>
            <table align = "center" border = 2px width
                   = 60% height = 300px>
                <caption ><font size=6 >ѧ����Ϣ��
                    </font></caption>
                <tr> <th>ѧ��</th> <th>����</th> <th>��
                        ������</th> <th>�༶</th> <th>�޸�</th><th>ɾ��
                    </th></tr>
                    <%
                        for (int i = 0; i < stu.length; i++) {
                    %>

                <%
                    if (stu[i] == null) {

                        continue;
                    }%>

                <tr align = "center">
                    <td><%=stu[i].getXH()%></td>
                    <td><%=stu[i].getName()%></td>
                    <td><%=stu[i].getTel()%></td>
                    <td><%=stu[i].getGrade()%></td>

                    <td>
                        <a
                            href=auto_table/daima/detail.jsp?xh=<%=stu[i].getXH()%>>����޸�ѧ����Ϣ</a></td>
                    <td>
                        <a href="auto_table/daima/del.jsp?xh=<%=stu[i].getXH()%>&xm=<%=URLEncoder.encode(stu[i].getName(), "utf-8")%>&tel=<%=stu[i].getTel()%>&grade=<%=URLEncoder.encode(stu[i].getGrade(), "utf-8")%>">���ɾ��ѧ����Ϣ</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>