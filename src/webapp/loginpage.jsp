<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Sunday meeting</title>
</head>
<body>
	<h1>
		Log in page <br>
	</h1>
	<form action="./LoginAction.jsp" method="post">
		<label>ID</label> <br>
		<input type="text" name="userID"> <br>
		<label>Password</label> <br>
		<input type="password" name="userPassword"> <br>
		<input type="submit" value="Log in">
	</form>
</body>
</html>