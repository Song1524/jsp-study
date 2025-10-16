<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Object</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("id");
		String userPw = request.getParameter("passwd");
		
		if ("admin".equals(userId) && "1234".equals(userPw)) {
			response.sendRedirect("response01_success.jps");
		} else {
			response.sendRedirect("response01_failed.jps");
		}
	%>

</body>
</html>