<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>信息添加处理</title>
  </head>
  <body>
       <% 
       //获取数值
request.setCharacterEncoding("utf-8");
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String sex=request.getParameter("sex");
int age=Integer.parseInt(request.getParameter("age"));
float weight=Float.parseFloat(request.getParameter("weight"));
float height=Float.parseFloat(request.getParameter("height"));

String driverName = "com.mysql.jdbc.Driver";    //驱动程序名
String userName = "root";                          //数据库用户名
String userPwd = "sa";                        //密码
String dbName = "student";                        //数据库名
String  url1="jdbc:mysql://localhost:3306/"+dbName;
String url2 ="?user="+userName+"&password="+userPwd;
String  url3="&useUnicode=true&characterEncoding=UTF-8";
String url =url1+url2+url3;        //形成连接字
Class.forName(driverName);         //加载并注册驱动程序
Connection conn=DriverManager.getConnection(url);//获取数据库连接对象
String sql="insert into stu_info values(?,?,?,?,?,?)";
PreparedStatement pst=conn.prepareStatement(sql);
pst.setInt(1,id);
pst.setString(2,name);
pst.setString(3,sex);
pst.setInt(4,age);
pst.setFloat(5,weight);
pst.setFloat(6,height);
int n=pst.executeUpdate();
if(n==1)
	out.print("数据插入成功！！");
else
	out.print("数据插入失败！！");
if(pst!=null) pst.close();
if(conn!=null) conn.close();		
     %>
  </body>
</html>
