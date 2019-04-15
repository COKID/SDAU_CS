<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>信息添加输入</title>
  </head>  
  <body>
    <form name="form1" action="shujuadd_process.jsp" method="post">
    <table>
    	<tr><td>学号</td><td><input type="text" name="id"></td></tr>
    	<tr><td>姓名</td><td><input type="text" name="name"></td></tr>
    	<tr><td>性别</td><td><input type="text" name="sex"></td></tr>
    	<tr><td>年龄</td><td><input type="text" name="age"></td></tr>
    	<tr><td>体重</td><td><input type="text" name="weight"></td></tr>
    	<tr><td>身高</td><td><input type="text" name="height"></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="提交">
			<input type="reset" value="取消">
		</td></tr>    	    	    	    	
    </table>
    </form>
  </body>
</html>
