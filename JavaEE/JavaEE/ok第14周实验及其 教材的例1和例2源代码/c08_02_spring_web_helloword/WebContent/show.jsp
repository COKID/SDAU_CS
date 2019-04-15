<%@page import="com.edu.HelloBean"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
      <%
        // (1)首先通过request对象，获取web服务器容器
        ServletContext sc=request.getServletContext();              
        //(2)利用Spring框架提供ServletContext的静态方法，从Web服务器中获取 Spring容器 
		WebApplicationContext wact =WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
		// (3)只声明一个对象
		HelloBean student;
		// (4)从实例容器act中，分别获取3个学生对象，并显示信息
		student = (HelloBean) wact.getBean("stu1");
		//(5)利用Jsp脚本获取 数据 碧昂显示 
		%>		
		 姓名：<%=student.getStudentName()%><br>
		 课程名：<%=student.getCourse()%><br>		 
		 成绩：<%=student.getScore()%><br>
		--------------------------------------<br>
		<%student = (HelloBean) wact.getBean("stu2"); %>
		 姓名：<%=student.getStudentName()%><br>
		 课程名：<%=student.getCourse()%><br>		 
		 成绩：<%=student.getScore()%><br>
		--------------------------------------<br>
		<%student = (HelloBean) wact.getBean("stu3"); %>
		 姓名：<%=student.getStudentName()%><br>
		 课程名：<%=student.getCourse()%><br>		 
		 成绩：<%=student.getScore()%><br>
		--------------------------------------
</body>
</html>