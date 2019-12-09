<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="appLayer.user.UserDAO"%>
<%@ page import="appLayer.user.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
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
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/ModifyUserPage.jsp">Change member information</a>
	<%
	} else {
	%>
		<p>hello <%=userID %></p>
		<form action="./LogoutAction.jsp" method="post">
			<input type="submit" value="Log out">
		</form> <br>
	<%
	}
	%>

	<h1>
		<br> show all user list
	</h1>
	<p>
		(userID) (userName) (userClass)
	<p>
	<%
		ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
		userList = new UserDAO().getList();
		for(int i = 0; i < userList.size(); ++i) {
			UserDTO userInfo = userList.get(i);
	%>
		<span> <%= userInfo.getUserID() %>&emsp;</span>
		<span> <%= userInfo.getUserName() %>&emsp;</span>
		<span> <%= userInfo.getuserClass() %>&emsp;</span>
		<span> <br> </span>
	<%
		}
	%>
	
</body>
</html>
