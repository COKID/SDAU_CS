<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'shujudelete_input.jsp' starting page</title>
  </head>  
  <body>
    <%
    request.setCharacterEncoding("utf-8");
    //int id=Integer.parseInt(request.getParameter("id"));
    String name=request.getParameter("name");
    String driverName = "com.mysql.jdbc.Driver";    //驱动程序名
    
	String userName = "root";                          //数据库用户名
	String userPwd = "";                        //密码
	String dbName = "student";                        //数据库名
	String  url1="jdbc:mysql://localhost:3306/"+dbName;
	String url2 ="?user="+userName+"&password="+userPwd;
	String  url3="&useUnicode=true&characterEncoding=UTF-8";
	String url =url1+url2+url3;        //形成连接字
	Class.forName(driverName);         //加载并注册驱动程序
	Connection conn=DriverManager.getConnection(url);//获取数据库连接对象
    
    String sql="delete from stu_info where name like '%"+name+"%'";
    PreparedStatement pst=conn.prepareStatement(sql);
   // pst.setString(1,name);
    int n=pst.executeUpdate();
    if(n>=1)
    {out.println("数据删除成功！！");}
    else
    {out.println("数据删除失败！！");}
     %>
  </body>
</html>