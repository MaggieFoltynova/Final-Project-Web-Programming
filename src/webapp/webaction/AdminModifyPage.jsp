<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="appLayer.user.UserDAO"%>
<%@ page import ="appLayer.user.UserDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
%>
	<h1> Modify '<%=userID %>'</h1>
	<form method="post">
		<input type="radio" name="field" value="userPassword"> Change Password<br>
		<input type="password" name="userPassword"> <br>
		
		<input type="radio" name="field" value="userName"> Change Name<br>
		<input type="text" name="userName"> <br>
		
		<input type="radio" name="field" value="userClass"> Change Class<br>
		<input type="radio" name="userClass" value="Buyer"> Buyer<br>
		<input type="radio" name="userClass" value="Seller"> Seller<br>
		
		<input type="submit" formaction="./AdminModifyAction.jsp?userID=<%=userID %>" value="Modify">
	</form>
</body>
</html>