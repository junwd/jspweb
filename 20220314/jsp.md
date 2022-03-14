JSP表格实验
实验目的：
巩固JSP代码段，利用JSP代码段，动态生成表格，表格数据来自内存中的数组或集合类容器（如List容器），为以后学习数据库时从数据库获取数据放入表格做准备。
集合类知识回顾
集合类是容器类的数据结构，包括：List、Map、Set。
List  －－按对象进入的顺序保存对象，不做排序或编辑操作。其中的值允许重复，因为其为有序的数据结构 。
Map －－是基于"键"的成对的数据结构，健值必须具有唯一性（键不能相同，否则值会被替换）。
Set －－对每个对象只接受一次，并使用自己内部的排序方法。其中的值不允许重复，是无序的数据结构。
List 和 Set是由 Collection 接口派生的两个接口。 
实验内容：
使用JSP程序段动态生成表格，表格数据来自数组或集合类容器，如图4-4所示。

         
图4-4 表格数据来自数组或List容器
实验步骤：
（1）编写实体类bean/Student.java
Student.java参考代码：
package bean;
public class Student {
	private String xh;
	private String name;
	private String teleno;
	public Student(){ }
	public Student(String xh,String name,String teleno){
		this.xh=xh;
		this.name=name;
		this.teleno=teleno;
	  }
	public String getXh() {return xh;}
	public void setXh(String xh) {this.xh = xh;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;	}
	public String getTeleno() {return teleno;}
	public void setTeleno(String teleno) {this.teleno = teleno;}
}
2、table.jsp从数组和List容器中取出数据放入表格中。
table.jsp参考代码：
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
					<a href=detail.jsp?xh=<%=((Student) lstu.get(i)).getXh()%>>
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

detail.jsp参考代码：
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
    <title>detail.jsp</title>
  </head>  
  <body>
    <%   //对于中文参数，要重新解码编码。
         String xh=request.getParameter("xh"); //获得请求参数 
           //byte[] bytes=xh.getBytes("ISO-8859-1");//用ISO-8859-1分解成字节数组  
           //xh=new String(bytes,"utf-8");//将字节数组重新解码成字符串 
    %>
          学号为 <font size=4 color="red"><%=xh%></font> 同学的详细信息如下<br>
          <img src=../img/<%=xh%>.jpg>    
  </body>
</html>

（3）在地址栏输入URL，观察浏览器显示效果，如图4-5所示。

图4-5 动态表格运行效果

3、tablemap.jsp从Map集合类容器获取数据，填入表格中。
tablemap.jsp参考代码：
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="bean.Student"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>JSP表格数据来自于集合容器MAP实验</title>
  </head>
  <body>
    <%//在Map集合中放入3个对象，在从集合容器中取出数据放入表格输出
    	Map mstu=new HashMap();      
    	mstu.put("A011", new Student("001","奥小马","13844488101")); 
    	mstu.put("A012", new Student("002","普小京","13848888108"));
   		mstu.put("A013", new Student("003","平通生","18844488158"));
   %>
   <hr> 从Map中获取数据<br>
   <table  border="1" bgcolor="#aaff88">
   <tr><th>学号</th><th>姓名</th></tr>
   <%  
   Set xhSet = mstu.keySet(); //获得学号的Set集合
   Object[] xh_A = xhSet.toArray(); //将学号的Set集合转为xh_A数组，以便根据Key获取Value
       Student ss=new Student(); 
       for (int i = 0; i < xh_A.length; i++) { 
           //根据从学号数组中取出的学号键值到Map中找出Student对象
            ss=(Student)mstu.get((String)xh_A[i]);
         %>
         <tr><td><%=ss.getXh()%></td><td><%=ss.getName()%></td></tr>
    <%} %>
    </table>
  </body>
</html>
程序运行效果如图4-6所示。

图4-6 表格数据来自Map容器
拓展训练：
将自己班级的同学信息存入数组和集合类容器，再以表格形式输出数组和集合类中的同学信息。
