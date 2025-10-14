<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="16kb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- page 디렉티브 태그에 출력 버퍼 크기를 16KB로 설정하기 -->
	Today is <%= new Date() %><br>
	Today is <%= LocalDate.now() %>
</body>
</html>