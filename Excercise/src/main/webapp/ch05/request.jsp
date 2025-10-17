<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		input 태그 내에 text 유형을 이용하여 아이디, 비밀번호 항목을 작성한다.
		form 태그의 action 속성 값은 request_process.jsp로, method 속성 값은 get으로 작성한다.
	 -->
 	<form action="request_process.jsp" method="get">
	 	<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p> 	
		<button type="submit">전송</button>
 	</form>
 	
</body>
</html>