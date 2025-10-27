<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<sql:setDataSource var="dataSource" url="jdbc:mysql://127.0.0.1:3306/jspbookdb"
										 driver="com.mysql.cj.jdbc.Driver" user="root" password="a010203" /> 
										 
	<sql:update var="resultSet" dataSource="${dataSource}">
		INSERT INTO member (id, passwd, name) VALUES (?, ?, ?)
		<sql:param value="${param.id}"></sql:param>
		<sql:param value="${param.passwd}"></sql:param>
		<sql:param value="${param.name}"></sql:param>
	</sql:update>
	
	결과: <c:out value="${result}"></c:out>
	
	<!-- JSTL 버전의 동적 include: 해당 JSP 의 실행 결과(HTML)를 가져와 붙임 -->
	<c:import url="sql01.jsp"></c:import>
	
</body>
</html>