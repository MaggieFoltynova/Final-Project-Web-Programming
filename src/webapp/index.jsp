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
<%
	String userID = (String)session.getAttribute("userID");
%>
	<h1>
		Main page <br>
	</h1>
	<%
	if(userID == null){
	%>
	<a href="http://localhost:8080/Sunday/loginpage.jsp">Login</a> <br> <br>
	<a href="http://localhost:8080/Sunday/registrationpage.jsp">Registration</a>
	<%
	} else {
	%>
	<p>hello <%=userID %></p>
	<form action="./LogoutAction.jsp" method="post">
		<input type="submit" value="Log out">
	</form> <br>
	<a href="http://localhost:8080/Sunday/modifypage.jsp">Change member information</a> <br> <br>
	<a href="http://localhost:8080/Sunday/withdrawalpage.jsp">membership withdrawal</a>
	<%} %>
</body>
</html>