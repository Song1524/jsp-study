<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward 결과</title>
</head>
<body>
    <%
        String danParam = request.getParameter("dan");
        int dan = Integer.parseInt(danParam);
    %>

    <%
        for (int i = 1; i <= 9; i++) {
    %>
        <%= dan %> x <%= i %> = <%= dan * i %> <br>
    <%
        }
    %>
</body>
</html>
