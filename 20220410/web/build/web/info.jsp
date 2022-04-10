<%@ page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:useBean id="db" class="dbBean.DBcon" scope="session"/>
<center><h2>投票结果</h2>
    <table border bordercolor="#0099FF">
        <tr><th bgcolor='#CCFFFE'>选项</h><th bgcolor='#CCFF>得票数</th><th bgco1or'#CCFFFF'>比例</th>
                <% int totalNum = 0;
                    ResultSet rs = db.executeQuery("select sum(count)from vote");
                    if (rs.next()) {
                        totalNum = rs.getInt(1);
                    }
                    rs.close();
                    rs = db.executeQuery("select * from vote");
                    while (rs.next() && totalNum != 0) {
                        out.println("<tr>");
                        int num = rs.getInt("count");
                        out.println("<td>" + rs.getString("item") + "</td>");
                        out.println("<td>得：" + num + "票共：" + totalNum + "票</td>");
                        out.println("<td>得票率：");
                        out.println("<img src='back.gif'width='" + num * 200 / totalNum + "height='8'>");
                        out.println(num * 100 / totalNum + "&</td>");
                    }
                    rs.close();
                    db.close();
                %>
    </table>
    <p><a href="vote.jsp">返回投票页面</a>
</center>