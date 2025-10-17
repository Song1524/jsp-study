<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		response.setHeader("Refresh", "5");
	
		LocalDateTime now = LocalDateTime.now();
		
		out.println(now);
	%> 	
	<p>
		<a href="response_process.jsp">이동하기</a>
	</p>
</body>
</html>