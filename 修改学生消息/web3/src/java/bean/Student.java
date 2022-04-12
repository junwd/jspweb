package bean;
public class Student {
private String xh;
private String name;
private String tel;
private String grade;
public Student(){}
public Student(String xh,String name,String
tel,String grade)
{
this.grade = grade;
this.name = name;
this.tel = tel;
this.xh = xh;
}
public void setName(String name){this.name =
name;}
public String getName(){return
name;}
public void setXH(String xh){this.xh = xh;}
public String getXH() {return xh;}
public void setTel(String tel){this.tel =
tel;}
public String getTel(){return tel;}
public void setGrade(String
grade){this.grade = grade;}
public String getGrade(){return grade;}
}