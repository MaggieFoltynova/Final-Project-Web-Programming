<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="appLayer.user.UserDAO"%>
<%@ page import="appLayer.user.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Web programming lab</title>
</head>
<body>
<%
String userID = (String)session.getAttribute("userID");
String userClass = (String)session.getAttribute("userClass");
%>
	<h1>
		Main page <br>
	</h1>
	<%
	if(userID == null){
	%>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/LoginPage.jsp">Login</a> <br> <br>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/UserRegistrationPage.jsp">Registration</a>
	<%
	} else if(userID.equals("root")){
	%>
		<p>hello master</p> <br>
		<form action="./LogoutAction.jsp" method="post">
			<input type="submit" value="Log out">
		</form> <br>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/AdminPage.jsp">Change member information 멤버 숙청하기</a>
	<%
	} else{
	%>
		<p>hello <%=userID %></p>
		<p>Your Class : <%=userClass %></p>
		<form action="./LogoutAction.jsp" method="post">
			<input type="submit" value="Log out">
		</form> <br>
	<%
		if(userClass.equals("Buyer")){
	%>		
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/BuyerPage.jsp">Shopping</a>	
	<%	
		} else{
	%>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/ProductRegistrationPage.jsp">register new product</a>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/SellerPage.jsp">My products</a>
	<%
		}
	}
	%>
	
</body>
</html>
