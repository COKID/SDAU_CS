<%@page import="javax.xml.ws.RequestWrapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript">
function sendRequest(){
	
	// var uu = "jsondemo";    
	 $.ajax({
		  type:"get",
		  dataType:"json",
		  url:"JsonDemo",
		  data:{"a":1,"b":2},
		  success:function(data){
		  	alert(JSON.stringify(data));
			$.each(data,function(name,value) {
            	alert(name+":"+value);
        	});
			
		 }
	  });
}

</script>
</head>
<body>
<h2>Hello Daotie</h2>
<input type="button" value=" json demo " onclick="sendRequest()">
</body>
</html>