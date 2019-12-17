<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="appLayer.user.UserDAO"%>
<%@ page import ="appLayer.user.UserDTO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
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
		<span> <%= userInfo.getUserPassword() %>&emsp;</span>
		<span> <%= userInfo.getUserName() %>&emsp;</span>
		<span> <%= userInfo.getUserClass() %>&emsp;</span>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/AdminDeleteAction.jsp?userID=<%=userInfo.getUserID() %>">KILL</a>
		<a href="http://localhost:8080/Final-Project-Web-Programming-master/AdminModifyPage.jsp?userID=<%=userInfo.getUserID() %>">Modify</a>
		<span> <br> </span>
	<%
		}
	%>
</body>
</html>