<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="appLayer.user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Sunday meeting</title>
</head>
<body>
	<h1>
		Registration Page <br>
	</h1>
	<form method="post">
		<label>ID</label> <br>
		<input type="text" name="userID">
		<input type="submit" formaction="./CheckIDAction.jsp" value="Duplicate">  <br>
		<label>Password</label> <br>
		<input type="password" name="userPassword"> <br>
		<label>Name</label> <br>
		<input type="text" name="userName"> <br>
		<input type="radio" name="Classification" value="Buyer"> Buyer<br>
		<input type="radio" name="Classification" value="Seller"> Seller<br>
		<input type="submit" formaction="./UseregistrationAction.jsp" value="Registration">
	</form>
</body>
</html>
