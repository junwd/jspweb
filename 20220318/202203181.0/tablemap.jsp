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