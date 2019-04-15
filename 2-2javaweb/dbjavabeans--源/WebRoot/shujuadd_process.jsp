<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="dao.UserDao" %>
<%@ page import="model.User" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>信息添加处理</title>
  </head>
  <body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="oneuser" class="model.User"></jsp:useBean>
<jsp:setProperty property="*" name="oneuser"/>
<%
	UserDao useroper=new UserDao();
	int n=useroper.add(oneuser);
	if(n>=1)
		out.print("数据插入成功");
	else
		out.print("数据插入失败");
 %>
  </body>
</html>
