<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>信息查询输入</title>
  </head>  
  <body>
    <form name="form1" action="shujuselect_process.jsp" method="post">
    	学号：<input type="text" name="userid"><br/>
    	姓名：<input type="text" name="username"><br/>
    	<input type="submit" value="查询">    	<input type="reset" value="取消">
    </form>
  </body>
</html>
