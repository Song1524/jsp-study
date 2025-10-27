<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
	
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 북마켓 프로젝트 만들기 -->
	<!-- 한글 출력하기 -->
	<%!
		String greeting = "도서 쇼핑몰에 오신 것을 환영합니다.";
		String tagline = "Welcome to Web Market!";
	%>
	
	<div class="container py-4">
		<!-- 헤더(메뉴) 영역 -->
		<%@ include file="/menu.jsp" %>

		<!-- 중간 타이틀 영역 -->
		<c:set var="msg" value="${param.msg}" />
		<c:choose>
			<c:when test="${msg == '0' || msg == '2'}">
				<jsp:include page="/title.jsp">
		    	<jsp:param value="회원 정보" name="title"/>
		    	<jsp:param value="Membership Info" name="sub"/>
		    </jsp:include>
			</c:when>
			<c:when test="${msg == '1'}">
				<jsp:include page="/title.jsp">
		    	<jsp:param value="회원 가입" name="title"/>
		    	<jsp:param value="Membership Info" name="sub"/>
		    </jsp:include>
			</c:when>
		</c:choose>
		
		<!-- 본문 영역 -->
    <div class="row align-items-md-stretch text-center">
    	<c:choose>
    		<c:when test="${msg == '0'}">
    			<h2 class="alert alert-danger">회원정보가 수정되었습니다.</h2>
    		</c:when>
    		<c:when test="${msg == '1'}">
    			<h2 class="alert alert-danger">회원가입을 축하합니다.</h2>
    		</c:when>
    		<c:when test="${msg == '2'}">
    			<h2 class="alert alert-danger">${sessionScope.loginId}님 환영합니다.</h2>
    		</c:when>
    		<c:otherwise>
    			<h2 class="alert alert-danger">회원정보가 삭제되었습니다.</h2>
    		</c:otherwise>
    	</c:choose>
 		</div>

		<!-- 푸터(바닥글) 영역 -->
    <%@ include file="/footer.jsp" %>
  </div>
</body>
</html>