<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%
		String number = request.getParameter("number");
	%>
	<c:set var="number" value="${param.number}" />
	<!-- 다중 조건문: if-else if-else 와 동일 -->
	<c:choose>
		<c:when test="${number % 2 == 0}">
			<c:out value="${sumber}"> 짝수입니다.</c:out>
		</c:when>
		<c:when test="${number % 2 != 0}">
			<c:out value="${sumber}"> 홀수입니다.</c:out>
		</c:when>
		<c:otherwise>
			숫자가 아닙니다.
		</c:otherwise>
	</c:choose>
	
</body>
</html>