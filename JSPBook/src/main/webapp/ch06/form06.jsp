<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Processing</title>
</head>
<body>
	<!-- 회원가입 양식에서 폼 데이터 한번에 전송 받기 -->
	<h3>회원가입</h3>
	<form action="form06_process.jsp" name="member" method="post">
		<p>
			아이디: <input type="text" name="id">
			<button type="button">아이디 중복검사</button>
		</p>
		<p>
			비밀번호: <input type="password" name="pw">
		</p>
		<p>
			이름: <input type="text" name="name">
		</p>
		<p>
			연락처: 
			<select name="phone1">
				<option value="010">010</option>			
				<option value="011">011</option>			
				<option value="016">016</option>			
				<option value="017">017</option>			
				<option value="019">019</option>			
			</select>
			 - 
			<input type="text" name="phone2" style="width: 50px;"> - 
			<input type="text" name="phone3" style="width: 50px;">
		</p>
		<p>
			성별: <input type="radio" name="sex" checked="checked" value="남성">남성 
			<input type="radio" name="sex" value="여성">여성
		</p>
		<p>
			취미: 독서<input type="checkbox" checked="checked" name="hobby" value="독서"> 
			운동<input type="checkbox" name="hobby" value="운동"> 
			영화<input type="checkbox" name="hobby" value="영화">
		</p>
		<p>
			<textarea rows="3" cols="30" name="comment" placeholder="가입인사를 입력해주세요"></textarea>
		</p>
		<p>
			<button type="submit">가입하기</button>
			<button type="reset">다시쓰기</button>
		</p>
	</form>
</body>
</html>