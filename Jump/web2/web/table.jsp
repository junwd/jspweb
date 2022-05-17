<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="bean.Student"%>
<html>
	<body>
		<%
			//数组中预先准备好数据
			Student[] stu = { new Student("001", "欧巴马", "13844488101"),
					new Student("002", "李刚好", "13848888108"),
					new Student("003", "胡规范", "18844488158") };
			    //List中预先准备好数据
			List lstu = new ArrayList();
			lstu.add(new Student("2101", "黄晓敏", "18843488111"));
			lstu.add(new Student("2103", "季试第", "18844488103"));
			lstu.add(new Student("2104", "章里好", "18745488145"));
		%>
		<table border="1" bgcolor="#aa8899">
			<tr>	<td>	学号</td><td>姓名</td><td>联系电话</td>
			</tr>
			<%
				for (int i = 0; i < stu.length; i++) {  //从数组中取出数据放入表格中
			%>
			<tr>
				<td><%=stu[i].getXh()%></td>
				<td><%=stu[i].getName()%></td>
				<td><%=stu[i].getTeleno()%></td>
			</tr>
			<%
				}
			%>
		</table>
		  
		<table border="1" bgcolor="#ddaa99">  
			<tr><td>学号</td><td>姓名</td><td>联系电话</td></tr>
			<%
				for (int i = 0; i < lstu.size(); i++) {  //从List中取出数据放入表格中
			%>
			<tr>
				<td><%=((Student) lstu.get(i)).getXh()%></td>
				<td><%=((Student) lstu.get(i)).getName()%></td>
				<td><%=((Student) lstu.get(i)).getTeleno()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<br> 	

<%--从List中取出数据放入表格中【学号带超链接】--%>
		<table border="1" bgcolor="#aaff77">
			<tr><td>学号</td><td>姓名</td><td>联系电话</td></tr>
			<%
				for (int i = 0; i < lstu.size(); i++) {
			%>
			<tr>
				<td>
					<a href=index.jsp?xh=<%=((Student) lstu.get(i)).getXh()%>>
<%=((Student) lstu.get(i)).getXh()%>  </a>
				</td>
				<td><%=((Student) lstu.get(i)).getName()%></td>
				<td><%=((Student) lstu.get(i)).getTeleno()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>
