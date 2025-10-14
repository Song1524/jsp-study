<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- page 디렉티브 태그에 콘텐츠 유형을 마이크로소프트 워드 문서로 설정하기 -->
	<%
		// 저장할 파일명을 지정
		response.setContentType("text/xml; charset=UTF-8");
	%>
	<h2>contentType 디렉티브 태그</h2>
	<h4>text/xml: XML 출력</h4>
	<h4>charset=UTF-8: 문자 인코딩</h4>
</body>
</html>