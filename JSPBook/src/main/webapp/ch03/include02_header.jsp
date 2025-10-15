<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int pageCount = 0;
		void addCount() {
			pageCount++;
		}
	%>
	<%
		addCount();
	%>
	<header>
		<p>이 사이트 방문은 <% out.print(pageCount); %>번째입니다.</p>
	</header>
	
</body>
</html>