<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit</title>
</head>
<body>

	<%
		// 폼(입력방식)에서 입력한 한글을 처리하도록 request 내장 객체의 메소드에 문자 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
	%>
	
	<p>아이디: <%= id %></p>
	<p>비밀번호: <%= pw %></p>
	
	<!-- EL 사용 시 -->
	<!-- param -> request.getParameter()와 동일한 역활 -->
	<p>아이디: ${param.id}</p>
	<p>비밀번호: ${param.pw}</p>

</body>
</html>