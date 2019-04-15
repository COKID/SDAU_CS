<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="dao.UserDao" %>
<%@ page import="model.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>信息查询处理</title>
  <style type="text/css">
	table,td
	{
	border:1px solid blue;
	}
</style>
  </head>  
  <body>
  <%request.setCharacterEncoding("utf-8"); %>
  <jsp:useBean id="oneuser" class="model.User"></jsp:useBean>
  <jsp:setProperty property="userid" name="oneuser"/>
  <%
  String userid=oneuser.getUserid();
  UserDao useroper=new UserDao();
  User selectlist=useroper.findUserById(userid); 
/*   for(int i=0;i<selectlist.;i++) 
  { */
  	%>
      <table >
    	<tr>
    	<td>记录条数</td>
    	<td>学号</td>
    	<td>姓名</td>
    	<td>性别</td>  	   	    	    	    	    	
    	</tr>

    	<tr>
    	<td></td>
    	<td><%=selectlist.getUserid()%></td>
    	<td><%=selectlist.getUsername()%></td>
    	<td><%=selectlist.getSex() %></td>	
    	</tr>
<%-- <%} %> --%>
    </table>     
  </body>
</html>
